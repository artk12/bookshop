import 'package:book/components/simpletext.dart';
import 'package:book/mobile/bookDetail.dart';
import 'package:book/modules/contents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TrendBookCart extends StatelessWidget {
  final String bookName;
  final String category;
  final double rating;
  final String photo;
  final int index;

  TrendBookCart(
      {this.rating, this.bookName, this.category, this.photo, this.index});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (c) => BookDetailPage(
                  imgPath: 'assets/images/$photo',
                  tag: "$photo$index",
                  name:Contents.names[index],
                  bookName:bookName,
                )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(5)),
        child: Stack(
          children: [
            Positioned(
              top: 40,
              right: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SimpleText(
                    text: bookName,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SimpleText(
                    text: category,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RatingBarIndicator(
                    rating: rating,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 15.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 150,
                width: 100,
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Hero(
                      tag: "$photo$index",
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          'assets/images/$photo',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                    //   Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: DecorationImage(
                    //       image: AssetImage('assets/images/$photo')
                    //     )
                    //   ),
                    // ),
                    ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
