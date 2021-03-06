import 'package:book/components/bookcard.dart';
import 'package:book/modules/contents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllBookPage extends StatelessWidget {
  final PageController pageController;
  AllBookPage({this.pageController});

  List<Widget> bookWidgets(int rows, int index) {
    List<Widget> books = [];
    for (int i = 0; i < rows; i++) {
      
      books.add(
        rows * index + i < Contents.bookNames.length - i
            ? Expanded(
                flex: 1,
                child: BookCart(
                  name: Contents.names[rows * index + i],
                  rating: Contents.rating[rows * index + i],
                  photo: Contents.covers[rows * index + i],
                  book: Contents.bookNames[rows * index + i].length>6?Contents.bookNames[rows * index + i].substring(0,4)+'..':Contents.bookNames[rows * index + i],
                  index: rows * index + i,
                ),
              )
            : Expanded(
                flex: 1,
                child: Container(),
              ),
      );
    }

    return books;
  }

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width / 90;
    int truncate = x.truncate();
    double numberAfterDot = x - x.truncate();
    if (numberAfterDot < 0.6) {
      truncate = truncate - 1;
    }

    int count = 0;
    for (int i = 0; i < 20; i = i + truncate) {
      count++;
    }

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(children: bookWidgets(truncate, index)),
                );
              },
              childCount: count,
            ),
          ),
        ],
      ),
    );
  }
}
