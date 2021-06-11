import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:tulshop/src/food_menu_repository.dart';
import 'package:tulshop/src/models/category.dart';
import 'package:tulshop/src/models/dish.dart';

class HomeInitController extends ChangeNotifier {
  final FoodMenuRepository _foodMenuRepository =
      GetIt.instance<FoodMenuRepository>();

  final List<Category> categories = [
    Category(
      iconPath: "assets/pages/home/home_tab/breakfast.svg",
      label: "Breakfast",
    ),
    Category(
      iconPath: "assets/pages/home/home_tab/fries.svg",
      label: "Fast food",
    ),
    Category(
      iconPath: "assets/pages/home/home_tab/dinner.svg",
      label: "Dinner",
    ),
    Category(
      iconPath: "assets/pages/home/home_tab/dessert.svg",
      label: "Desserts",
    ),
  ];

  List<Dish> _popularMenu = [];
  List<Dish> get popularMenu => _popularMenu;

  

  void afterFirstLayout() {
    _init();
  }

  void _init() async {
    _popularMenu = await _foodMenuRepository.getPopularMenu();
    notifyListeners();
  }
}
