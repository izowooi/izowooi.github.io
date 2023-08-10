import 'dart:async';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

String topData = 'init_data';

class MyApp extends StatelessWidget{

  myIsolate(SendPort sendPort) {
    Future.delayed(Duration(seconds: 2), (){
      sendPort.send('hello world');
    });
  }

  void onPress1() async{
    print('onPress1(1)->DateTime.now():${DateTime.now()}');
    ReceivePort receiverPort = ReceivePort();
    print('onPress1(2)->DateTime.now():${DateTime.now()}');
    await Isolate.spawn(myIsolate, receiverPort.sendPort);
    print('onPress1(3)->DateTime.now():${DateTime.now()}');
    String data = await receiverPort.first;
    print('onPress1(4)->data:$data');
  }

  void myIsolate2(SendPort sendPort){
    int counter = 0;
    Timer.periodic(new Duration(seconds: 1), (Timer t){
      sendPort.send(++counter);
      print('in timer');
    });
  }

  void onPressListen() async{
    ReceivePort receivePort = ReceivePort();
    Isolate isolate = await Isolate.spawn(myIsolate2, receivePort.sendPort);
    receivePort.listen((message) {
      print('message:$message');
      if(int.parse(message.toString()) > 3 ) {
        receivePort.close();
        isolate.kill(priority: Isolate.immediate);
      } else {
        print('not yet');
      }
    });
  }

  void myIsolate3(SendPort mainPort){
    ReceivePort subPort = ReceivePort();
    mainPort.send({'port':subPort.sendPort});
    subPort.listen((message) {
      if(message['msg'] == 'bye'){
        subPort.close();
      } else {
        int count = message['msg'];
        mainPort.send({'msg': count * count});
      }
    });
  }


  void onPress() async{
    ReceivePort mainPort = ReceivePort();
    Isolate isolate = await Isolate.spawn(myIsolate3, mainPort.sendPort);

    SendPort? subPort;
    mainPort.listen((message) {
      print('onReceived MainPort');
      if(message['port'] != null){
        subPort = message['port'];
      } else if ( message['msg'] != null ){
        print('msg : ${message['msg']}');
      }
    });

    int count = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      if(count < 6){
        subPort?.send({'msg':count});
      } else {
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
              ElevatedButton(onPressed: onPress1, child: Text('onPress1')),
              ElevatedButton(onPressed: onPressListen, child: Text('onPressListen'))
            ],
          ),
        ),
      ),
    );
  }

}