import 'package:flutter/widgets.dart';
import 'package:tulshop/src/models/products.dart';


class ProductsPageArguments {
  final String tag;
  final Products products;

  ProductsPageArguments({
    @required this.tag,
    @required this.products,
  });
}

class ProductsController extends ChangeNotifier {
  final String tag;
  Products products;
  VoidCallback onDispose;
  ProductsController(ProductsPageArguments arguments, this._isFavorite)
      : this.products = arguments.products,
        this.tag = arguments.tag;

  bool _isFavorite;
  bool get isFavorite => _isFavorite;

  void onCounterChanged(int counter) {
    this.products = this.products.updateCounter(counter);
  }

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  @override
  void dispose() {
    if (onDispose != null) {
      onDispose();
    }
    super.dispose();
  }
}