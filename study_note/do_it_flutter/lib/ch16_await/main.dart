import 'dart:async';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  Future<int> funA() {
    return Future.delayed(Duration(seconds: 3), () {
      return 10;
    });
  }

  Future<int> funB(int num) {
    return Future.delayed(Duration(seconds: 2), () {
      return num * num;
    });
  }

  Future<int> calFunc() async{
    int aResult = await funA();
    int bResult = await funB(aResult);
    return bResult;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: FutureBuilder(
          future: calFunc(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Center(
                child: Text(
                  '${snapshot.data}',
                  style: TextStyle(color: Colors.black, fontSize: 30),),
              );
            }
            return Center(
              child: Text('대기 중',
                style: TextStyle(color: Colors.black, fontSize: 30),),
            );
          },
        ),
      ),
    );
  }

}