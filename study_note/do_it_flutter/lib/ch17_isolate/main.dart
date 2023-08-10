import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';

void myIsolate(SendPort mainPort) {
  ReceivePort subPort = ReceivePort();
  mainPort.send({'port': subPort.sendPort});
  subPort.listen((message) {
    if (message['msg'] == 'bye') {
      subPort.close();
    } else {
      int count = message['msg'];
      mainPort.send({'msg' : count * count});
    }
  });
}

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

class MyAppState extends State<MyApp>{
  String result = 'test';

  void onPress() async{
    ReceivePort mainPort = ReceivePort();
    await Isolate.spawn(myIsolate, mainPort.sendPort);

    SendPort? subPort;
    mainPort.listen((message) {
      print('message:$message');
      if(message['port'] != null){
        subPort = message['port'];
      } else if ( message['msg'] != null){
        setState(() {
          result = 'msg : ${message['msg']}';
        });
      }
    });

    int count = 0;
    Timer.periodic(Duration(seconds: 1), (timer){
      count++;
      if(count < 6){
        subPort?.send({'msg':count});
      }else{
        subPort?.send({'msg':'bye'});
        mainPort.close();
      }
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
              Text(result, style: TextStyle(fontSize: 30),),
              ElevatedButton(onPressed: onPress, child: Text('test1'))
            ],
          ),
        ),
      ),
    );
  }

}