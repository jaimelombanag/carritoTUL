import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsState());

  

  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    if (event is AddProducto) {
      final int num = state.counter + 1;
      yield ProductsState(counter: num);
    } else if (event is DeleteProducto) {
      if (state.counter > 1) {
        final int num = state.counter - 1;
        yield ProductsState(counter: num);
      }
    } else if (event is AddProductCart) {
      yield state.copyWith(listCart: List.of(state.listCart)..addAll(event.listCart));
    }
  }

}
