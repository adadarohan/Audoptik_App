import 'package:audoptik_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class myDataBase{
  final Firestore _firestore = Firestore.instance;

  Future<String> createUser(OurUser user)async{
    String retVal = "error";
    try{
      await _firestore.collection("users").document(user.uid).setData({
        'fullName' : user.fullName,
        'email' : user.email,
        'accountCreated' : Timestamp.now(),


      });
      retVal = "success";

    }catch(e){
      print(e);
    }
    return retVal;

  }
  Future<OurUser> getUserInfo(String uid) async{
    OurUser retVal = OurUser();
    try{
      DocumentSnapshot _docsnap = await _firestore.collection("users").document(uid).get();
      retVal.uid = uid;
      retVal.fullName = _docsnap.data["fullName"];
      retVal.email = _docsnap.data["email"];
      retVal.accountCreated = _docsnap.data["accountTime"];


    }catch(e){
      print(e);
    }

    return retVal;
  }
}