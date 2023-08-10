import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class User {
  String name;
  String phone;
  String email;

  User(this.name, this.phone, this.email);
}

class MyApp extends StatelessWidget {
  List<User> users = [
    User('hong', '0001', 'a@naver.com'),
    User('gil', '0002', 'b@naver.com'),
    User('dong', '0003', 'c@naver.com'),
    User('lee', '0004', 'd@naver.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Test'),
            ),
            body: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(

                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('images/big.jpeg'),
                    ),
                    title: Text(users[index].name),
                    subtitle: Text(users[index].phone),
                    trailing: Icon(Icons.more_vert),
                    onTap: () {
                      print('onTap()->${users[index].name}');
                    },
                  );
                },

                separatorBuilder: (context, index) {
                  return Divider(height: 2, color: Colors.black,);
                }, itemCount: users.length)
        )
    );
  }
}

