import 'package:book/colors/colors.dart';
import 'package:book/components/simpletext.dart';
import 'package:book/mobile/bookDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookCart extends StatelessWidget {
  final String photo;
  final String name;
  final String book;
  final double rating;
  final int index;

  BookCart({this.name, this.book, this.photo, this.rating, this.index});

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (c) => BookDetailPage(
                  tag: "$photo$index",
                  imgPath: 'assets/images/$photo',
                  name:name,
                  bookName:book,
                )));
      },
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 150,
            child: Hero(
              tag:"$photo$index",
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'assets/images/$photo',
                    fit: BoxFit.fill,
                  )),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   image: AssetImage('assets/images/$photo')
              // )
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SimpleText(
            text: name,
          ),
          SizedBox(
            height: 8,
          ),
          SimpleText(
            text: book,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          SizedBox(
            height: 6,
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
    );
  }
}
