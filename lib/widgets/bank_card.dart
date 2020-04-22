import 'package:finance_app_ui/models/card_detail_model.dart';
import 'package:finance_app_ui/widgets/bank_card_field.dart';
import 'package:finance_app_ui/widgets/bank_card_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BankCard extends StatelessWidget {
  final CardDetail cardDetail;

  BankCard(this.cardDetail);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20, bottom: 60, left: 10, right: 10),
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
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset('assets/icons/visa.svg'),
                SvgPicture.asset(
                  'assets/icons/more.svg',
                  color: Colors.white,
                ),
              ],
            ),
            BankCardText(
              this.cardDetail.number,
              fontSize: ScreenUtil().setSp(22),
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
