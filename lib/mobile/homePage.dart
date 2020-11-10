import 'package:book/components/bookcard.dart';
import 'package:book/components/simpletext.dart';
import 'package:book/components/trendBookCart.dart';
import 'package:book/modules/contents.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: SimpleText(
                    text: 'پرفروشترین ها :',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 290,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: List.generate(
                  10,
                      (index) => Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: 10),
                      child: BookCart(
                        book: Contents.bookNames[index],
                        name: Contents.names[index],
                        photo: Contents.covers[index],
                        rating: Contents.rating[index],
                      ))),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: SimpleText(
                text: 'پربازدید ها :',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            List.generate(
              7,
                  (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: TrendBookCart(
                  bookName: Contents.topBookNames[index],
                  photo: Contents.topCovers[index],
                  rating: Contents.topRating[index],
                  category: Contents.category[index],
                  index: index,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
