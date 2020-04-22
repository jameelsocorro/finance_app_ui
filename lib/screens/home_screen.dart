import 'package:finance_app_ui/constants.dart';
import 'package:finance_app_ui/data/cards_data.dart';
import 'package:finance_app_ui/data/transactions_data.dart';
import 'package:finance_app_ui/widgets/bank_card.dart';
import 'package:finance_app_ui/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _cardIndex = 1;

  _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(kSpacingUnit.w * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SvgPicture.asset('assets/icons/menu.svg'),
          Container(
            height: kSpacingUnit.h * 4,
            width: kSpacingUnit.h * 4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: kShadowColor1,
                  blurRadius: kSpacingUnit * 2,
                  offset: Offset(0, kSpacingUnit.h),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/images/avatar.png'),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildCarousel() {
    return Stack(
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
          bottom: kSpacingUnit.h * 2,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: cardsMockData.map((card) {
              return Container(
                width: kSpacingUnit.h,
                height: kSpacingUnit.h,
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
  }

  _buildCards() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: kSpacingUnit.h,
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
                    style: kButtonTextStyle,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w),
                    child: SvgPicture.asset('assets/icons/plus.svg'),
                  ),
                ],
              )
            ],
          ),
        ),
        _buildCarousel(),
      ],
    );
  }

  _buildTransactions() {
    return Expanded(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kSpacingUnit.w * 2,
            ).copyWith(
              top: kSpacingUnit.h * 2,
              bottom: kSpacingUnit.h,
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
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactionsMockData.length,
              itemBuilder: (BuildContext context, index) =>
                  TransactionItem(transactionsMockData[index]),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: AppContent(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: <Widget>[
              this._buildHeader(),
              this._buildCards(),
              this._buildTransactions(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppContent extends StatelessWidget {
  final Widget child;

  const AppContent({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: kBackgroundColor,
            border: Border(
              right: BorderSide(
                color: Colors.white,
                width: 135,
              ),
            ),
          ),
        ),
        this.child,
      ],
    );
  }
}
