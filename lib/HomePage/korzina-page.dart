import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kebabdostavka/HomePage/home-page.dart';
import 'package:kebabdostavka/LandingPage.dart';
import 'package:kebabdostavka/services/Auth.dart';

class KorzinaPage extends StatefulWidget {
  @override
  _KorzinaPageState createState() => _KorzinaPageState();
}

class _KorzinaPageState extends State<KorzinaPage> {
  final ref = FirebaseFirestore.instance.collection('korzina');
  int totalCost = 0;

  @override
  Widget build(BuildContext context) {
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
              Icons.exit_to_app_outlined,
              color: Colors.orangeAccent,
            ),
            onPressed: () {
              setState(() {
                AuthService().logOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LandingPage()));
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
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()));
                  },
                  child: Text(
                    'Меню',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: ref.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return ListView.builder(
                        itemCount: snapshot.hasData
                            ? snapshot.data.docs.length
                            : 0,
                        itemBuilder: (context, index) {
                          totalCost += int.parse(snapshot.data.docs[index]
                              .get('price'));
                          return Container(
                            height: 150,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withAlpha(100),
                                      blurRadius: 10.0),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data.docs[index]
                                            .get('title'),
                                        style: const TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        snapshot.data.docs[index]
                                            .get('description'),
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        snapshot.data.docs[index]
                                                .get('price') +
                                            '\$',
                                        style: const TextStyle(
                                            fontSize: 25,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
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
                          );
                        });
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          return Fluttertoast.showToast(
              msg: "Ваш заказ будет стоить: $totalCost",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 26.0
          );
        },
        child: Icon(Icons.attach_money,color: Colors.white,),
      ),
    );
  }
}
