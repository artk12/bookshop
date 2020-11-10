import 'package:book/components/simpletext.dart';
import 'package:book/modules/contents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    // if(rightPic == null){
    height = MediaQuery.of(context).size.height + updateDrag;
    rightPic = ((MediaQuery.of(context).size.width / 2) - (180 / 2));
    topPic = (MediaQuery.of(context).size.height -
            (MediaQuery.of(context).size.height / 1.4)) -
        (250 / 2);
    // }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 71, 71, 71),
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragUpdate: (_) {},
          onVerticalDragUpdate: (DragUpdateDetails drag) {
            // print(drag.delta.dx);
            // print(
            // "h = ${MediaQuery.of(context).size.height - 125} c = ${height / 1.4} m = ${topPic - updateDrag}");
            // print();
            // if(( - 5 ) >= height){
            //   print('OK');
            // }

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
                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.all(10),
                  child: IconButton(
                    onPressed: (){
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
                      color: Color.fromARGB(255, 247, 247, 247),
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
                                color: Colors.black38,
                                blurRadius: 15,
                                offset: Offset(0, 10))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SimpleText(
                        text: widget.name,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SimpleText(
                        text: widget.bookName,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
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
                                child: SimpleText(
                                  text: 'اطلاعات کتاب',
                                ),
                              ),
                              Tab(
                                child: SimpleText(
                                  text: 'صاحب کتاب',
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
                                            SimpleText(
                                              text: 'انگلیسی',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SimpleText(
                                              text: 'زبان',
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
                                            SimpleText(
                                              text: 'سخت',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SimpleText(
                                              text: 'جلد',
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
                                            SimpleText(
                                              text: '455',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SimpleText(
                                              text: 'صفحات',
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
                                            SimpleText(
                                              text: '4.5',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SimpleText(
                                              text: 'امتیاز',
                                            ),
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
                                      // Expanded(
                                      //   flex: 1,
                                      //   child: Column(
                                      //     crossAxisAlignment:
                                      //         CrossAxisAlignment.center,
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.center,
                                      //     children: [
                                      //       SimpleText(
                                      //         text: 'فلسفه',
                                      //         fontSize: 16,
                                      //         fontWeight: FontWeight.bold,
                                      //       ),
                                      //       SizedBox(
                                      //         height: 10,
                                      //       ),
                                      //       SimpleText(
                                      //         text: 'موضوع',
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SimpleText(
                                              text: 'نشر نی',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SimpleText(
                                              text: 'انتشارات',
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
                                            SimpleText(
                                              text: 'هادی فرهادی',
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SimpleText(
                                              text: 'مترجم',
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
                                            SimpleText(
                                              text: 'ایون شرت',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SimpleText(
                                              text: 'نویسنده',
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
                          SimpleText(
                            text: 'توضیحات : ',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: SimpleText(
                            text: Contents.description + Contents.description,
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
