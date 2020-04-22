import 'package:finance_app_ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:finance_app_ui/models/transaction_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  TransactionItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kSpacingUnit.w * 2).copyWith(bottom: 0),
      child: Row(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 6,
            width: kSpacingUnit.w * 6,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: kShadowColor4,
                    blurRadius: 24,
                    offset: Offset(0, kSpacingUnit.h),
                  )
                ]),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/${this.transaction.logo}.svg',
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 1.5),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Muli'),
                  children: [
                    TextSpan(
                      text: '${this.transaction.title}\n',
                      style: kTitleTextStyle,
                    ),
                    TextSpan(
                      text: this.transaction.description,
                      style: kCaptionTextStyle.copyWith(height: 1.5),
                    )
                  ],
                ),
              ),
            ),
          ),
          RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              style: TextStyle(fontFamily: 'Muli'),
              children: [
                TextSpan(
                  text:
                      '${this.transaction.value.isNegative ? '-' : '+'}\$${this.transaction.value}\n',
                  style: kTitleTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: this.transaction.value.isNegative
                        ? Color(0xFFEE6B8D)
                        : Color(0xFF30C96B),
                  ),
                ),
                TextSpan(
                  text: this.transaction.date,
                  style: kCaptionTextStyle.copyWith(height: 1.5),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
