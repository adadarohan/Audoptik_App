

import 'package:audoptik_app/Screens/buttonsScreens/blindfriendly.dart';
import 'package:audoptik_app/Screens/buttonsScreens/camera.dart';
import 'package:audoptik_app/Screens/buttonsScreens/list.dart';
import 'package:audoptik_app/Screens/settings/settings.dart';
import 'package:flutter/material.dart';


class myHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Title( color: Colors.white,
        child: Text("This is Home"),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          ButtonTheme(
            minWidth: 65,
            height: 55,
            child: RaisedButton(
            color: Colors.blue,
            
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Settings", 
              style: TextStyle(
                fontFamily: "Helvetica",
                fontSize: 45,
                color: Colors.white,
              ),
              ),
              onPressed: (){
                Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(
                    builder: (context) => mySettings()
                ),
                    (route) => false
            );

              },
            )
          ),
          
          Padding(
            padding: EdgeInsets.all(20.0),
            child: ButtonTheme(
              minWidth: 65,
              height: 55,
              child: RaisedButton(
                  color: Colors.blue,
            
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Blind Friendly Score", 
                    style: TextStyle(
                        fontFamily: "Helvetica",
                        fontSize: 45,
                        color: Colors.white,
                      ),
                    ),
              onPressed: (){
                Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(
                    builder: (context) => myBlindFriendly()
                ),
                    (route) => false
            );

              },
            )
          ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child:ButtonTheme(
            minWidth: 65,
            height: 55,
            child: RaisedButton(
            color: Colors.blue,
            
            padding: EdgeInsets.all(20.0),
            child: Text(
              "List of Activities", 
              style: TextStyle(
                fontFamily: "Helvetica",
                fontSize: 45,
                color: Colors.white,
              ),
              ),
              onPressed: (){
                Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(
                    builder: (context) => myList()
                ),
                    (route) => false
            );

              },
            )
          ),
          ),
          Padding(padding: EdgeInsets.all(20.0),
          child: ButtonTheme(
            minWidth: 65,
            height: 55,
            child: RaisedButton(
            color: Colors.blue,
            
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Find My Device", 
              style: TextStyle(
                fontFamily: "Helvetica",
                fontSize: 45,
                color: Colors.white,
              ),
              ),
              onPressed: () {}
            )
          ),
          ),
         
          Padding(
            padding: EdgeInsets.all(20.0), 
            child: ButtonTheme(
            minWidth: 65,
            height: 55,
            child: RaisedButton(
            color: Colors.blue,
            
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Camera", 
              style: TextStyle(
                fontFamily: "Helvetica",
                fontSize: 45,
                color: Colors.white,
              ),
              ),
              onPressed: (){
                Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(
                    builder: (context) => myCamera()
                ),
                    (route) => false
            );

              },
            )
          ),
          )
        ],
      ),
      
    );
  }
}
