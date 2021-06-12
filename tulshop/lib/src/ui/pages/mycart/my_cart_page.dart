import 'package:flutter/material.dart';
import 'package:tulshop/src/ui/pages/mycart/widgets/check_out_preview.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF212121).withOpacity(0.0),
        title: Text(
          "Mi Carrito",
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Container(),
      bottomNavigationBar: CheckOutPreview(),
    );
  }
}
