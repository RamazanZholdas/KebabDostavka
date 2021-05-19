import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kebabdostavka/HomePage/home-page.dart';
import 'package:kebabdostavka/domain/user.dart';
import 'package:kebabdostavka/services/Auth.dart';
import 'package:kebabdostavka/sign-in-page/choise-page.dart';
import 'package:kebabdostavka/sign-in-page/sign-in-with-google.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthService authService = AuthService();

  String email, password;

  Widget customTextFieldWidget(TextEditingController controller,
      String hintText, bool obscureText, Icon icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blueAccent, width: 3),
        ),
        child: TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            icon: icon,
            border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'images/food-delivery.svg',
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'Here you can register',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            customTextFieldWidget(
                emailController,
                'E-mail here',
                false,
                Icon(
                  Icons.email_outlined,
                  color: Colors.blue,
                ),
            ),
            SizedBox(
              height: 30,
            ),
            customTextFieldWidget(
                passwordController, 'password here', true, Icon(Icons.vpn_key_outlined)),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: ElevatedButton(
                onPressed: (){
                  setState(() async {

                    email = emailController.text;
                    password = passwordController.text;

                    if(email.isEmpty || password.isEmpty){
                      return Fluttertoast.showToast(
                          msg: "Pls fill everything",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }

                    OurUser user = await authService.registerWithEmailAndPassword(email.trim(), password.trim());

                    if(user == null){
                      Fluttertoast.showToast(
                          msg: "Can't sign in, please write your email/password correctly",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    }
                  });
                },
                child: Text('Register',style: TextStyle(color: Colors.white,fontSize: 22),),
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  minimumSize: Size(140,60),
                  primary: Colors.blue,
                  onPrimary: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
