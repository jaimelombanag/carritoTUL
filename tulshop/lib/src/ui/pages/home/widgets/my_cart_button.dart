import 'package:flutter/material.dart';
import 'package:tulshop/src/ui/pages/mycart/my_cart_page.dart';

class FloatingMyCartButton extends StatelessWidget {
  const FloatingMyCartButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FloatingActionButton(
          backgroundColor: Colors.blueGrey.shade700,
          child: Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => MyCartPage()));
          },
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              "5",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
