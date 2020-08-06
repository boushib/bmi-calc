import 'package:bmi_calculator/views/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/rounded-card.dart';
import '../components/gender-card.dart';
import '../constants/index.dart';
import '../calculator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMaleCardActive = true;
  bool isFemaleCardActive = false;

  int height = 50;
  int weight = 50;
  int age = 24;

  void updateGender({Gender gender}) {
    setState(() {
      isMaleCardActive = gender == Gender.male;
      isFemaleCardActive = !isMaleCardActive;
    });
  }

  void updateWeight({int newWeight}) {
    setState(() {
      weight = newWeight;
    });
  }

  void updateAge({int newAge}) {
    setState(() {
      age = newAge;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: GenderCard(
                      gender: Gender.male,
                      color: isMaleCardActive
                          ? kActiveCardColor
                          : kDefaultCardColor,
                      onPress: () {
                        updateGender(gender: Gender.male);
                      },
                    ),
                  ),
                  Expanded(
                    child: GenderCard(
                      gender: Gender.female,
                      color: isFemaleCardActive
                          ? kActiveCardColor
                          : kDefaultCardColor,
                      onPress: () {
                        updateGender(gender: Gender.female);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: RoundedCard(
                color: kDefaultCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Height".toUpperCase(),
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kLargeDigitsTextStyle,
                        ),
                        Text(
                          "cm",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromRGBO(255, 255, 255, .5)),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFFF935D),
                        overlayColor: Color(0x1FFF935D),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color.fromRGBO(255, 255, 255, .2),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 0,
                        max: 250.0,
                        label: "Choose your height",
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RoundedCard(
                      color: kDefaultCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Weight'.toUpperCase(),
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kLargeDigitsTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  updateWeight(newWeight: weight - 1);
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundedButton(
                                icon: Icons.add,
                                onPressed: () {
                                  updateWeight(newWeight: weight + 1);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: RoundedCard(
                      color: kDefaultCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Age'.toUpperCase(),
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kLargeDigitsTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  updateAge(newAge: age - 1);
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundedButton(
                                icon: Icons.add,
                                onPressed: () {
                                  updateAge(newAge: age + 1);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 60.0),
              child: Text(
                "Calculate your BMI",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.indigo,
              onPressed: () {
                Calculator calc = Calculator(height: height, weight: weight);
                String bmi = calc.calculateBMI();
                String result = calc.getResult();
                String feedback = calc.getFeedback();
                print("Your BMI is: $bmi");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(bmi: bmi, result: result, feedback: feedback)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundedButton({this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: kRounderButtonColor,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
      elevation: 4.0,
      focusElevation: 8.0,
      onPressed: onPressed,
    );
  }
}
