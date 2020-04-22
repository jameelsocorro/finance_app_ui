import 'package:finance_app_ui/constants.dart';
import 'package:finance_app_ui/data/cards_data.dart';
import 'package:finance_app_ui/data/transactions_data.dart';
import 'package:finance_app_ui/screens/account_screen.dart';
import 'package:finance_app_ui/widgets/app_content.dart';
import 'package:finance_app_ui/widgets/bank_card.dart';
import 'package:finance_app_ui/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _cardIndex = 1;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: true);

    var header = Padding(
      padding: EdgeInsets.all(kSpacingUnit.w * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SvgPicture.asset('assets/icons/menu.svg'),
          InkWell(
            onTap: () => Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: AccountScreen(),
              ),
            ),
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

    var cardHeading = Padding(
      padding: EdgeInsets.symmetric(
        vertical: kSpacingUnit.w,
        horizontal: kSpacingUnit.w * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Cards',
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

    var cardCarousel = Stack(
      children: <Widget>[
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 220,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: _cardIndex,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _cardIndex = index;
              });
            },
          ),
          itemCount: cardsMockData.length,
          itemBuilder: (BuildContext context, int index) =>
              BankCard(cardsMockData[index]),
        ),
        Positioned(
          bottom: kSpacingUnit.w * 2,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: cardsMockData.map((card) {
              return Container(
                width: kSpacingUnit.w,
                height: kSpacingUnit.w,
                margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w / 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cardsMockData[_cardIndex].number == card.number
                      ? kPrimaryColor
                      : Colors.transparent,
                  border: Border.all(
                    color: kPrimaryColor,
                    width: 1.5,
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );

    var transactionHeading = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 2,
      ).copyWith(
        top: kSpacingUnit.w * 2,
        bottom: kSpacingUnit.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Transactions',
            style: kHeadingTextStyle,
          ),
          SvgPicture.asset(
            'assets/icons/more.svg',
            color: kTextSecondaryColor,
          )
        ],
      ),
    );

    var transactions = Expanded(
      child: ListView.builder(
        itemCount: transactionsMockData.length,
        itemBuilder: (BuildContext context, index) =>
            TransactionItem(transactionsMockData[index]),
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
              cardHeading,
              cardCarousel,
              transactionHeading,
              transactions,
            ],
          ),
        ),
      ),
    );
  }
}
