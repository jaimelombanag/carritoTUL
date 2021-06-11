

import 'package:tulshop/src/models/products.dart';

abstract class TulMenuRepository {
  Future<List<Products>> getPopularMenu();
}
