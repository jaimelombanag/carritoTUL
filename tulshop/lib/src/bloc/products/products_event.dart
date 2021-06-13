part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}

class AddProducto extends ProductsEvent {}

class DeleteProducto extends ProductsEvent {}

class AddProductCart extends ProductsEvent {
  final List<Products> listCart;
  AddProductCart(this.listCart);
}

class AmounTotal extends ProductsEvent {
  final int price;
  AmounTotal(this.price);
}

class DeleteList extends ProductsEvent{
  
}
