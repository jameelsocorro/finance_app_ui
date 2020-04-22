import 'package:finance_app_ui/constants.dart';
import 'package:finance_app_ui/models/wallet_model.dart';

final walletMockData = [
  Wallet(
    name: 'Main Wallet',
    amount: 2049.95,
    percent: 32,
    lineValue: 0.6,
    lineColor: kGreenColor,
  ),
  Wallet(
    name: 'Savings Wallet',
    amount: 32.42,
    percent: -0.4,
    lineValue: 0.3,
    lineColor: kRedColor,
  ),
  Wallet(
    name: 'Summer Wallet',
    amount: 332.42,
    percent: 2.6,
    lineValue: 0.5,
    lineColor: kPurpleColor,
  )
];