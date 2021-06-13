part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutEvent {}

class UpdateCheckOut extends CheckoutEvent {
  final int total;
  UpdateCheckOut(this.total);
}

class UpdateAmount extends CheckoutEvent {
  final int amount;
  UpdateAmount(this.amount);
}
