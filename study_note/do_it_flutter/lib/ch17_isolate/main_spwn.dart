import 'dart:isolate';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

String topData = 'init_data';

class MyApp extends StatelessWidget{

  String memberData = 'init_data';

  void myIsolate1(var arg){
    Future.delayed(Duration(seconds: 3),(){
      print('Isolate1 arg:$arg, topData:$topData, memberData:$memberData');
    });
  }

  void myIsolate2(var arg){
    Future.delayed(Duration(seconds: 2),(){
      print('Isolate2 arg:$arg, topData:$topData, memberData:$memberData');
    });
  }

  void onPress(){
      print('onPress before, topData:$topData, memberData:$memberData');
      Isolate.spawn(myIsolate1, 10);
      Isolate.spawn(myIsolate2, 10);
      topData = 'after_data';
      memberData = 'after_data';
      print('onPress after, topData:$topData, memberData:$memberData');
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
              ElevatedButton(onPressed: onPress, child: Text('onPress'))
            ],
          ),
        ),
      ),
    );
  }

}