import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tulshop/src/models/dish.dart';
import 'package:tulshop/src/widgets/dish_item.dart';

class HorizontalDishes extends StatelessWidget {
  final List<Dish> dishes;
  final String title;
  final VoidCallback onViewAll;
  const HorizontalDishes({
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
                return DishHomeItem(
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
