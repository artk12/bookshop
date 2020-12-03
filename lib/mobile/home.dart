import 'package:book/mobile/bottomSheet.dart';
import 'package:book/mobile/homeAppBar.dart';
import 'package:book/mobile/searchpage.dart';
import 'package:book/mobile/myProfile.dart';
import 'package:book/providers/homeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'allBookPage.dart';
import 'archive.dart';
import 'homePage.dart';

class MobileHome extends StatefulWidget {
  createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> with TickerProviderStateMixin {
  AnimationController _animationController;
  bool keyPad = false;
  bool searchMode = false;
  FocusNode focusNode = new FocusNode();
  double lastPixel = 0;
  double bottomSheetPosition = 0;
  Animation<double> _fadeInFadeOutSearchPage;
  Animation<double> _fadeInFadeOutMainPage;
  Animation<double> _scaleMainPage;
  Animation<double> _scaleSearch;
  Animation<double> _searchFieldAnimation;
  PageController pageController = new PageController();

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    _fadeInFadeOutSearchPage =
        Tween<double>(begin: 1.0, end: 1.0).animate(_animationController);
    _fadeInFadeOutMainPage =
        Tween<double>(begin: 1.0, end: 1.0).animate(_animationController);
    _searchFieldAnimation =
        Tween<double>(begin: 0.8, end: 1.0).animate(_animationController);
    _scaleSearch =
        Tween<double>(begin: 0.9, end: 1.0).animate(_animationController);
    _scaleMainPage = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease,
      ),
    );
    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed &&
          searchMode) {
        FocusScope.of(context).requestFocus(focusNode);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    Function searchIconPress = () {
      setState(() {
        _scaleMainPage = Tween<double>(begin: 1.0, end: 0.8).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.ease,
          ),
        );
        _fadeInFadeOutSearchPage = Tween<double>(begin: 0.8, end: 1.0).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.ease,
          ),
        );
        searchMode = true;
      });
      _animationController.reset();
      _animationController.forward();
    };

    Function backIconInSearchMode = () async {
      focusNode.unfocus();
      await Future.delayed(Duration(milliseconds: 200));
      setState(() {
        _fadeInFadeOutMainPage = Tween<double>(begin: 0.9, end: 1.0).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.ease,
          ),
        );
        searchMode = false;
        _scaleMainPage = Tween<double>(begin: 1.2, end: 1.0).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.ease,
          ),
        );
      });
      _animationController.reset();
      _animationController.forward();
    };

    return Scaffold(
      appBar: HomeAppBar(
        homeProvider: homeProvider,
        pageController: pageController,
        focusNode: focusNode,
        animationController: _animationController,
        backIconInSearchMode: backIconInSearchMode,
        searchFieldAnimation: _searchFieldAnimation,
        searchIconPress: searchIconPress,
        searchMode: searchMode,
      ),
      body: SafeArea(
        child: searchMode
            ? FadeTransition(
                opacity: _fadeInFadeOutSearchPage,
                child:
                    ScaleTransition(scale: _scaleSearch, child: SearchPage()),
              )
            : NotificationListener(
                onNotification: (ScrollNotification notification) {
                  if (notification.metrics.axis.index == 1) {
                    if (lastPixel != 0 &&
                        lastPixel < notification.metrics.pixels) {
                      //down
                      if (bottomSheetPosition > -50) {
                        setState(() {
                          bottomSheetPosition -= 1;
                        });
                      }
                    } else if (lastPixel != 0 &&
                        lastPixel > notification.metrics.pixels) {
                      //up
                      if (bottomSheetPosition < 0) {
                        setState(() {
                          bottomSheetPosition += 1;
                        });
                      }
                    }
                    if (notification.metrics.maxScrollExtent >
                            notification.metrics.pixels &&
                        notification.metrics.pixels > 0) {
                      lastPixel = notification.metrics.pixels;
                    }
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: PageView(
                        controller: pageController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ScaleTransition(
                            scale: _scaleMainPage,
                            child: FadeTransition(
                                opacity: _fadeInFadeOutMainPage,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: bottomSheetPosition + 135),
                                  child: HomePage(),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: bottomSheetPosition + 135),
                            child: Archive(),
                          ),
                          MyProfile(
                            pageController: pageController,
                            homeProvider: homeProvider,
                          ),
                          AllBookPage(
                            pageController: pageController,
                          ),
                        ],
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 10),
                      bottom: homeProvider.page == 3
                          ? -50
                          : homeProvider.page == 2 ? 0 : bottomSheetPosition,
                      left: 0,
                      child: MyBottomSheet(
                        pageController: pageController,
                        homeProvider: homeProvider,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
