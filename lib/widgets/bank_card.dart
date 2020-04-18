import 'package:finance_app_ui/models/card_detail_model.dart';
import 'package:finance_app_ui/widgets/bank_card_field.dart';
import 'package:finance_app_ui/widgets/bank_card_text.dart';
import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  final CardDetail cardDetail;

  BankCard(this.cardDetail);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 16, bottom: 60, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/${this.cardDetail.background}.png'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFCFECF8),
            blurRadius: 30,
            offset: Offset(0, 20),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  'assets/icons/visa.png',
                  height: 15,
                  width: 50,
                ),
                Image.asset(
                  'assets/icons/more_white.png',
                  height: 4,
                  width: 16,
                ),
              ],
            ),
            BankCardText(
              this.cardDetail.number,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: BankCardField(
                    label: 'Card Holder',
                    value: this.cardDetail.name,
                  ),
                ),
                Expanded(
                  child: BankCardField(
                    label: 'Expiry',
                    value: this.cardDetail.expiry,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
