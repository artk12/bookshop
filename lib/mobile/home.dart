import 'package:book/components/searchfieldwithoutlable.dart';
import 'package:book/components/simpletext.dart';
import 'package:book/mobile/allBookPage.dart';
import 'package:book/mobile/profile.dart';
import 'package:book/mobile/searchpage.dart';
import 'package:book/providers/homeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  bool openSetting = false;
  double bottomSheetPosition = 0;
  Animation<double> _fadeInFadeOutSearchPage;
  Animation<double> _fadeInFadeOutMainPage;
  Animation<double> _scaleMainPage;
  Animation<double> _scaleSearch;
  Animation<double> _searchFieldAnimation;
  PageController pageController = new PageController();
  // int page = 0;

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

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: homeProvider.page == 2 ? Colors.transparent : null,
        backgroundColor: homeProvider.page == 2
            ? Colors.cyan
            : Color.fromARGB(255, 247, 247, 247),
        title: searchMode
            ? Container()
            : homeProvider.page == 3
                ? GestureDetector(
                    onTap: () {
                      pageController.animateToPage(2,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                      homeProvider.updatePage(2);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 14,
                          color: Color.fromARGB(255, 71, 71, 71),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SimpleText(
                          text: 'پروفایل',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 71, 71, 71),
                        )
                      ],
                    ),
                  )
                : SimpleText(
                    text: homeProvider.page == 0
                        ? 'خانه'
                        : homeProvider.page == 1 ? 'علاقه مندی ها' : '',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: homeProvider.page == 2
                        ? Colors.white
                        : Color.fromARGB(255, 71, 71, 71),
                  ),
        actions: [
          !searchMode
              ? Container()
              : ScaleTransition(
                  scale: _searchFieldAnimation,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: SearchFieldWithOutLabel(
                      focusNode: focusNode,
                      iconData: Icons.search,
                      onChange: (t) {},
                    ),
                  ),
                ),
          homeProvider.page == 3
              ? Container()
              : homeProvider.page == 2
                  ? IconButton(
                      onPressed: () {
                        homeProvider.openCloseDrawer();
                      },
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    )
                  : !searchMode
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _scaleMainPage =
                                  Tween<double>(begin: 1.0, end: 0.8).animate(
                                CurvedAnimation(
                                  parent: _animationController,
                                  curve: Curves.ease,
                                ),
                              );
                              _fadeInFadeOutSearchPage =
                                  Tween<double>(begin: 0.8, end: 1.0).animate(
                                CurvedAnimation(
                                  parent: _animationController,
                                  curve: Curves.ease,
                                ),
                              );
                              searchMode = true;
                            });
                            _animationController.reset();
                            _animationController.forward();
                          },
                          icon: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 71, 71, 71),
                          ),
                        )
                      : RotationTransition(
                          turns: Tween(begin: 0.0, end: 2.0)
                              .animate(_animationController),
                          child: IconButton(
                            onPressed: () async {
                              focusNode.unfocus();
                              await Future.delayed(Duration(milliseconds: 200));
                              setState(() {
                                // _fadeInFadeOutMainPage =
                                //     Tween<double>(begin: 0.8, end: 1.0).animate(
                                //   CurvedAnimation(
                                //     parent: _animationController,
                                //     curve: Curves.ease,
                                //   ),
                                // );
                                _fadeInFadeOutMainPage =
                                    Tween<double>(begin: 0.9, end: 1.0).animate(
                                  CurvedAnimation(
                                    parent: _animationController,
                                    curve: Curves.ease,
                                  ),
                                );
                                searchMode = false;
                                _scaleMainPage =
                                    Tween<double>(begin: 1.2, end: 1.0).animate(
                                  CurvedAnimation(
                                    parent: _animationController,
                                    curve: Curves.ease,
                                  ),
                                );
                              });
                              _animationController.reset();
                              _animationController.forward();
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Color.fromARGB(255, 71, 71, 71),
                            ),
                          ),
                        )
        ],
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
                    PageView(
                      controller: pageController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ScaleTransition(
                          scale: _scaleMainPage,
                          child: FadeTransition(
                              opacity: _fadeInFadeOutMainPage,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: bottomSheetPosition + 55),
                                child: HomePage(),
                              )),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: bottomSheetPosition + 55),
                          child: Archive(),
                        ),
                        Profile(
                          pageController: pageController,
                          homeProvider: homeProvider,
                        ),
                        AllBookPage(
                          pageController: pageController,
                        ),
                      ],
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 10),
                      bottom: bottomSheetPosition,
                      // right: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                              child: IconButton(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  pageController.animateToPage(0,
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.ease);
                                  homeProvider.updatePage(0);
                                },
                                icon: Icon(
                                  Icons.home,
                                  color: homeProvider.page == 0
                                      ? Colors.blue
                                      : null,
                                  size: 30,
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                              child: IconButton(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  pageController.animateToPage(1,
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.ease);
                                  homeProvider.updatePage(1);
                                },
                                icon: Icon(
                                  homeProvider.page == 1.0
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 25,
                                  color: homeProvider.page == 1.0
                                      ? Colors.red
                                      : null,
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                              child: IconButton(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  pageController.animateToPage(2,
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.ease);
                                  setState(() {
                                    _scaleMainPage =
                                        Tween<double>(begin: 1.0, end: 1.0)
                                            .animate(
                                      CurvedAnimation(
                                        parent: _animationController,
                                        curve: Curves.ease,
                                      ),
                                    );
                                  });
                                  homeProvider.updatePage(2);
                                  _animationController.reset();
                                  _animationController.forward();
                                },
                                icon: Icon(
                                  Icons.person,
                                  size: 25,
                                  color: homeProvider.page == 2
                                      ? Colors.green
                                      : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black38, width: 1),
                          boxShadow: [
                            BoxShadow(color: Colors.black45, blurRadius: 5)
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
