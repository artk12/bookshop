import 'package:book/components/bookcard.dart';
import 'package:book/components/trendBookCart.dart';
import 'package:book/modules/contents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData myTheme = Theme.of(context);

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    'پرفروشترین ها :',style: myTheme.textTheme.headline2,
                  )),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 250,
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
              child: Text(
                'پربازدید ها :',style: myTheme.textTheme.headline2,
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
