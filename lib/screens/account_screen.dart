import 'package:finance_app_ui/constants.dart';
import 'package:finance_app_ui/data/wallet_data.dart';
import 'package:finance_app_ui/widgets/app_content.dart';
import 'package:finance_app_ui/widgets/box_panel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var header = Padding(
      padding: EdgeInsets.all(kSpacingUnit.w * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset('assets/icons/arrow_left.svg'),
          ),
          InkWell(
            child: Container(
              height: kSpacingUnit.w * 4,
              width: kSpacingUnit.w * 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: kShadowColor1,
                    blurRadius: kSpacingUnit * 2,
                    offset: Offset(0, kSpacingUnit.w),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/avatar.png'),
                ),
              ),
            ),
          )
        ],
      ),
    );

    var accountHeading = Padding(
      padding: EdgeInsets.symmetric(
        vertical: kSpacingUnit.w,
        horizontal: kSpacingUnit.w * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Account',
            style: kHeadingTextStyle,
          ),
          Row(
            children: <Widget>[
              Text(
                'Add New',
                style: kBodyTextStyle,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w),
                child: SvgPicture.asset('assets/icons/plus.svg'),
              ),
            ],
          )
        ],
      ),
    );

    var summaryPanel = Row(
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 2),
        Expanded(
          child: BoxPanel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SvgPicture.asset('assets/icons/arrow_up.svg'),
                SizedBox(height: kSpacingUnit.w),
                Text(
                  '\$459.23',
                  style: kNumberTitleTextStyle,
                ),
                SizedBox(height: kSpacingUnit.w / 2),
                Text(
                  'Total Spent',
                  style: kBodyTextStyle,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: kSpacingUnit.w * 2),
        Expanded(
          child: BoxPanel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SvgPicture.asset('assets/icons/arrow_down.svg'),
                SizedBox(height: kSpacingUnit.w),
                Text(
                  '\$2049.95',
                  style: kNumberTitleTextStyle,
                ),
                SizedBox(height: kSpacingUnit.w / 2),
                Text(
                  'Total Received',
                  style: kBodyTextStyle,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: kSpacingUnit.w * 2),
      ],
    );

    var upgradeAccountBanner = BoxPanel(
      shadow: BoxShadow(
          color: kShadowColor2,
          blurRadius: kSpacingUnit.w * 4,
          offset: Offset(0, kSpacingUnit.w * 2)),
      margin: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 2,
      ),
      image: DecorationImage(
        image: AssetImage(
          'assets/images/upgrade_account_bg.png',
        ),
        fit: BoxFit.cover,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor1,
                  blurRadius: kSpacingUnit.w,
                  offset: Offset(0, kSpacingUnit / 2),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kSpacingUnit.w,
                vertical: kSpacingUnit.w / 2,
              ),
              child: Text(
                'Become Pro Member',
                style: kCaptionTextStyle.copyWith(
                  color: kPurpleColor,
                ),
              ),
            ),
          ),
          SizedBox(height: kSpacingUnit.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Upgrade your acount',
                style: kSubheaderTextStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SvgPicture.asset('assets/icons/arrow_right.svg'),
            ],
          ),
          SizedBox(height: kSpacingUnit.w),
        ],
      ),
    );

    var walletItems = Expanded(
      child: ListView(
        children: <Widget>[
          upgradeAccountBanner,          
          for (final wallet in walletMockData)
            BoxPanel(
              margin: EdgeInsets.symmetric(
                horizontal: kSpacingUnit.w * 2,
              ).copyWith(top: kSpacingUnit.w * 2),
              shadow: BoxShadow(
                color: kShadowColor5,
                blurRadius: kSpacingUnit * 4,
                offset: Offset(0, kSpacingUnit / 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    wallet.name,
                    style: kBodyTextStyle,
                  ),
                  SizedBox(height: kSpacingUnit.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '\$${wallet.amount}',
                        style: kNumberTitleTextStyle,
                      ),
                      Text(
                        '${wallet.percent.isNegative ? '' : '+'}${wallet.percent}%',
                        style: kSubheaderTextStyle.copyWith(
                            color: wallet.percent.isNegative
                                ? kRedColor
                                : kGreenColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: kSpacingUnit.w * 2),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: kSpacingUnit.w / 2,
                        width: ScreenUtil().uiWidthPx.toDouble(),
                        decoration: BoxDecoration(
                          color: kLineColor,
                          borderRadius: BorderRadius.circular(kSpacingUnit / 4),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: wallet.lineValue,
                        child: Container(
                          height: kSpacingUnit.w / 2,
                          decoration: BoxDecoration(
                            color: wallet.lineColor,
                            borderRadius:
                                BorderRadius.circular(kSpacingUnit / 4),
                            boxShadow: [
                              BoxShadow(
                                color: kShadowColor3,
                                blurRadius: kSpacingUnit.w,
                                offset: Offset(0, kSpacingUnit / 2),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: kSpacingUnit.w * 3),
                ],
              ),
            ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: AppContent(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: <Widget>[
              header,
              accountHeading,
              SizedBox(height: kSpacingUnit.w),
              summaryPanel,
              SizedBox(height: kSpacingUnit.w * 2),
              walletItems,
            ],
          ),
        ),
      ),
    );
  }
}
