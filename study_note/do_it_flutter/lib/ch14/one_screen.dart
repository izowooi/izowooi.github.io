import 'package:flutter/material.dart';

class OneScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('OneScreen'),),
        body: Container(
          width: 500,
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('OneScreen'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/two');
                  },
                  child: Text('Go Two')
              ),
            ],
          ),
        ),
      ),
    );
  }
}