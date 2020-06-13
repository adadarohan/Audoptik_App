import 'package:audoptik_app/Screens/buttonsScreens/camera/widgets/ocr.dart';
import 'package:audoptik_app/home/home.dart';
import 'package:flutter/material.dart';

class myCamera extends StatefulWidget {
  @override
  _myCameraState createState() => _myCameraState();
}

class _myCameraState extends State<myCamera> {
  void backButton(BuildContext context){
    Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(
                    builder: (context) => myHomeScreen()
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
              
              minWidth: 65,
              height: 65,
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
              
              minWidth: 65,
              height: 65,
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
              
              minWidth: 65,
              height: 65,
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
              
              minWidth: 65,
              height: 65,
              child: RaisedButton(
                color: Colors.white,
                child: Text("Expression Tracking", style: TextStyle(
                  fontSize: 44,
                ),
              ),
              onPressed: (){},

              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(20.0), child: ButtonTheme(
            padding: EdgeInsets.all(20.0),
              
              minWidth: 65,
              height: 65,
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
              
              minWidth: 65,
              height: 65,
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