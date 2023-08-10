import 'dart:async';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  Stream<int> streamFuncA() async* {
    for(int i=0;i<5;i++){
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  void onPressA() async {
    await for ( int value in streamFuncA() ){
      print("value:$value");
    }
  }

  void onPressB(){
    streamFuncA().listen((event) {
      print("value:$event");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onPressB, child: Text('onPressB'))
            ],
          ),
        ),
      ),
    );
  }

}