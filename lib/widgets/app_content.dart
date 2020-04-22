import 'package:finance_app_ui/constants.dart';
import 'package:flutter/material.dart';

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
