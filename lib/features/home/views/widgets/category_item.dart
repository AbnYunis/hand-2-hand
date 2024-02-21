import 'package:flutter/material.dart';

class MyListItem extends StatelessWidget {
  final int itemNumber;

  const MyListItem(this.itemNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(width*.02),
      child: Column(
        children: [
           CircleAvatar(
            radius: width*.09,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.star,
              color: Colors.white,
              size: width*.07,
            ),
          ),
           SizedBox(height:height*.01 ),
          Text(
            'Item $itemNumber',

          ),
        ],
      ),
    );
  }
}
