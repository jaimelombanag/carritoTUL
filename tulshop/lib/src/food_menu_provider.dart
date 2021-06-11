import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tulshop/src/models/dish.dart';


class FoodMenuProvider {
  Future<List<Dish>> getPopularMenu() async {
    final jsonAsString = await rootBundle.loadString('assets/json/popular_menu.json');
    final List list = jsonDecode(jsonAsString);
    List<Dish> dishes = [];
    for (final Map<String, dynamic> item in list) {
      final dish = Dish(
        id: item['id'],
        name: item['name'],
        photo: item['preview'],
        price: double.parse(
          item['price'].toString(),
        ),
        rate: double.parse(
          item['rate'].toString(),
        ),
        description: item['description'],
      );

      dishes.add(dish);
    }

    return dishes;
  }
}
