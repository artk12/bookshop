import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFieldWithOutLabel extends StatelessWidget {
  final IconData iconData;
  final Function(String) onChange;
  final bool obscureText;
  final bool autoFocus;
  final FocusNode focusNode;

  SearchFieldWithOutLabel(
      {this.iconData, this.onChange, this.obscureText = false,this.autoFocus = false,this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      child: TextField(
        onChanged: onChange,
        focusNode: focusNode,
        obscureText: obscureText,
        autofocus: autoFocus,
        maxLines: 1,
        style: TextStyle(//textColor
          color: Colors.blue,
          fontFamily: "iranian_sans",
        ),
        cursorColor: Colors.black38,
        decoration: InputDecoration(
          hintText: 'جستجو همه چیز . . .',
          hintStyle: TextStyle(
              fontSize: 12,//hint color
              color: Colors.blue,
              fontFamily: "iranian_sans",
              fontWeight: FontWeight.w300),
          prefixIcon: iconData != null//text color
              ? Icon(iconData, color: Colors.blue)
              : null,
          // focusColor: MyColor.focusField,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),//un focus color
            borderSide: BorderSide(color: Colors.blue, width: 0.8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),//focus color
            borderSide: BorderSide(color: Colors.blue, width: 0.8),
          ),
          labelStyle: TextStyle(
              fontSize: 12,
              color: Colors.blue,
              fontFamily: "iranian_sans",
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
