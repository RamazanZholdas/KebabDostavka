import 'package:flutter/material.dart';
import 'package:kebabdostavka/HelpSection/help-section.dart';
import 'package:kebabdostavka/LandingPage.dart';
import 'package:kebabdostavka/services/Auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Colors.orangeAccent,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.orangeAccent,
              ),
              onPressed: () {}),
          SizedBox(
            width: 10,
          ),
          IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.orangeAccent,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HelpSection()));
              }),
          SizedBox(
            width:10,
          ),
          IconButton(
            icon: Icon(
              Icons.exit_to_app_outlined,
              color: Colors.orangeAccent,
            ),
            onPressed: (){
              setState(() {
                AuthService().logOut();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LandingPage()));
              });
            },
          )
        ],
      ),
      body: Container(
        height: size.height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Корзина',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  'Меню',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      margin: EdgeInsets.only(right: 20),
                      height: categoryHeight,
                      decoration: BoxDecoration(
                          color: Colors.orange.shade400,
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.0))),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Специальное \nпредложение",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "осталось:20",
                              style:
                              TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      margin: EdgeInsets.only(right: 20),
                      height: categoryHeight,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade400,
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.0))),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Здесь тож",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "осталось:20",
                              style:
                              TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      margin: EdgeInsets.only(right: 20),
                      height: categoryHeight,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade400,
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.0))),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Канкретна \nговорю",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "осталось:20",
                              style:
                              TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                /*itemCount: 6,
                itemBuilder: null,*/
                children: [
                  Container(
                    height: 150,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withAlpha(100),
                              blurRadius: 10.0),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SomeHavchik',
                                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Vid havchika',
                                style: const TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '300\$',
                                style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Icon(
                            Icons.local_pizza,
                            color: Colors.orangeAccent,
                            size: 70,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withAlpha(100),
                              blurRadius: 10.0),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SomeHavchik',
                                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Vid havchika',
                                style: const TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '300\$',
                                style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Icon(
                            Icons.local_pizza,
                            color: Colors.orangeAccent,
                            size: 70,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withAlpha(100),
                              blurRadius: 10.0),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SomeHavchik',
                                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Vid havchika',
                                style: const TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '300\$',
                                style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Icon(
                            Icons.local_pizza,
                            color: Colors.orangeAccent,
                            size: 70,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}