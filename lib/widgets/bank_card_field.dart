import 'package:finance_app_ui/widgets/bank_card_text.dart';
import 'package:flutter/material.dart';

class BankCardField extends StatelessWidget {
  final String label;
  final String value;

  BankCardField({
    this.label,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 4),
          child: BankCardText(
            this.label,
            fontSize: 10,
          ),
        ),
        BankCardText(
          this.value,
          fontSize: 14,
        ),
      ],
    );
  }
}
