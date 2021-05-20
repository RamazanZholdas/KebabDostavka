import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kebabdostavka/HelpSection/faq-page.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentPage extends StatefulWidget {
  var price;
  PaymentPage({Key key, this.price}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  var price;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    price = widget.price;
  }

  Future<void> launched;
  String phoneNumber = '';
  String launchUrl = 'https://www.google.com';

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Не могу запустить $url';
    }
  }

  Widget createSection(String text1, SvgPicture icon, func()) {
    return GestureDetector(
      onTap: func,
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
                offset: Offset(0, 10),
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(height: 5,),
            Text(
              text1,
              style: TextStyle(color: Colors.orangeAccent),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            'Оплата',
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
            child: SvgPicture.asset(
              'images/online-payment.svg',
              height: 250,
              width: 250,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'Оплата товаров происходит здесь\n Виды оплаты:',
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
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: createSection(
                  'Оплата Kaspi',
                  SvgPicture.asset('images/credit-card.svg',width: 50,height: 50,),
                  () => launchInBrowser(
                      'https://kaspi.kz/entrance?ReturnUrl=%2ftransfers%2findex'),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: createSection(
                  'Оплата Halyk Bank',
                  SvgPicture.asset('images/credit-card-payment.svg',width: 50,height: 50,),
                  () => launchInBrowser(
                      'https://halykbank.kz/transfer/na-scheta'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: createSection(
                  'Перевод с билайна',
                  SvgPicture.asset('images/smartphone.svg',width: 50,height: 50,),
                  () => _makePhoneCall('tel:*145*9031234567*$price#'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text('Коперигхт 2020 с Алиш Брат'),
          Text('Все права защищены отвечаю'),
        ],
      ),
    );
  }
}
