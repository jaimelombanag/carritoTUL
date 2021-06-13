import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsState());

  int total = 0;

  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    if (event is AddProducto) {
      print("=================state.counter   ${state.counter}");
      final int num = state.counter + 1;
      yield state.copyWith(counter: num);
    } else if (event is DeleteProducto) {
      if (state.counter > 1) {
        final int num = state.counter - 1;
        yield state.copyWith(counter: num);
      }
    } else if (event is AddProductCart) {
      yield state.copyWith(
          listCart: List.of(state.listCart)..addAll(event.listCart));
    } else if (event is AmounTotal) {
      print("=================   ${event.price}");
      total = event.price + total;
      yield state.copyWith(amounTotal: total);
    }
  }
}
