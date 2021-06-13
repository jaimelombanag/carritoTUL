import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tulshop/src/ui/pages/mycart/my_cart_page.dart';
import '../../../../bloc/products/products_bloc.dart';


class FloatingMyCartButton extends StatelessWidget {
  const FloatingMyCartButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return Stack(
          children: [
            FloatingActionButton(
              backgroundColor: Colors.blueGrey.shade700,
              child: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                for (int i = 0; i < state.listCart.length; i++) {
                  print("----Nombre:  ${state.listCart[i].nombre}");
                }
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
                  state.listCart == null ? "0" : "${state.listCart.length}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
