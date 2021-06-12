part of 'products_bloc.dart';

// @immutable
// abstract class ProductsState {}

// class ProductsInitial extends ProductsState {}

// class ProductsState {
//   final String name;
//   final String sku;
//   final String descripcion;
//   final String costo;
//   final String image;

//   ProductsState({
//     this.name,
//     this.sku,
//     this.descripcion,
//     this.costo,
//     this.image,
//   });
//}

class ProductsState {
  final int counter;
  final List<Products> listCart;

  ProductsState({
    this.counter = 1,
    this.listCart = const <Products>[],
  });

   ProductsState copyWith({
    int counter,
    List<Products> listCart,
   
  }) => ProductsState(
    counter  : counter ?? this.counter,
    listCart : listCart ?? this.listCart,  
  );
}
