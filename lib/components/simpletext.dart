import 'package:book/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  final String text;
  final Function onTap;
  final int fontSize;
  final FontWeight fontWeight;
  SimpleText({this.text, this.onTap, this.fontSize,this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        "$text",
        style: TextStyle(
          fontWeight: fontWeight,
          fontFamily: "iranian_sans",
          color: MyColor.textColor, height: 1.5,
          fontSize: fontSize != null ? fontSize + 0.0 : null,
          shadows: [
            // Shadow(
            //   offset: Offset(0.0, 0.0),
            //   blurRadius: 20.0,
            //   color: Colors.black38,
            // ),
          ]
        ),
      ),
    );
  }
}
