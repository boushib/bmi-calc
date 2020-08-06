import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  final Color color;
  final Widget child;

  RoundedCard({@required this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: color,
      ),
      child: child,
      height: double.infinity,
      width: double.infinity,
    );
  }
}