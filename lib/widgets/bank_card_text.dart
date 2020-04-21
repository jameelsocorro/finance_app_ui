import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankCardText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  BankCardText(
    this.text, {
    this.fontSize,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,      
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'TTNorms',
        fontSize: ScreenUtil().setSp(this.fontSize),
        fontWeight: this.fontWeight,
        shadows: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.10),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
    );
  }
}
