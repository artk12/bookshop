import 'package:book/components/userBookCard.dart';
import 'package:book/mobile/myProfile.dart';
import 'package:book/modules/contents.dart';
import 'package:book/providers/homeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData myTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Text(
          'سعید',
          style: myTheme.textTheme.headline1,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: myTheme.primaryColor,
          ),
          onPressed: () {},
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 25, 29, 33),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(65),
                          topLeft: Radius.circular(65),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          radius: 62,
                          backgroundColor: Color.fromARGB(255, 25, 29, 33),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage('assets/images/profile.jpeg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          '٦٨',
                          style:
                              myTheme.textTheme.headline2.copyWith(fontSize: 35),
                        ),
                        Text(
                          'کتاب',
                          style:
                              myTheme.textTheme.headline2.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      child: Text(
                        '"خواندن کتاب های خوب مانند مکالمه ای با بهترین ذهن قرنهای گذشته و حال است."',
                        style:
                            myTheme.textTheme.bodyText1.copyWith(height: 1.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            titleSpacing: 0.0,
            shadowColor: Colors.transparent,
            toolbarHeight: kToolbarHeight - 20,
            title: Container(
              height: kToolbarHeight - 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 1,
                    color: myTheme.dividerColor,
                  ),
                  Container(
                    // margin: EdgeInsets.symmetric(
                    //   vertical: 16,
                    // ),
                    child: Text(
                      "کتابخونه",
                      style: myTheme.textTheme.headline4,
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 1,
                    color: myTheme.dividerColor,
                  ),
                ],
              ),
            ),
            // actions: [
            //
            // ],
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 5),
              child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 5,
                  children: List.generate(
                      10,
                      (index) => UserBoolCard(
                            imageName: Contents.covers[index],
                          ))),
            ),
          ),
        ],
      ),
    );
  }
}
