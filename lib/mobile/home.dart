import 'package:book/colors/colors.dart';
import 'package:book/components/searchfieldwithoutlable.dart';
import 'package:book/components/simpletext.dart';
import 'package:book/mobile/searchpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  int page = 0;

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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        leading: searchMode
            ? Container()
            : Center(
                child: SimpleText(
                text: 'خانه',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
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
          !searchMode
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
                  turns:
                      Tween(begin: 0.0, end: 2.0).animate(_animationController),
                  child: IconButton(
                    onPressed: () async {
                      focusNode.unfocus();
                      await Future.delayed(Duration(milliseconds: 200));
                      setState(() {
                        _fadeInFadeOutMainPage =
                            Tween<double>(begin: 0.8, end: 1.0).animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.ease,
                          ),
                        );
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
                        Container(),
                        Container(),
                      ],
                    ),

                    Positioned(
                        bottom: bottomSheetPosition,
                        right: 0,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                                child: IconButton(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onPressed: (){
                                    pageController.animateToPage(0, duration: Duration(milliseconds: 200), curve: Curves.ease);

                                    setState(() {
                                      page = 0;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.home,
                                    color: page == 0?Colors.blue:null,
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
                                  onPressed: (){
                                    pageController.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.ease);

                                    setState(() {
                                      page = 1;
                                    });
                                  },
                                  icon: Icon(
                                    page == 1.0?Icons.favorite:Icons.favorite_border,
                                    size: 25,
                                    color: page == 1.0?Colors.red:null,
                                  ),
                                ),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                                child: IconButton(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onPressed: (){
                                    pageController.animateToPage(2, duration: Duration(milliseconds: 200), curve: Curves.ease);

                                    setState(() {
                                     page = 2;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.person,
                                    size: 25,
                                    color: page == 2?Colors.green:null,

                                  ),
                                ),
                              ),
                            ],
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.black38, width: 1),
                              boxShadow: [
                                BoxShadow(color: Colors.black45, blurRadius: 5)
                              ],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              )),
                        ))
                  ],
                ),
              ),
      ),
    );
  }
}
