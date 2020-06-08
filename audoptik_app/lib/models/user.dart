import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser{
  String uid;
  String email;
  String fullName;
  Timestamp accountCreated;

  OurUser({
    this.uid,
    this.fullName,
    this.email,
    this.accountCreated,
});

}