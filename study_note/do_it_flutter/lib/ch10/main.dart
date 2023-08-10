import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Future<String> useRootBundle() async {
    return await rootBundle.loadString('assets/text/my_text.txt');
  }

  Future<String> useDefaultAssetBundle(BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString(
        'assets/text/my_text.txt');
  }

  onPressed() {
    debugPrint('onPressed()->');
    print('hi');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Test'),
          ),
          body: Column(
            children: [
              Expanded(child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      color: Colors.red,
                      height: 300,
                    ),
                    Container(
                      color: Colors.green,
                      height: 300,
                    ),
                    Container(
                      color: Colors.blue,
                      height: 300,
                    ),
                  ],
                ),
              )
              )
            ],
          )
      ),
    );
  }
}

