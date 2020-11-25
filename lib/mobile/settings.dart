import 'package:book/components/simpletext.dart';
import 'package:book/providers/homeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    double left = 0;
    if (homeProvider.openSetting) {
      left = MediaQuery.of(context).size.width / 2.2;
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  color: Color.fromARGB(255, 235, 235, 235),
                  padding: EdgeInsets.only(top:30),
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SimpleText(text:"نوتیفیکیشن"),
                            Switch(
                              value: true,
                              activeTrackColor: Colors.cyan[400],
                              inactiveThumbColor: Colors.cyan[800],
                              onChanged: (v){},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SimpleText(text:"حالت شب"),
                            Switch(
                              value: true,
                              activeTrackColor: Colors.cyan[400],
                              inactiveThumbColor: Colors.cyan[800],
                              onChanged: (v){},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 1,
                        color: Colors.black26,
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SimpleText(text:"حفظ حریم"),
                            Container(),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SimpleText(text:"ارتباط با ما"),
                            Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   child: Stack(
              //     children: [
              //       Align(
              //         alignment: Alignment.centerLeft,
              //         child: Container(
              //           width: MediaQuery.of(context).size.width / 2.2,
              //         ),
              //       ),
              //       Text("hi")
              //     ],
              //   ),
              //   // width: MediaQuery.of(context).size.width / 2.2,
              // ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                top: 0,
                left: left,
                right: 0,
                bottom: 0,
                child: ChangeNotifierProvider.value(
                  value: homeProvider,
                  child: MobileHome(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
