import 'package:book/components/simpletext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 10),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 0.75),
                      blurRadius: 10),
                ],
              ),
              child: TabBar(
                physics: BouncingScrollPhysics(),
                indicatorColor: Colors.black,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 1.0),
                  insets: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0),
                ),
                tabs: [
                  SimpleText(
                    text: 'کتاب ها',
                  ),
                  SimpleText(
                    text: 'نویسنده ها',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(color: Colors.cyan,),
                  Container(color: Colors.teal),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
