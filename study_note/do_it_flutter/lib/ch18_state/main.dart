import 'package:ch_08/ch18_state/ContentWidget.dart';
import 'package:ch_08/ch18_state/IconWidget.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(ParentWidget());
}

class ParentWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return ParentWidgetState();
  }
}

class ParentWidgetState extends State<ParentWidget>{

  bool favovited = false;
  int count = 0;
  int childCount = 0;
  GlobalKey<ChildWidgetState> childKey = GlobalKey();

  void getChildData(){
    ChildWidgetState? childState = childKey.currentState;
    setState(() {
      childState?.childCount = childState!.childCount + 1;
      childCount = childState?.childCount ?? 0;
    });

  }

  void onParentChanged() {
    print('onChanged');
    setState(() {
      favovited = favovited ? false : true;
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('State Test'),
        ),
        body:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    child: Text('I am Parent. child count : $childCount'),
                  ),
                  ElevatedButton(onPressed: getChildData, child: Text('get childData'))
                ],
              ),
              ChildWidget(key: childKey,),
              IconWidget(favorited: favovited, onChanged: onParentChanged,),
              ContentWidget(favoriteCount: count,),

              //ChildWidget(key: childKey,),
              //Text('test')
            ],
          ),
      ),
    );
  }
}

class ChildWidget extends StatefulWidget{
  //const ChildWidget({super.key});
  ChildWidget({Key? key}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    return ChildWidgetState();
  }
}

class ChildWidgetState extends State<ChildWidget> {
  int childCount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text('I am child : $childCount'),
        ),
        ElevatedButton(onPressed: () {
          setState(() {
            childCount++;
          });
        },
            child: Text('increment'))
      ],
    );
  }
}