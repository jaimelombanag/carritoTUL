import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tulshop/src/bloc/bloc/checkout_bloc.dart';

class CheckOutPreview extends StatelessWidget {
  const CheckOutPreview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      padding:
          EdgeInsets.symmetric(horizontal: 30, vertical: 15).copyWith(top: 30),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<CheckoutBloc, CheckOutState>(
              builder: (context, state) {


                print("🕳️🕳️🕳️🕳️🕳️🕳️🕳️🕳️🕳️    ${state.amounTotal}");

                return Table(
                  children: [
                    _buildTableRow("Subtotal", "\$${state.subtotal}"),
                    _buildTableRow("Iva", "\$${state.iva}"),
                    _buildTableRow("Domicilio", "\$${state.domicilio}"),
                    _buildTableRow("Total", "\$${state.subtotal}"),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                onPressed: () {},
                color: Colors.white,
                child: Text(
                  "CHECKOUT",
                  style: TextStyle(
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
