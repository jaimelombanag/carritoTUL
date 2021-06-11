

import 'package:tulshop/src/models/products.dart';

abstract class FoodMenuRepository {
  Future<List<Products>> getPopularMenu();
}
