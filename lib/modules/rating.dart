import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating {
  static Widget showRating() {
    return RatingBarIndicator(
      rating: 2,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 15.0,
      direction: Axis.horizontal,
    );
  }

  static Widget ratingbar(Function(double) onChange) {
    return RatingBar(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
        size: 5,
      ),
      onRatingUpdate: onChange,
    );
  }
}
