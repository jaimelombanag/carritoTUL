

import 'package:tulshop/src/models/products.dart';
import 'package:tulshop/src/repository/tul_menu_repository.dart';
import 'package:tulshop/src/tul_menu_provider.dart';


class TulMenuRepositoryImpl implements TulMenuRepository {
  final TulMenuProvider _provider;

  TulMenuRepositoryImpl(this._provider);
  @override
  Future<List<Products>> getPopularMenu() {
    return _provider.getPopularMenu();
  }
}