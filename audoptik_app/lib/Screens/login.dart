
import 'package:flutter/material.dart';
class MyLogin extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: <Widget>[
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  padding: EdgeInsets.all(20.0),
                  
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(40.0), child: Image.asset('assets/audotik_logo.png'),
                    ),
                    SizedBox(height: 20.0),
                   
                  ],
                ),
              )
          ),

        ],
      ),

    );

  }
}