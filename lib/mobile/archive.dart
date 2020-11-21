
import 'package:book/components/archiveCard.dart';
import 'package:book/modules/contents.dart';
import 'package:flutter/cupertino.dart';

class Archive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 7,
      itemBuilder: (context,index){
        return ArchiveBookCart(
          bookName: Contents.topBookNames[index],
          photo: Contents.topCovers[index],
          rating: Contents.topRating[index],
          category: Contents.category[index],
          index: index,
        );
      },
    );
  }
}
