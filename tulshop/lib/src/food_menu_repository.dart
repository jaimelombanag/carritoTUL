

import 'package:tulshop/src/models/dish.dart';

abstract class FoodMenuRepository {
  Future<List<Dish>> getPopularMenu();
}
