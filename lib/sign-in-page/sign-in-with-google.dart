import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kebabdostavka/sign-in-page/registration-page.dart';

class SignInWithGoogle extends StatefulWidget {
  @override
  _SignInWithGoogleState createState() => _SignInWithGoogleState();
}

class _SignInWithGoogleState extends State<SignInWithGoogle> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  googleSignInMethod() async {
    final GoogleSignInAccount signInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await signInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    final User user =
        (await firebaseAuth.signInWithCredential(credential)).user;
  }

  Widget customTextField(TextEditingController controller,String labelText, String hintText, bool obscureText, Icon icon){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(color: Colors.white),
          icon: icon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: GestureDetector(
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationPage()));
                },
              ),
            ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'images/food-delivery.svg',
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Here you can\n sign in!',
                  style: GoogleFonts.openSans(color: Colors.deepOrange,fontSize: 22),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'bluh bluh \n bluh bluh',
                  style: GoogleFonts.openSans(color:Colors.deepOrange, fontSize: 16),
                ),
                SizedBox(
                  height:20,
                ),
                Container(
                  child: customTextField(loginController, "Login", 'login here', false, Icon(Icons.person)),
                ),
                Container(
                  child: customTextField(passwordController, 'Password', 'password here', true, Icon(Icons.vpn_key_outlined)),
                )
              ],
            ),
          ),
        ),
    );
  }
}
