import 'package:flutter/material.dart';

class ThreeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ThreeScreen'),),
        body: Container(
          width: 500,
          color: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ThreeScreen'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/four');
                  },
                  child: Text('Go Four')
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Pop')
              ),
            ],
          ),
        ),
      ),
    );
  }
}