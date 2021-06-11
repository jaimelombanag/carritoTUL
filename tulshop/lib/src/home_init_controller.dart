import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:tulshop/src/models/products.dart';
import 'package:tulshop/src/repository/tul_menu_repository.dart';


class HomeInitController extends ChangeNotifier {
  final TulMenuRepository _foodMenuRepository =
      GetIt.instance<TulMenuRepository>();

  

  List<Products> _popularMenu = [];
  List<Products> get popularMenu => _popularMenu;

  

  void afterFirstLayout() {
    _init();
  }

  void _init() async {
    _popularMenu = await _foodMenuRepository.getPopularMenu();
    notifyListeners();
  }
}
