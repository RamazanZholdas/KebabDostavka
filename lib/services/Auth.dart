import 'package:firebase_auth/firebase_auth.dart';
import 'package:kebabdostavka/domain/user.dart';

class AuthService{
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<OurUser> signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _fAuth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return OurUser.fromFirebase(user);
    }catch(e){
      print(e);
      return null;
    }
  }

  Future<OurUser> registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _fAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return OurUser.fromFirebase(user);
    }catch(e){
      print(e);
      return null;
    }
  }

  Future logOut() async{
    await _fAuth.signOut();
  }

  Stream<OurUser> get currentUser{
    return _fAuth.authStateChanges()
        .map((User user) => user != null ? OurUser.fromFirebase(user) : null);
  }
}