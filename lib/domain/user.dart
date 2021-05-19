import 'package:firebase_auth/firebase_auth.dart';

class OurUser{
  String id;
  String email;

  OurUser.fromFirebase(User user){
    id = user.uid;
    email = user.email;
  }
}