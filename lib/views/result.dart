import 'package:bmi_calculator/components/rounded-card.dart';
import 'package:bmi_calculator/constants/index.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  String bmi;
  String result;
  String feedback;

  ResultPage({ @required this.bmi, @required this.result, @required this.feedback });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your BMI results'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: RoundedCard(
              color: kDefaultCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(result, style: TextStyle(
                    color: Colors.green,
                    fontSize: 22.0,
                  ),),
                  Text(bmi, style: kLargeDigitsTextStyle,),
                  Text(feedback)
                ],
              ),
            ),
          ),
          RaisedButton(
            child: Text(
              'Recalculate BMI',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.green,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
