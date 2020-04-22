import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finance_app_ui/constants.dart';
import 'package:flutter/material.dart';

class BoxPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final DecorationImage image;
  final BoxShadow shadow;

  const BoxPanel({
    Key key,
    this.child,
    this.image,
    this.shadow = const BoxShadow(
      color: kShadowColor5,
      blurRadius: kSpacingUnit * 4,
      offset: Offset(0, kSpacingUnit * 2),
    ), this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 2,
        vertical: kSpacingUnit.w * 1.5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kSpacingUnit / 2),
        image: this.image,
        boxShadow: [
          this.shadow,
        ],
      ),
      child: this.child,
    );
  }
}