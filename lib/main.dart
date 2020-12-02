import 'package:book/mobile/settings.dart';
import 'package:book/providers/homeProvider.dart';
import 'package:book/requests/sp.dart';
import 'package:book/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider.value(
      value: Sp.getTheme(),
      child: Theme(),
    );
  }
}


class Theme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool theme = Provider.of<bool>(context) ?? false;
    HomeProvider homeProvider = HomeProvider();
    homeProvider.darkTheme = theme;
    if(homeProvider.darkTheme){
      homeProvider.theme = dark;
    }else{
      homeProvider.theme = light;
    }

    return ChangeNotifierProvider.value(
      value: homeProvider,
      child: Landing(),
    );
  }
}

class Landing extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
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
      theme: homeProvider.theme,
      home: ChangeNotifierProvider.value(
        value: homeProvider,
        child: Settings(),
      ),
    );
  }
}
