import 'package:flutter/material.dart';

class TwoScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('TwoScreen'),),
        body: Container(
          width: 500,
          color: Colors.cyan,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('TwoScreen'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/three');
                  },
                  child: Text('Go Three')
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