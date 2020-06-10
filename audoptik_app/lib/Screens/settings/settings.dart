import 'package:audoptik_app/Screens/Login/LoginWidgets/loginwidgets.dart';
import 'package:audoptik_app/Screens/root/root.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class mySettings extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<mySettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.purple ,
        title: Text("This is the Settings Menu!"),
        ),
        body: ListView(
          
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            ButtonTheme(
              minWidth: 105,
              height: 100,
              child: RaisedButton(
                child: Text("Log Out", style: TextStyle(fontFamily: "Helvetica", fontSize: 45.0),),
                color: Colors.orange,
                onPressed: () async{
                  myLoginWidgets _currentUser = await Provider.of<myLoginWidgets>(context, listen: false);
                  String _returnString = await _currentUser.signOut();
          if(_returnString == "success"){
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(
                    builder: (context) => myRootScreen()
                ),
                    (route) => false
            );
          }
              },
              
            ),
            )
          ],
        ),

    );
   
  }

}