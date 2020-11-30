
import 'package:book/providers/homeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  final PageController pageController;
  final HomeProvider homeProvider;
  MyBottomSheet({this.homeProvider,this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                homeProvider.updatePage(2);
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
    );
  }
}
