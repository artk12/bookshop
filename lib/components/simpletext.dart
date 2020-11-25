import 'package:book/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  final String text;
  final Function onTap;
  final int fontSize;
  final FontWeight fontWeight;
  final double height;
  final Color color;
  SimpleText(
      {this.height = 1.2,
      this.text,
        this.color = Colors.black,
      this.onTap,
      this.fontSize,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        "$text",
        style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontFamily: "iranian_sans",
            height: height,
            fontSize: fontSize != null ? fontSize + 0.0 : null,
            shadows: [
              // Shadow(
              //   offset: Offset(0.0, 0.0),
              //   blurRadius: 20.0,
              //   color: Colors.black38,
              // ),
            ]),
      ),
    );
  }
}
