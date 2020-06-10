import 'package:audoptik_app/Screens/Login/login.dart';
import 'package:audoptik_app/Screens/Login/LoginWidgets/loginwidgets.dart';
import 'package:audoptik_app/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
enum AuthStatus{
  notLoggedIn,
  LoggedIn,
}
class  myRootScreen extends StatefulWidget {
  @override
  _myRootScreenState createState() => _myRootScreenState();
}

class _myRootScreenState extends State<myRootScreen> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;
  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    //get the state
    //check the user
    //set AuthStatus based on state
    myLoginWidgets _currentUser = Provider.of<myLoginWidgets>(context, listen: false);
    _currentUser.onStartup();
    String _returnString = await _currentUser.onStartup();
    if(_returnString == "success"){
      setState(() {
        _authStatus = AuthStatus.LoggedIn;
      });
    }


  }
  Widget build(BuildContext context) {
    Widget retVal;
    switch(_authStatus){
      case AuthStatus.notLoggedIn:
        retVal = MyLogin();
        break;
      case AuthStatus.LoggedIn:
        retVal = myHomeScreen();
    }

    return retVal;
    return Container();
  }
}
