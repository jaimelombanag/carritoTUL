import 'package:flutter/material.dart';
import 'package:tulshop/src/ui/pages/home/widgets/lista_productos.dart';
import 'package:tulshop/src/ui/pages/home/widgets/my_cart_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Future<void> _createOrUpdate([DocumentSnapshot documentSnapshot]) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingMyCartButton(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.yellow[200],
              Colors.yellow[400],
              Colors.green[500],
              Colors.green[600],
            ],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Container(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image(
                  image: AssetImage("assets/images/logo.png"),
                  width: 200,
                  height: 50,
                ),
                Text(
                  "Herramientas y partes",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Expanded(child: ProductsList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
