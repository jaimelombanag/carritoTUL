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
    // TODO: implement mapEventToState
  }
}
