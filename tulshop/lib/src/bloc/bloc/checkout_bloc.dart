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
      yield state.copyWith(
        amounTotal: sumaTotal,
      );
    }
  }
}
