import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tulshop/src/models/products.dart';
import '../../../../bloc/products/products_bloc.dart';
import '../../../../models/products.dart';
import 'rounded_button.dart';

class AddToCartButton extends StatelessWidget {
  
  const AddToCartButton({
    Key key, @required this.product,
  }) : super(key: key);

  final Products product;
  

  void _addToCart(BuildContext context) {
    final SnackBar snackBar = SnackBar(
      content: Text(
        "Agregar al Carrito",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.deepOrange,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    List<Products> listCart = [];
    listCart.add(product);
    return RoundedButton(
      label: "Agregar al Carrito",
      onPressed: () {
          BlocProvider.of<ProductsBloc>(context).add(AddProductCart(listCart));
      },
      fullWidth: false,
      fontSize: 20,
    );
  }
}
