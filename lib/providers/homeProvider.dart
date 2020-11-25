import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier{

  bool openSetting = true;
  int page = 0;

  void updatePage(int i){
    page = i;
    notifyListeners();
  }

  void openCloseDrawer(){
    openSetting = !openSetting;
    notifyListeners();
  }

}