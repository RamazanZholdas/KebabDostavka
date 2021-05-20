import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kebabdostavka/HomePage/home-page.dart';
import 'package:kebabdostavka/HomePage/korzina-page.dart';

class FoodPage extends StatefulWidget {
  DocumentSnapshot documentSnapshot;

  FoodPage({Key key, this.documentSnapshot}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var a,price,pricePerEach;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    a = widget.documentSnapshot.get('price').toString();
    price = int.parse(a);
    pricePerEach = int.parse(a);
  }

  int counter = 1;
  CollectionReference ref = FirebaseFirestore.instance.collection('korzina');
  //получение листа из коллекции korzina с базы данныз Firebase

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            widget.documentSnapshot.get('title'),
            style: TextStyle(
              color: Colors.orangeAccent,
            ),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.local_pizza,
                size: 150,
              ),
              SizedBox(height: 25,),
              Text(
                widget.documentSnapshot.get('description'),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          if(counter == 1){
                            return;
                          }else{
                            counter--;
                            price -= pricePerEach;
                          }
                        });
                      },
                      child: Container(
                        child: Text('-',style: TextStyle(fontSize: 26),),
                      ),
                    ),
                    Container(child: Text("$counter"),),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          counter++;
                          price += pricePerEach;
                        });
                      },
                      child: Container(
                        child: Text('+',style: TextStyle(fontSize: 26),),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text('$price рублей'),
              SizedBox(height: 20,),
              TextButton(
                onPressed: (){
                  ref.add({
                    'title': widget.documentSnapshot.get('title').toString(),
                    'description': widget.documentSnapshot.get('description').toString(),
                    'price': price.toString(),
                  }).whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context)=>KorzinaPage())));
                  //Добавление данных в базу
                },
                child: Text('В корзину',textAlign: TextAlign.center,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
