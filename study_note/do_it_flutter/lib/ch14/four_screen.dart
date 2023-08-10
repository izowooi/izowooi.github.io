import 'package:flutter/material.dart';

class FourScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FourScreen'),),
        body: Container(
          width: 500,
          color: Colors.lightBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('FourScreen'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('pop'))
            ],
          ),
        ),
      ),
    );
  }
}