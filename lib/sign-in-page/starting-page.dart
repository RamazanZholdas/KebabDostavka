import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kebabdostavka/sign-in-page/choise-page.dart';

class StartingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'images/food-delivery.svg',
              height: 150,
              width: 150,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Welcome to KebabDostavka!',
              style: TextStyle(fontSize: 26, color: Colors.deepOrange),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              'With this app you can \nforget about food preparation',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.deepOrange),
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChoisePage()));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(250, 60),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
              child: Text(
                'Start',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    letterSpacing: 2
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
