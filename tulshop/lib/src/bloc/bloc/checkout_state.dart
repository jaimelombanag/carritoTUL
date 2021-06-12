part of 'checkout_bloc.dart';

// @immutable
// abstract class CheckoutState {}

// class CheckoutInitial extends CheckoutState {}

class CheckOutState {
  final String subtotal;
  final String iva;
  final String domicilio;
  final String total;

  CheckOutState(
      {this.subtotal = '0',
      this.iva = '0',
      this.domicilio = '0',
      this.total = '0'});
}
