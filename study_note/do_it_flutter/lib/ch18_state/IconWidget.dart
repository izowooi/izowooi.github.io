import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget
{
  final bool favorited;
  final Function onChanged;

  IconWidget({this.favorited: false,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text('I am IconWidget'),
        ),
        IconButton(
          onPressed: (){
            onChanged();
            },
          icon: favorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          color: Colors.red,
          iconSize: 200,
        ),
      ],
    );
  }
}