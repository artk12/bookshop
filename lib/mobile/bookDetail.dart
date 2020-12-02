import 'package:book/modules/contents.dart';
import 'package:book/providers/homeProvider.dart';
import 'package:book/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailPage extends StatefulWidget {
  final String tag;
  final String imgPath;
  final String name;
  final String bookName;
  BookDetailPage({this.imgPath, this.tag, this.bookName, this.name});
  createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  double topPic;
  double rightPic;
  int updateDrag = 0;
  double lastScrollPos = 0;
  double height = 0;
  double scale = 0;
  double detailScale = 0;
  double lineHeight = 1;
  double descriptionTop = 0;
  bool maxTop = false;
  double offsetAdded = 0;
  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData myTheme = Theme.of(context);
    HomeProvider homeProvider = context.watch<HomeProvider>();
    height = MediaQuery.of(context).size.height + updateDrag;
    rightPic = ((MediaQuery.of(context).size.width / 2) - (180 / 2));
    topPic = (MediaQuery.of(context).size.height -
            (MediaQuery.of(context).size.height / 1.4)) -
        (250 / 2);
    // }

    return Scaffold(
      backgroundColor: homeProvider.darkTheme? DarkColor.background:LightColor.backgroundBookDetail,
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragUpdate: (_) {},
          onVerticalDragUpdate: (DragUpdateDetails drag) {

            if (drag.delta.dy < 0) {
              setState(() {
                if (MediaQuery.of(context).size.height - 118 > height / 1.4) {
                  updateDrag += 1;
                  if (scale < 0.3) {
                    scale += 0.005;
                  }
                } else {
                  offsetAdded += 1;
                  scrollController.jumpTo(scrollController.offset + 1);
                }
                // descriptionTop +=1;
                if (detailScale < 0.9) {
                  detailScale += 0.1;
                }
                if (lineHeight > 0.1) {
                  lineHeight -= 0.01;
                }
              });
            } else {
              if (updateDrag != 0) {
                setState(() {
                  if (offsetAdded == 0) {
                    if (scale >= 0.0) {
                      scale -= 0.005;
                    }

                    if (detailScale >= 0.2 &&
                        (MediaQuery.of(context).size.height / 2 + 12) >
                            height / 2) {
                      detailScale -= 0.1;
                    }
                    if (lineHeight < 1) {
                      lineHeight += 0.01;
                    }
                    updateDrag -= 1;
                  } else {
                    offsetAdded -= 1;
                    scrollController.jumpTo(scrollController.offset - 1);
                  }
                });
              }
            }
          },
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Color.fromARGB(255, 71, 71, 71),
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: height / 1.4,
                  decoration: BoxDecoration(
                      color: myTheme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                ),
              ),
              Positioned(
                top: topPic - updateDrag,
                left: rightPic,
                child: Transform.scale(
                  scale: 1.0 - scale,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 250,
                        width: 180,
                        child: Hero(
                          tag: widget.tag,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              widget.imgPath,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: myTheme.primaryColor,
                                blurRadius: 10,
                                offset: Offset(0, 10))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        widget.name,
                        style: myTheme.textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.bookName,
                        style: myTheme.textTheme.headline1,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: rightPic + 250 + 65 - updateDrag,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: lineHeight,
                      decoration: BoxDecoration(color: Colors.black12),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: rightPic + 250 + 65 - (updateDrag * 1.5),
                right: 0,
                left: 0,
                child: Transform.scale(
                  scale: 1 - detailScale,
                  child: DefaultTabController(
                    length: 2,
                    child: Container(
                      child: Column(
                        children: [
                          TabBar(
                            // indicatorWeight: 1,
                            indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(width: 1.0),
                              insets: EdgeInsets.symmetric(horizontal: 80.0),
                            ),
                            tabs: [
                              Tab(
                                child: Text(
                                  'اطلاعات کتاب',
                                  style: myTheme.textTheme.subtitle1,
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'صاحب کتاب',
                                  style: myTheme.textTheme.subtitle1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 80,
                            child: TabBarView(
                              physics: BouncingScrollPhysics(),
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('انگلیسی',
                                                style: myTheme
                                                    .textTheme.headline2),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'زبان',
                                              style:
                                                  myTheme.textTheme.subtitle1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('سخت',
                                                style: myTheme
                                                    .textTheme.headline2),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('جلد',
                                                style: myTheme
                                                    .textTheme.subtitle1),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('455',
                                                style: myTheme
                                                    .textTheme.headline2),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('صفحات',
                                                style: myTheme
                                                    .textTheme.subtitle1),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('4.5',
                                                style: myTheme
                                                    .textTheme.headline2),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('امتیاز',
                                                style: myTheme
                                                    .textTheme.subtitle1),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'نشر نی',
                                              style:
                                                  myTheme.textTheme.headline2,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('انتشارات',
                                                style: myTheme
                                                    .textTheme.subtitle1),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('هادی فرهادی',
                                                style: myTheme
                                                    .textTheme.headline2),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text('مترجم',
                                                style: myTheme
                                                    .textTheme.subtitle1),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'ایون شرت',style: myTheme
                                                .textTheme.headline2
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'نویسنده',style: myTheme
                                                .textTheme.subtitle1
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //rightPic + MediaQuery.of(context).size.height/1.4
              Positioned(
                top: topPic +
                    MediaQuery.of(context).size.height / 1.3 -
                    (updateDrag * 2.9),
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  height: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).size.height / 2),
                  child: ListView(
                    controller: scrollController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Row(
                        children: [
                          // SizedBox(width: 20,),
                          Text(
                            'توضیحات : ',
                            style: myTheme.textTheme.headline4,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            Contents.description + Contents.description,
                                style: myTheme.textTheme.bodyText1,
                          )),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
