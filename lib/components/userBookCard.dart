import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserBoolCard extends StatelessWidget {
  final String imageName;
  UserBoolCard({this.imageName});
  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width/100 )*(100/3.2) ;
    double height = (MediaQuery.of(context).size.width/100 )*(100/2.3) ;

    return Container(
      // width: 200,
      child: Column(
        children: [
          Container(
            height: height,
            width: width,
            // padding: EdgeInsets.all(6),
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                'assets/images/$imageName',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
