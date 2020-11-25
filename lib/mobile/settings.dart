import 'package:book/providers/homeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    print(homeProvider.openSetting);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(color: Colors.white),
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              top: 0,
              left: homeProvider.openSetting
                  ? MediaQuery.of(context).size.width / 2.6
                  : 0,
              right: 0,
              bottom: 0,
              child: ChangeNotifierProvider.value(
                value: homeProvider,
                child: MobileHome(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
