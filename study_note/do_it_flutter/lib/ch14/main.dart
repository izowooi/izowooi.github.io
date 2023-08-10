import 'package:ch_08/ch08/main.dart';
import 'package:flutter/material.dart';
import 'one_screen.dart';
import 'two_screen.dart';
import 'three_screen.dart';
import 'four_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: '/one',
      routes: {
        '/one': (context) => OneScreen(),
        '/two': (context) => TwoScreen(),
        '/three': (context) => ThreeScreen(),
        '/four': (context) => FourScreen(),
      },
    );
  }
}
