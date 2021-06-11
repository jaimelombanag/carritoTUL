import 'package:flutter/widgets.dart';
import 'package:tulshop/src/models/products.dart';


class MyCartController extends ChangeNotifier {
  Map<int, Products> _cart = {};
  Map<int, Products> get cart => _cart;

  bool isInCart(Products products) {
    return _cart.containsKey(products.id);
  }

  bool get hasItems => _cart.length > 0;

  double get subtotal => double.parse(
        cart.values.map((e) => e.price * e.counter).toList().reduce((v, e) => v + e).toStringAsFixed(2),
      );
  double get taxAndFee => double.parse((subtotal * 0.12 + 1).toStringAsFixed(2));
  double get delivery => 2.0;
  double get total => double.parse((subtotal + taxAndFee + delivery).toStringAsFixed(2));

  int getDishCounter(Products products) {
    if (isInCart(products)) {
      return _cart[products.id].counter;
    }
    return 0;
  }

  void addToCart(Products products, {bool update = true}) {
    Map<int, Products> copy = Map<int, Products>.from(_cart);
    copy[products.id] = products;
    _cart = copy;
    if (update) {
      notifyListeners();
    }
  }

  void deleteFromCart(Products products) {
    Map<int, Products> copy = Map<int, Products>.from(_cart);
    if (copy.containsKey(products.id)) {
      copy.remove(products.id);
      _cart = copy;
      notifyListeners();
    }
  }
}
