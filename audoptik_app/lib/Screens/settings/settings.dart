import 'package:audoptik_app/Screens/Login/LoginWidgets/loginwidgets.dart';
import 'package:audoptik_app/Screens/root/root.dart';
import 'package:audoptik_app/helper.dart';
import 'package:audoptik_app/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class mySettings extends StatefulWidget {
  
  @override
  _State createState() => _State();
}

class _State extends State<mySettings> {
  void backButton(BuildContext context){
    Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(
                    builder: (context) => myHomeScreen()
                ),
                    (route) => false
            );
  }

  
  static help obj = help(); 
  double button_width = obj.width; 
  double button_height = obj.height;
  double rating = 0.0;
  double button_width_new, button_height_new;  

  void changeButtonSize(double rating){
    rating = rating/10; 
    button_width_new = ((rating*button_width) + button_width); 
    button_height_new = ((rating*button_height) + button_height); 
    obj.setWidth(button_width_new);
    obj.setHeight(button_height_new);

  }

  

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
              minWidth: button_width,
              height: button_height,
              child: RaisedButton(
                child: Text("Log Out", style: TextStyle(fontFamily: "Helvetica", fontSize: 45.0),),
                color: Colors.white,
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
            ),
            Padding(padding: EdgeInsets.all(20.0), child: ButtonTheme(
            padding: EdgeInsets.all(20.0),
              
              minWidth: button_width,
              height: button_height, 
              child: RaisedButton(
                color: Colors.white,
                child: Text("Back Button", style: TextStyle(
                  fontSize: 44,
                ),
              ),
              onPressed: (){
                backButton(context);
                
              },

              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Slider(
              value: rating, 
              onChanged: (newRating){
                setState(() => rating = newRating);
                changeButtonSize(rating); 
              },
              divisions: 5, 
              label: "$rating",

            ),
          ), 
          ],
        ),

    );
   
  }

}