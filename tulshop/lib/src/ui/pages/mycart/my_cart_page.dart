import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tulshop/src/bloc/bloc/checkout_bloc.dart';
import 'package:tulshop/src/ui/pages/mycart/widgets/check_out_preview.dart';
import 'package:tulshop/src/ui/pages/mycart/widgets/my_cart_item.dart';
import '../../../bloc/products/products_bloc.dart';


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
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  BlocProvider.of<ProductsBloc>(context).add(DeleteList());
                  BlocProvider.of<CheckoutBloc>(context).add(UpdateCheckOut(0));

                },
                child: Icon(
                  Icons.delete_sharp,
                  color: Colors.black,
                ),
              )),
        ],
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return SafeArea(
            child: state.listCart.length == 0
                ? Center(
                    child: Text("No elements"),
                  )
                : ListView.builder(
                    itemBuilder: (_, index) {
                      final product = state.listCart[index];
                      return MyCartItem(product: product);
                    },
                    itemCount: state.listCart.length,
                  ),
          );
        },
      ),
      bottomNavigationBar: CheckOutPreview(),
    );
  }
}
