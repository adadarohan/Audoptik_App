import 'package:audoptik_app/Screens/Login/LoginWidgets/loginwidgets.dart';
import 'package:audoptik_app/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class myLoginForm extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<myLoginForm> {
  void LoginUser(BuildContext context) async{
    myLoginWidgets _currentUser = Provider.of(context, listen:false,);
    try{
      String _returnString;
       _returnString = await _currentUser.MyLoginUserwithGoogle();
       if(_returnString == "success"){
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(
                builder: (context) => myHomeScreen()
            ),
                (route) => false
        );
      } else{
        Scaffold.of(context).showSnackBar(
          SnackBar(
            
            content: Text(_returnString),
            duration: Duration(seconds: 5),
          ),
        );
      }

    }catch(e){
      print(e); 
    }
  }
  Widget _googleButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        LoginUser(context);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google.jpg"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       
      child: Column(
        children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0,),
          child: Text("Log In",
            style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,),
          ),

        ),
        _googleButton()
      ]
      )
      );
  }
}