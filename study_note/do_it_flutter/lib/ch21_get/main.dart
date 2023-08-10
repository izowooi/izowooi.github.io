import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CounterController extends GetxController{
  int count = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment(){
    count++;
    update();
  }

  void decrement(){
    count--;
    update();
  }
}

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provider Test'),
        ),
        body: GetBuilder(
          init: CounterController(),
          builder: (_){
            return MyWidget();
          },
        )
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(builder: (controller) {
      return Container(
        color: Colors.orange,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Getx: ${controller.count}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                ElevatedButton(onPressed: () {
                  controller.increment();
                }
                    , child: Text('increment')
                ),
                ElevatedButton(onPressed: () {
                  controller.decrement();
                }
                    , child: Text('decrement')
                ),
              ],
            )
        ),
      );
    });
  }
}