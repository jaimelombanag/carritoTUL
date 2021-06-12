part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}

class AddProducto extends ProductsEvent {}

class DeleteProducto extends ProductsEvent {}

class AddProductCart extends ProductsEvent {
  final List<Products> listCart;
  AddProductCart(this.listCart);
}
