import 'package:flutter/material.dart';

class ContentWidget extends StatelessWidget{
  final int favoriteCount;

  ContentWidget({this.favoriteCount = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text('I am ContentWidget, favoriteCount : $favoriteCount'),
        )
      ],
    );
  }

}