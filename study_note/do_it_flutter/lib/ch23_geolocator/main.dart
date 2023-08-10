import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: NativePluginWidget(),
    );
  }
}

class NativePluginWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NativePluginWidgetState();
  }

}

class NativePluginWidgetState extends State<NativePluginWidget>{
  String? latitude;
  String? longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocator'),
      ),
      body: Container(
        color: Colors.indigo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('MyLocation',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text('latitude : ${latitude}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text('longitude : ${longitude}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              ElevatedButton(onPressed: getGeoData, child: Text('refresh'))
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return NativePluginWidgetState();
  }

  @override
  void initState() {
    super.initState();
    getGeoData();
  }

  void getGeoData() async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('denied');
      }
    }

    Position position = await Geolocator.getCurrentPosition();

    setState(() {
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();
      print('latitude:$latitude\nlongitude:$longitude');
    });
  }
}