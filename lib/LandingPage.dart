import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kebabdostavka/domain/user.dart';
import 'package:kebabdostavka/sign-in-page/choise-page.dart';
import 'package:kebabdostavka/sign-in-page/starting-page.dart';
import 'package:provider/provider.dart';

import 'HomePage/home-page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OurUser user = Provider.of<OurUser>(context);
    final bool isLoggedIn = user!=null ;

    return isLoggedIn ? HomePage() : StartingPage();
  }
}
