import 'package:book/mobile/settings.dart';
import 'package:book/providers/dragController.dart';
import 'package:book/providers/homeProvider.dart';
import 'package:book/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Theme());
}

class Theme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: HomeProvider(),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget child) {
        return new Directionality(
          textDirection: TextDirection.rtl,
          child: new Builder(
            builder: (BuildContext context) {
              return new MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0,
                ),
                child: child,
              );
            },
          ),
        );
      },
      theme: light,
      home: ChangeNotifierProvider.value(
        value: homeProvider,
        child: ChangeNotifierProvider.value(
          value: DragController(),
          child: Settings(),
        ),
      ),
    );
  }
}
