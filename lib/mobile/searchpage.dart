import 'package:book/components/trendBookCart.dart';
import 'package:book/modules/contents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData myTheme = Theme.of(context);

    return Container(
      // margin: EdgeInsets.only(top: 10),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 30,
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text("نویسنده",style: myTheme.textTheme.subtitle1,),
              ),
              decoration: BoxDecoration(
                color: Colors.black12
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 130,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 12, left: 12, right: 15),
                    padding: EdgeInsets.all(3),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage('assets/images/profile.jpeg'),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'محمد محمدی',
                          style: myTheme.textTheme.subtitle1,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 30,
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  'کتابها',
                  style: myTheme.textTheme.subtitle1,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.black12
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(7, (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: TrendBookCart(
                  bookName: Contents.topBookNames[index],
                  photo: Contents.topCovers[index],
                  rating: Contents.topRating[index],
                  category: Contents.category[index],
                  index: index,
                ),
              ))
            ),
          )
          // ListView.builder(itemCount: 7,itemBuilder: (context,index){
          //   return Container(
          //     margin: EdgeInsets.symmetric(horizontal: 10),
          //     child: TrendBookCart(
          //       bookName: Contents.topBookNames[index],
          //       photo: Contents.topCovers[index],
          //       rating: Contents.topRating[index],
          //       category: Contents.category[index],
          //       index: index,
          //     ),
          //   );
          // })
        ],
      ),
    );
  }
}
