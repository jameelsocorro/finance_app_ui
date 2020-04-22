import 'package:flutter/material.dart';

class Wallet {
  final String name;
  final double amount;
  final double percent;
  final double lineValue;
  final Color lineColor;

  Wallet({
    this.name,
    this.amount,
    this.percent,
    this.lineValue,
    this.lineColor,
  });
}
