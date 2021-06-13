import 'package:flutter/material.dart';
import 'package:tulshop/src/ui/pages/product/widgets/add_to_cart_button.dart';
import 'package:tulshop/src/ui/pages/product/widgets/product_detail.dart';
import 'package:tulshop/src/ui/pages/product/widgets/product_header.dart';

import '../../../models/products.dart';


class ProductPage extends StatelessWidget {


  const ProductPage({
    Key key, @required this.product,
  }) : super(key: key);

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF212121).withOpacity(0.0),
        title: Text(
          "Detalle Producto",
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
      backgroundColor: Colors.white,
      floatingActionButton: AddToCartButton(product: this.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductHeader(product: this.product),
              ProductDetail(product: this.product),
            ],
          ),
        ),
      ),
    );
  }
}
