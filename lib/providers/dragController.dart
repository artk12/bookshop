import 'package:flutter/foundation.dart';

class DragController extends ChangeNotifier{


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

}