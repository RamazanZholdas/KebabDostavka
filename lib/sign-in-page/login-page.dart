import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kebabdostavka/HomePage/home-page.dart';
import 'package:kebabdostavka/domain/user.dart';
import 'package:kebabdostavka/services/Auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              'Here you can login with your credentials',
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
                onPressed: () async{
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

                  OurUser user = await authService.signInWithEmailAndPassword(email.trim(), password.trim());

                  if(user != null){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  }else{
                    return Fluttertoast.showToast(
                        msg: "Try again email or password is not correct",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                },
                child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 22),),
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
