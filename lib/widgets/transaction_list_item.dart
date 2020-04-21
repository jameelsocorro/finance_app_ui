import 'package:flutter/material.dart';
import 'package:finance_app_ui/models/transaction_model.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;

  TransactionListItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(207, 236, 248, 0.5),
                    blurRadius: 24,
                    offset: Offset(0, 10),
                  )
                ]),
            child: Center(
              heightFactor: 20,
              child: Image.asset(
                'assets/icons/${this.transaction.logo}.png',
                height: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.transaction.title,
                    style: TextStyle(
                      color: Color(0xFF151C2A),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    this.transaction.description,
                    style: TextStyle(
                      color: Color(0xFF7E8EAA),
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '${this.transaction.value.isNegative ? '-' : '+'}\$${this.transaction.value}',
                style: TextStyle(
                    color: this.transaction.value.isNegative
                        ? Color(0xFFEE6B8D)
                        : Color(0xFF30C96B),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                this.transaction.date,
                style: TextStyle(
                  color: Color(0xFF7E8EAA),
                  fontSize: 10,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
