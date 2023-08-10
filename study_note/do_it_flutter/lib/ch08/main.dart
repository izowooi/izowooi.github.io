import 'package:flutter/material.dart';

class MyREDItemWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyREDItemWidget(Colors.red);
  }
}

class _MyREDItemWidget extends State<MyREDItemWidget>{
  Color color;
  _MyREDItemWidget(this.color);

  @override
  Widget build(BuildContext context) {

    return Expanded(child: Container(
      color: color,
      width: 150,
      height: 150,
    ));
  }
}

class MyBLUEItemWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyBLUEItemWidget(Colors.blue);
  }
}

class _MyBLUEItemWidget extends State<MyBLUEItemWidget>{
  Color color;
  _MyBLUEItemWidget(this.color);

  @override
  Widget build(BuildContext context) {

    return Expanded(child: Container(
      color: color,
      width: 150,
      height: 150,
    ));
  }
}

class MyColorItemWidget extends StatefulWidget{
  Color color;
  MyColorItemWidget(this.color, {super.key});
  @override
  State<StatefulWidget> createState() {
    return _MyColorItemWidget(color);
  }
}

class _MyColorItemWidget extends State<MyColorItemWidget>{
  Color color;
  _MyColorItemWidget(this.color);

  @override
  Widget build(BuildContext context) {

    return Expanded(child: Container(
      color: color,
      width: 150,
      height: 150,
    ));
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget()
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState02();
}

class _MyWidgetState01 extends State<MyWidget> {
  bool enabled = false;
  String stateText = "disable";

  void changeCheck(){
    setState(() {
      debugPrint('enabled!:$enabled');
      if(enabled){
        stateText = "disable";
        enabled = false;
      }
      else{
        stateText = "enable";
        enabled = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: changeCheck,
            icon: (enabled ? const Icon(Icons.check_box, size: 20,)
                : const Icon(Icons.check_box_outline_blank, size: 20,)),
            color: Colors.red,
          ),
          Container(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                '$stateText',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
          ),
        ],
      ),
    );
  }
}

class _MyWidgetState02 extends State<MyWidget> {
  List<Widget> widgetList = [
    MyColorItemWidget(Colors.red, key: UniqueKey()),
    MyColorItemWidget(Colors.blue, key: UniqueKey()),
  ];

  onChange() {
    setState(() {
      widgetList.insert(1, widgetList.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('print..$widgetList.length');
    return Scaffold(
      appBar: AppBar(title: Text('Key Test'),),
      body: Column(
        children: [
          Row(children: widgetList,),
          ElevatedButton(onPressed: onChange, child: Text('Toggle')),

        ],
      ),
    );
  }
}
