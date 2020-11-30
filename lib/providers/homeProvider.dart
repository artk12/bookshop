import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier{

  bool openSetting = false;
  bool notificationCheck = false;
  bool darkTheme = false;
  int page = 0;
  // bool searchMode = false;

  // void updateSearchMode(){
  //   this.searchMode = !searchMode;
  //   notifyListeners();
  // }

  void updatePage(int i){
    page = i;
    notifyListeners();
  }

  // void openCloseDrawer(){
  //   if (openSetting) {
  //     left = maxDrag;
  //   }else{
  //     left = 0;
  //   }
  //   openSetting = !openSetting;
  //   notifyListeners();
  // }

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
    notifyListeners();
  }

}