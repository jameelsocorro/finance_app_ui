import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Spacing
const kSpacingUnit = 10.0;

// Colors
const kTextColor = Color(0xFF151C2A);
const kTextSecondaryColor = Color(0xFF7E8EAA);
const kPrimaryColor = Color(0xFF5D92EB);
const kGreenColor = Color(0xFF30C96B);
const kRedColor = Color(0xFFEE6B8D);
const kPurpleColor = Color(0xFFC482F9);
const kBackgroundColor = Color(0xFFFBF8FF);
const kShadowColor1 = Color.fromRGBO(149, 190, 207, 0.50);
const kShadowColor2 = Color(0xFFCFECF8);
const kShadowColor3 = Color.fromRGBO(0, 0, 0, 0.10);
const kShadowColor4 = Color.fromRGBO(207, 236, 248, 0.50);

// My Text Styles
final kHeadingTextStyle = TextStyle(  
  fontSize: ScreenUtil().setSp(24),
  color: kTextColor,
  fontWeight: FontWeight.w600,
);

final kSubheaderTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(20),
  color: kTextColor,
  fontWeight: FontWeight.w600,
);

final kTitleTextStyle = TextStyle(  
  fontSize: ScreenUtil().setSp(16),
  color: kTextColor,
);

final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(13),
  color: kTextSecondaryColor,
);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(10),
  color: kTextSecondaryColor,
);

final kCardTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  color: Colors.white,
  shadows: [
    BoxShadow(
      color: kShadowColor3,
      blurRadius: kSpacingUnit.h,
      offset: Offset(0, kSpacingUnit.h * 0.5),
    ),
  ],
);