part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

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
