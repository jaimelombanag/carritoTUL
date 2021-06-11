

import 'package:tulshop/src/food_menu_provider.dart';
import 'package:tulshop/src/food_menu_repository.dart';
import 'package:tulshop/src/models/dish.dart';

class FoodMenuRepositoryImpl implements FoodMenuRepository {
  final FoodMenuProvider _provider;

  FoodMenuRepositoryImpl(this._provider);
  @override
  Future<List<Dish>> getPopularMenu() {
    return _provider.getPopularMenu();
  }
}
