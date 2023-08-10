import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class MyAppState extends State<MyApp>
{
  String result = '';

  onTouchGet() async {
    var headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    http.Response response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
        headers: headers);

    if (response.statusCode == 200) {
      setState(() {
        result = response.body;
      });
    }
  }

  onTouchPost() async{

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
              Text('result:$result'),
              ElevatedButton(onPressed: onTouchGet, child: Text('TouchGet'),),
              ElevatedButton(onPressed: (){print('encode');}, child: Text('encode'),),
            ],
          ),
        ),
      ),
    );
  }
}