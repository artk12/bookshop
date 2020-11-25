import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier{

  bool openSetting = false;
  bool notificationCheck = false;
  bool darkTheme = false;
  int page = 0;

  void updatePage(int i){
    page = i;
    notifyListeners();
  }

  void openCloseDrawer(){
    openSetting = !openSetting;
    notifyListeners();
  }

  void onChangeNotification(bool val){
    notificationCheck = val;
    notifyListeners();
  }

  void onChangeTheme(bool val){
    darkTheme = val;
    notifyListeners();
  }

}