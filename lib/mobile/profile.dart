import 'package:book/mobile/userdetail.dart';
import 'package:book/providers/homeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

    return UserDetail(homeProvider:widget.homeProvider,pageController: widget.pageController,);
  }
}
