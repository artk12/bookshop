import 'package:book/providers/dragController.dart';
import 'package:book/providers/homeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    DragController drag = Provider.of<DragController>(context);
    ThemeData myTheme = Theme.of(context);


    if (drag.maxDrag == null) {
      drag.maxDrag = MediaQuery.of(context).size.width * (2 / 3);
    }

    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (_) {},
        onHorizontalDragUpdate: (DragUpdateDetails dragUpdateDetail) async {
          // print(dragUpdateDetail.globalPosition.dx);

          if (homeProvider.page == 2) {
            if (drag.lastDx < dragUpdateDetail.globalPosition.dx) {
              //open
              if (drag.left + 1 >= drag.maxDrag) {
                // homeProvider.openCloseDrawerManual(true);
              }
              if (drag.lastDx > drag.left && drag.left < drag.maxDrag) {
                drag.left += 2;
                drag.updateLastPos(drag.lastPos += 2);
              }
            } else {
              if (drag.left > 0) {
                if (drag.left - 1 <= 0) {
                  // homeProvider.openCloseDrawerManual(false);
                }
                drag.left -= 2;
                drag.updateLastPos(drag.lastPos -= 2);
              }
            }
            drag.updateLastDX(dragUpdateDetail.globalPosition.dx);
          }
        },
        onHorizontalDragEnd: (DragEndDetails dragUpdateDetail)async{
          if(drag.left != 0 && drag.left < drag.maxDrag / 2){
            drag.updateLastPos(0.0);
          }else if (drag.left >= drag.maxDrag / 2 ){
            drag.updateLastPos(drag.maxDrag);
          }
        },
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 100),
                  left: drag.left - drag.maxDrag,
                  height: MediaQuery.of(context).size.height,
                  child: Container(
                    color: Color.fromARGB(255, 235, 235, 235),
                    width: drag.maxDrag,
                    child: Column(
                      children: [
                        Container(
                          height: kToolbarHeight,
                          child: Center(
                            child: Text("تنظیمات",style: myTheme.textTheme.subtitle1,),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 1,
                          color: Colors.black26,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.notifications_none,
                                    size: 15,
                                  ),
                                  Text(" اعلان"
                                      ,style: myTheme.textTheme.subtitle1,
                                  ),
                                ],
                              ),
                              Switch(
                                value: homeProvider.notificationCheck,
                                activeTrackColor: Colors.cyan[400],
                                inactiveThumbColor: Colors.cyan[800],
                                onChanged: homeProvider.onChangeNotification,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.brightness_3,
                                    size: 15,
                                  ),
                                  Text(
                                    " حالت شب",
                                    style: myTheme.textTheme.subtitle1,
                                  ),
                                ],
                              ),
                              Switch(
                                  value: homeProvider.darkTheme,
                                  activeTrackColor: Colors.cyan[400],
                                  inactiveThumbColor: Colors.cyan[800],
                                  onChanged: homeProvider.onChangeTheme),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 1,
                          color: Colors.black26,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("حفظ حریم",style: myTheme.textTheme.subtitle1,),
                              Container(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("ارتباط با ما",style: myTheme.textTheme.subtitle2,),
                              Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 100),
                  top: 0,
                  left: drag.left,
                  right: 0,
                  bottom: 0,
                  child: ChangeNotifierProvider.value(
                    value: homeProvider,
                    child: MobileHome(drag: drag,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
