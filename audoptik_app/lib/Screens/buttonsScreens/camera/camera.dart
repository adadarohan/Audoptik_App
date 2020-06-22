import 'package:audoptik_app/Screens/buttonsScreens/camera/widgets/face.dart';
import 'package:audoptik_app/Screens/buttonsScreens/camera/widgets/ocr.dart';
import 'package:audoptik_app/helper.dart';
import 'package:audoptik_app/home/home.dart';
import 'package:flutter/material.dart';

class myCamera extends StatefulWidget {
  @override
  _myCameraState createState() => _myCameraState();
}

class _myCameraState extends State<myCamera> {

  static help obj = new help(); 
  double width = obj.width;
  double height = obj.height;

  void backButton(BuildContext context){
    Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(
                    builder: (context) => myHomeScreen()
                ),
                    (route) => false
            );
  }
  void facialRecButton(BuildContext context){
    Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(
                    builder: (context) => myFaceRec(),
                ),
                    (route) => false
            );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title : Text(
          "This is the Camera Screen",
          style: TextStyle(
            color: Colors.white
          )
        )
      ),
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20.0), child: ButtonTheme(
            padding: EdgeInsets.all(20.0),
              
              minWidth: width,
              height: height,
              child: RaisedButton(
                color: Colors.white,
                child: Text("OCR", style: TextStyle(
                  fontSize: 44,
                ),
              ),
              onPressed: (){
                Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(
                    builder: (context) => myOCR()
                ),
                    (route) => false
            );

              },

              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(20.0), child: ButtonTheme(
            padding: EdgeInsets.all(20.0),
              
              minWidth: width,
              height: height,
              child: RaisedButton(
                color: Colors.white,
                child: Text("Google Lens", style: TextStyle(
                  fontSize: 44,
                ),
              ),
              onPressed: (){},

              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(20.0), child: ButtonTheme(
            padding: EdgeInsets.all(20.0),
              
              minWidth: width,
              height: height,
              child: RaisedButton(
                color: Colors.white,
                child: Text("Color", style: TextStyle(
                  fontSize: 44,
                ),
              ),
              onPressed: (){},

              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(20.0), child: ButtonTheme(
            padding: EdgeInsets.all(20.0),
              
              minWidth: width,
              height: height,
              child: RaisedButton(
                color: Colors.white,
                child: Text("Expression Tracking", style: TextStyle(
                  fontSize: 44,
                ),
              ),
              onPressed: (){
                facialRecButton(context);
              },

              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(20.0), child: ButtonTheme(
            padding: EdgeInsets.all(20.0),
              
              minWidth: width,
              height: height,
              child: RaisedButton(
                color: Colors.white,
                child: Text("Money Denomination", style: TextStyle(
                  fontSize: 44,
                ),
              ),
              onPressed: (){},

              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(20.0), child: ButtonTheme(
            padding: EdgeInsets.all(20.0),
              
              minWidth: width,
              height: height,
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
          
          
        ],
      ),
      
    );
  }
}