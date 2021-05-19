import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kebabdostavka/HomePage/home-page.dart';
import 'package:kebabdostavka/sign-in-page/login-page.dart';
import 'package:kebabdostavka/sign-in-page/registration-page.dart';

class ChoisePage extends StatefulWidget {
  @override
  _ChoisePageState createState() => _ChoisePageState();
}

class _ChoisePageState extends State<ChoisePage> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  googleSignInMethod() async {
    final GoogleSignInAccount signInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await signInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    final User user =
        (await firebaseAuth.signInWithCredential(credential)).user;
  }

  Widget customRaisedButton(String text, Function func) {
    return RaisedButton(
      onPressed: func,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff374ABE), Color(0xff64B6FF)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          constraints: BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(249, 83, 48, 1),
                Color.fromRGBO(243, 131, 107, 1)
              ]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SvgPicture.asset('images/food-delivery.svg',
                      width: 150, height: 150),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Название нашего ис',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              customRaisedButton('Login', (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              }),
              SizedBox(
                height: 30,
              ),
              customRaisedButton('Register', (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationPage()));
              }),
              SizedBox(
                height: 30,
              ),
              customRaisedButton('Sign in with google', (){
                setState(() {
                  googleSignInMethod();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
