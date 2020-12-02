import 'package:book/requests/sp.dart';
import 'package:book/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{

  bool openSetting = false;
  bool notificationCheck = false;
  bool darkTheme = false;
  int page = 0;
  ThemeData theme = light;
  double left = 0;
  double lastPos = 0;
  double maxDrag;
  double diff = 0;
  double lastDx = 0;

  void updateLeft(val){
    this.left = val;
    notifyListeners();
  }
  void updateLastDX(val){
    this.lastDx = val;
    notifyListeners();
  }

  void updateLastPos(val){
    this.left = val;
    notifyListeners();
  }

  void updatePage(int i){
    page = i;
    notifyListeners();
  }

  void openCloseDrawerManual(bool val){
    openSetting = val;
    notifyListeners();
  }

  void onChangeNotification(bool val){
    notificationCheck = val;
    notifyListeners();
  }

  void onChangeTheme(bool val){
    darkTheme = val;
    if(val)
      theme = dark;
    else
      theme = light;

    Sp.changeTheme(val);

    notifyListeners();
  }

}