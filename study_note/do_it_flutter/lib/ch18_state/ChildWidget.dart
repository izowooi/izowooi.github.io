import 'package:flutter/material.dart';

class ChildWidget extends StatefulWidget{
  //const ChildWidget({super.key});
  ChildWidget({Key? key}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    return ChildWidgetState();
  }
}

class ChildWidgetState extends State<ChildWidget> {
  int childCount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text('I am child : $childCount'),
        ),
        ElevatedButton(onPressed: () {
          setState(() {
            childCount++;
          });
        },
            child: Text('increment'))
      ],
    );
  }
}