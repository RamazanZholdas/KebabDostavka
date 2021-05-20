import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kebabdostavka/HelpSection/help-section.dart';
import 'package:kebabdostavka/HomePage/home-page.dart';
import 'package:kebabdostavka/HomePage/payment-page.dart';
import 'package:kebabdostavka/LandingPage.dart';
import 'package:kebabdostavka/domain/user.dart';
import 'package:kebabdostavka/services/Auth.dart';
import 'package:kebabdostavka/sign-in-page/registration-page.dart';
import 'package:kebabdostavka/sign-in-page/sign-in-with-google.dart';
import 'package:kebabdostavka/sign-in-page/starting-page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    StreamProvider<OurUser>.value(
      value: AuthService().currentUser,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    ),
  );
}