import 'package:book/components/bookcard.dart';
import 'package:book/components/searchfieldwithoutlable.dart';
import 'package:book/components/simpletext.dart';
import 'package:book/components/trendBookCart.dart';
import 'package:book/mobile/searchpage.dart';
import 'package:book/modules/contents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

class MobileHome extends StatefulWidget {
  createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> with TickerProviderStateMixin {
  AnimationController _animationController;
  // AnimationController _scaleAnimationController;
  bool keyPad = false;
  bool searchMode = false;
  FocusNode focusNode = new FocusNode();
  Animation<double> _fadeInFadeOutSearchPage;
  Animation<double> _fadeInFadeOutMainPage;
  Animation<double> _scaleMainPage;
  Animation<double> _scaleSearch;
  Animation<double> _searchFieldAnimation;

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
                      // _scaleMainPage =
                      //     Tween<double>(begin: 0.8, end: 0.0).animate(
                      //   CurvedAnimation(
                      //     parent: _animationController,
                      //     curve: Curves.ease,
                      //   ),
                      // );
                      // _animationController.reverse();
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
                        // _fadeInFadeOutSearchPage =
                        //     Tween<double>(begin: 1.0, end: 0.0)
                        //         .animate(_animationController);
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
                        // keyPad = false;
                        // _animationController.reverse();
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
            : ScaleTransition(
                scale: _scaleMainPage,
                child: FadeTransition(
                    opacity: _fadeInFadeOutMainPage, child: HomePage()),
              ),
      ),
    );
  }
}
