import 'dart:convert';

import 'package:flutter/material.dart';
import 'Note.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>
{
  String jsonStr = '{"id":1, "title":"Hello", "completed": false}';
  Note? note;
  String result = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('result:${result}'),
              ElevatedButton(onPressed: onPressDecode, child: Text('decode'),),
              ElevatedButton(onPressed: onPressEncode, child: Text('encode'),),
            ],
          ),
        ),
      ),

    );
  }

  void onPressDecode() {

      var map = jsonDecode(jsonStr);

      note = Note.fromJsonData(map);

      setState(() {
        result = "decode()->id:${note?.id}, title:${note?.title}, completed:${note?.completed}";
      });

  }

  void onPressEncode() {
    setState(() {
      result = "encode:${jsonEncode(note)}";
    });
  }
}