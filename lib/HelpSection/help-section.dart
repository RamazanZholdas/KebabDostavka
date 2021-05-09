import 'package:flutter/material.dart';
import 'package:kebabdostavka/HelpSection/faq-page.dart';
import 'package:url_launcher/url_launcher.dart';


class HelpSection extends StatefulWidget {

  @override
  _HelpSectionState createState() => _HelpSectionState();
}

class _HelpSectionState extends State<HelpSection> with SingleTickerProviderStateMixin{

  Future<void> launched;
  String phoneNumber = '';
  String launchUrl = 'https://www.google.com';

  Future<void> launchInBrowser(String url) async{
    if(await canLaunch(url)){
      await launch(url,forceSafariVC: false, forceWebView: false);
    }else{
      throw 'Не могу запустить $url';
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUniversalLinkIos(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }
  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }

  Widget createSection(String text1, Icon icon, func()) {
    return GestureDetector(
      onTap: func,
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      child: Transform.scale(
        scale: _scale,
        child: Container(
          height: 115,
          width: 115,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 20,
                  offset: Offset(0,10),
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(
                text1,
                style: TextStyle(color: Colors.orangeAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            'Свяжитесь с нами',
            style: TextStyle(
              color: Colors.orangeAccent,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
              child: Image.asset(
                'images/contactus2.png',
                height: 250,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'Если у вас проблемы или предложения \n свяжитесь с нами!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[800],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: createSection(
                  'Напишите нам',
                  Icon(
                    Icons.alternate_email,
                    color: Colors.orangeAccent,
                    size: 50,
                  ),
                      ()=>_launchUniversalLinkIos('mailto:alisherSerikali@gmail.com?subject=Greetings&body=Hello%20World'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: createSection(
                  'Позвоните нам',
                  Icon(
                    Icons.call,
                    color: Colors.orangeAccent,
                    size: 50,
                  ),
                      ()=>_makePhoneCall('tel:1234567890'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: createSection(
                  'FAQ',
                  Icon(
                    Icons.help_outline_outlined,
                    color: Colors.orangeAccent,
                    size: 50,
                  ),
                      ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>FaqPage())),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: createSection(
                  'Мы здесь!',
                  Icon(
                    Icons.location_on_sharp,
                    color: Colors.orangeAccent,
                    size: 50,
                  ),
                      ()=>launchInBrowser('https://goo.gl/maps/5h3VXocCweEBT2Zm8'),
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Text('Коперигхт 2020 с Алиш Брат'),
          Text('Все права защищены отвечаю'),
        ],
      ),
    );
  }
}