import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tulshop/src/ui/pages/product/widgets/product_counter.dart';

import '../../../../models/products.dart';


class ProductDetail extends StatelessWidget {
  const ProductDetail({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.nombre,
                    ),
                    Text(
                      "\$ ${product.costo}",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Text(
                "SKU: ${product.sku}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
            ],
          ),
          SizedBox(height: 10),
          ProductCounter(
            initialValue: product.counter,
            //onChanged: controller.onCounterChanged,
            onChanged: null,
          ),
          SizedBox(height: 20),
          Text(
            product.descripcion,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
