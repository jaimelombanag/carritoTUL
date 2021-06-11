import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tulshop/src/models/products.dart';
import 'package:tulshop/src/widgets/products_item.dart';

class ListProducts extends StatelessWidget {
  final List<Products> dishes;
  final String title;
  final VoidCallback onViewAll;
  const ListProducts({
    Key key,
    @required this.dishes,
    @required this.title,
    this.onViewAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) {
                final item = dishes[index];
                return ProductsHomeItem(
                  key: UniqueKey(),
                  item: item,
                  isFirst: index == 0,
                );
              },
              itemCount: dishes.length,
            ),
          ),
        ],
      ),
    );
  }
}
