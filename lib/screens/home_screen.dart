import 'package:finance_app_ui/constants.dart';
import 'package:finance_app_ui/data/cards_data.dart';
import 'package:finance_app_ui/data/transactions_data.dart';
import 'package:finance_app_ui/widgets/bank_card.dart';
import 'package:finance_app_ui/widgets/transaction_list_item.dart';
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
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: kShadowColor1,
                  blurRadius: kSpacingUnit.w * 2,
                  offset: Offset(0, kSpacingUnit.w),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: kSpacingUnit.w * 2,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
          )
        ],
      ),
    );
  }

  _buildCarousel() {
    return Stack(
      children: <Widget>[
        Container(
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 250,
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
        ),
        Positioned(
          bottom: 32,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: cardsMockData.map((card) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cardsMockData[_cardIndex].number == card.number
                      ? Color(0xFF5D92EB)
                      : Colors.white,
                  border: Border.all(
                    color: Color(0xFF5D92EB),
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Cards',
                style: TextStyle(
                  color: Color(0xFF151C2A),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    Text(
                      'Add New',
                      style: TextStyle(
                        color: Color(0xFF7E8EAA),
                        fontSize: 13,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset('assets/icons/plus.svg'),
                    ),
                  ],
                ),
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
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Transactions',
                  style: TextStyle(
                    color: Color(0xFF151C2A),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset('assets/icons/more.svg'),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactionsMockData.length,
              itemBuilder: (BuildContext context, index) =>
                  TransactionListItem(transactionsMockData[index]),
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
              // this._buildCards(),
              // this._buildTransactions(),
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
