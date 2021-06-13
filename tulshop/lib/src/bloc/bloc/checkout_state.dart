part of 'checkout_bloc.dart';

// @immutable
// abstract class CheckoutState {}

// class CheckoutInitial extends CheckoutState {}

class CheckOutState {
  final String subtotal;
  final String iva;
  final String domicilio;
  final String total;
  final int amounTotal;

  CheckOutState(
      {this.subtotal = '0',
      this.iva = '0',
      this.domicilio = '8000',
      this.total = '0',
      this.amounTotal = 0});

  CheckOutState copyWith({
    String subtotal,
    String iva,
    String domicilio,
    String total,
    int amounTotal,
  }) =>
      CheckOutState(
        subtotal: subtotal ?? this.subtotal,
        iva: iva ?? this.iva,
        domicilio: domicilio ?? this.domicilio,
        total: total ?? this.total,
        amounTotal: amounTotal ?? this.amounTotal,
      );
}
