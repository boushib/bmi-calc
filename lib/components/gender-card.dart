
import 'package:flutter/material.dart';
import './rounded-card.dart';
import '../constants/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderCard extends StatelessWidget {
  final Gender gender;
  final Color color;
  final Function onPress;

  GenderCard(
      {@required this.gender, @required this.color, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: RoundedCard(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              gender == Gender.male
                  ? FontAwesomeIcons.mars
                  : FontAwesomeIcons.venus,
              size: 50.0,
              color: Color.fromRGBO(255, 255, 255, .8),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              gender == Gender.male ? "Male" : "Female",
              style: kLabelTextStyle,
            )
          ],
        ),
      ),
    );
  }
}

enum Gender { male, female }
