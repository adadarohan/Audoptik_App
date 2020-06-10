
import 'package:audoptik_app/Screens/root/root.dart';
import 'package:audoptik_app/screens/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/Login/LoginWidgets/loginwidgets.dart';

void main() {
  runApp(MyApp());
  //hello rohan ;)
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider(
      create: (context) => myLoginWidgets(),
      child: MaterialApp(
        
        home: myRootScreen(),

      ),

    );
  }
}

