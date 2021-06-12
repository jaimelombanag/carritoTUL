import 'package:flutter/material.dart';

import '../../../../widgets/rounded_button.dart';


class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key key}) : super(key: key);

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
    return RoundedButton(
      label: "Agregar al Carrito",
      onPressed: () => _addToCart(context),
      fullWidth: false,
      fontSize: 20,
    );
  }
}
