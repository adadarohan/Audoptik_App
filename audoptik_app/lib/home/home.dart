
import 'package:audoptik_app/Screens/Login/LoginWidgets/loginwidgets.dart';
import 'package:audoptik_app/Screens/root/root.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Center(child: ButtonTheme(
        minWidth: 278,
        height: 86,
        child: RaisedButton(
          onPressed: () async{
            myLoginWidgets _currentUser = Provider.of<myLoginWidgets>(context, listen: false);
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
          color: Colors.white,
          child: Text(
            "Sign Out", 
            style: TextStyle(fontSize: 34.0),
            ),
          
          ),
        )
      )
     
    );
  }
}
