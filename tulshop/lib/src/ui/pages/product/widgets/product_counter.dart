import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tulshop/src/bloc/bloc/checkout_bloc.dart';
import '../../../../bloc/products/products_bloc.dart';
import '../../../../models/products.dart';

enum ProductCounterSize { normal, mini }

class ProductCounter extends StatefulWidget {
  final ProductCounterSize size;
  final int initialValue;
  final Products product;
  final state;
  ProductCounter({
    Key key,
    this.size = ProductCounterSize.normal,
    this.initialValue = 0,
    this.product,
    this.state = 0,
  }) : super(key: key);

  @override
  _ProductCounterState createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool mini = widget.size == ProductCounterSize.mini;

    final double padding = mini ? 5 : 10;
    final double fontSize = mini ? 25 : 30;

    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                child: Icon(Icons.remove),
                minSize: 20,
                borderRadius: BorderRadius.circular(30),
                onPressed: () => BlocProvider.of<ProductsBloc>(context)
                    .add(DeleteProducto()),
                color: Colors.grey,
                padding: EdgeInsets.all(padding),
              ),
              SizedBox(width: 10),
              Text(
                "${state.counter}",
                style: TextStyle(fontSize: fontSize),
              ),
              SizedBox(width: 10),
              CupertinoButton(
                child: Icon(Icons.add),
                minSize: 20,
                borderRadius: BorderRadius.circular(30),
                onPressed: () {
                  BlocProvider.of<ProductsBloc>(context).add(AddProducto());

                  if (widget.state == 1) {
                    List<Products> listCart = [];
                    listCart.add(widget.product);
                    int costo = int.parse(listCart[0].costo);
                    BlocProvider.of<ProductsBloc>(context).add(AmounTotal(costo));
                    BlocProvider.of<CheckoutBloc>(context).add((UpdateAmount(costo)));
                  }
                },

                //onPressed: () {},
                color: Colors.grey,
                padding: EdgeInsets.all(padding),
              ),
            ],
          ),
        );
      },
    );
  }
}
