import 'package:book/mobile/userdetail.dart';
import 'package:book/providers/homeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  // final bool openSetting;
  final PageController pageController;
  final HomeProvider homeProvider;
  Profile({this.pageController,this.homeProvider});

  @override
  _State createState() => _State();
}

class _State extends State<Profile> {


  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          color: Colors.red,
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 200),
          bottom: 0,
          left: 0,
          right: 0,
          top: 0,
          child: UserDetail(homeProvider:widget.homeProvider,pageController: widget.pageController,),
        )
      ],
    );
  }
}
