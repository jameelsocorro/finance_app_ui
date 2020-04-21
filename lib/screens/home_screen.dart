import 'package:finance_app_ui/data/cards_data.dart';
import 'package:finance_app_ui/data/transactions_data.dart';
import 'package:finance_app_ui/widgets/bank_card.dart';
import 'package:finance_app_ui/widgets/transaction_list_item.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _cardIndex = 1;

  _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/icons/menu.png',
              height: 15,
              width: 20,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(149, 190, 207, 0.50),
                  blurRadius: 12,
                  offset: Offset(-2, 4),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 16,
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
                      child: Image.asset(
                        'assets/icons/plus.png',
                        width: 13,
                        height: 13,
                      ),
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
                  child: Image.asset(
                    'assets/icons/more.png',
                    height: 4,
                    width: 16,
                  ),
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
      backgroundColor: Color(0xFFFBF8FF),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            right: 0,
            left: MediaQuery.of(context).size.width - 135,
            top: -50,
            bottom: 0,
            child: Container(
              color: Colors.white,
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              children: <Widget>[
                this._buildHeader(),
                this._buildCards(),
                this._buildTransactions(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
