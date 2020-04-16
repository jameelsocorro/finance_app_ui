import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
              boxShadow: <BoxShadow>[
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
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF8FF),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            this._buildHeader(),
            this._buildCards(),
          ],
        ),
      ),
    );
  }
}
