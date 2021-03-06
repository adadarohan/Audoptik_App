import 'package:audoptik_app/models/user.dart';
import 'package:audoptik_app/services/databse.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class myLoginWidgets extends ChangeNotifier{
   OurUser _currentUser = OurUser();
   FirebaseAuth _auth = FirebaseAuth.instance;
    Future<String> onStartup() async{
    String retVal = "error";
    try{
      FirebaseUser _firebaseUser = await _auth.currentUser();
       _currentUser = await myDataBase().getUserInfo(_firebaseUser.uid);
      if(_currentUser != null){
        retVal = "success";

      }

    }catch(e){
      print(e);
    }

    return retVal;
  }
   Future<String> MyLoginUserwithGoogle() async{
    String retVal = "Error";
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    try{
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _Googleauth = await _googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: _Googleauth.idToken, accessToken: _Googleauth.accessToken);
      AuthResult _authresult = await _auth.signInWithCredential(credential);

      _currentUser.uid = _authresult.user.uid;
      _currentUser.email = _authresult.user.email;
      return retVal= "success";

    }catch(e){
      retVal = e.message;
    }

    return retVal;

  }
   Future<String> signOut() async{
    String retVal = "error";
    try{
      await _auth.signOut();
      _currentUser = OurUser();
      retVal = "success";


    }catch(e){
      print(e);
    }

    return retVal;
  }
}
