
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
      drawer: new Drawer(
        
        child: Container(
          color: Colors.black54,
           child:ListView(
          children: <Widget>[
           Container(
             height: 35,
              width: 45, 
              child: ButtonTheme(
             minWidth: 45,
             height: 35,
             child:  RaisedButton(
              child: Text("Log Out", style: TextStyle(fontFamily: "Helvetica", fontSize: 25.0),),
              color: Colors.orange,
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
              
            ),
           ), 
              ),

          ],
        ),
         ), 
      ),
      
     
    );
  }
}
