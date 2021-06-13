import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tulshop/src/bloc/bloc/checkout_bloc.dart';
import 'package:tulshop/src/ui/pages/product/widgets/product_counter.dart';

import '../../../../bloc/products/products_bloc.dart';
import '../../../../models/products.dart';

class MyCartItem extends StatelessWidget {
  final Products product;
  const MyCartItem({Key key, @required this.product}) : super(key: key);

  void _deleteItem(BuildContext context) {}

  void _onCounterChanged(BuildContext context, int counter) {}

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10).copyWith(bottom: 5),
          child: IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => _deleteItem(context),
          ),
        ),
      ],
      child: Container(
        margin: const EdgeInsets.all(10).copyWith(bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  fit: BoxFit.cover,
                ),
              ),
              flex: 2,
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.nombre,
                  ),
                  SizedBox(height: 5),
                  BlocBuilder<ProductsBloc, ProductsState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${product.costo}",
                            style: TextStyle(
                              color: Colors.amberAccent,
                            ),
                          ),
                          ProductCounter(
                            initialValue: product.counter,
                            product: product,
                            state: 1,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
