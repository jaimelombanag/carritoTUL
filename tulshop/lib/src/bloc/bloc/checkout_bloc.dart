import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckOutState> {
  CheckoutBloc() : super(CheckOutState());

  @override
  Stream<CheckOutState> mapEventToState(
    CheckoutEvent event,
  ) async* {
    if (event is UpdateAmount) {
      int sumaTotal = event.amount + state.amounTotal;
      int ivaTotal = (sumaTotal * 0.16).toInt();
      int total = sumaTotal + ivaTotal.toInt() + 8000;
      yield state.copyWith(
        amounTotal: sumaTotal,
        iva: ivaTotal.toString(),
        total: total.toString(),
      );
    } else if (event is UpdateCheckOut) {
      yield CheckOutState();
    }
  }
}
