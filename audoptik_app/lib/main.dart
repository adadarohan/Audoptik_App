import 'package:audoptik_app/Screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  //hello rohan ;)
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyLogin(),
      theme: ThemeData(),
    );
  }
}

