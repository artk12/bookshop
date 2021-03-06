import 'package:book/components/bookcard.dart';
import 'package:book/modules/contents.dart';
import 'package:book/providers/homeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  final HomeProvider homeProvider;
  final PageController pageController;
  MyProfile({this.homeProvider, this.pageController});

  @override
  Widget build(BuildContext context) {
    ThemeData myTheme = Theme.of(context);

    return WillPopScope(
      onWillPop: () async {
        // if(pageController.page == 1){
        //   pageController.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        //   return false;
        // }else
        //   return true;
        return true;
      },
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: myTheme.scaffoldBackgroundColor,
          child: Column(
            children: [
              SizedBox(height: 10,),
              CircleAvatar(
                radius: 55,
                backgroundColor: Color.fromARGB(255, 40, 40, 40),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/images/profile_tupac.jpg'),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'توپاک',
                      style: myTheme.textTheme.headline2,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Text(
                          'هرچه می بینی باید حس شوخ طبعی خودتو حفظ کنی.تو باید بتونی با وجود تمام مزخرفات لبخند بزنی.',
                          style:
                              myTheme.textTheme.bodyText1.copyWith(height: 1.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '١٩',
                      style: myTheme.textTheme.subtitle1,
                    ),
                    Text(
                      ' کتاب آپلود شده ',
                      style: myTheme.textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'کتابهای من',
                      style: myTheme.textTheme.subtitle1,
                    ),
                    FlatButton(
                      onPressed: () async {
                        pageController.animateToPage(3,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                        homeProvider.updatePage(3);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Text(
                        'نمایش بیشتر',
                        style: myTheme.textTheme.subtitle1.copyWith(
                          color: Color.fromARGB(255, 0, 133, 181),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 9,
                    shrinkWrap: false,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: BookCart(
                          index: index,
                          name: Contents.names[index],
                          rating: Contents.rating[index],
                          photo: Contents.covers[index],
                          book: Contents.bookNames[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.cyan
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.50, 0);
    path_0.quadraticBezierTo(size.width * 0.88, 0, size.width, 0);
    path_0.cubicTo(size.width * 1.00, size.height * 1.00, size.width * 1.00,
        size.height * 1.00, size.width * 0.50, size.height);
    path_0.cubicTo(size.width * -0.00, size.height * 1.00, size.width * -0.00,
        size.height * 1.00, 0, 0);
    path_0.quadraticBezierTo(size.width * 0.13, 0, size.width * 0.50, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
