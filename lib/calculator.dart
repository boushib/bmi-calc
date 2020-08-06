import 'dart:math';

class Calculator {
  final int height;
  final int weight;

  double _bmi;

  Calculator({ this.height, this.weight });

  String calculateBMI(){
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25) return 'Overweight';
    else if(_bmi >= 18.5) return 'Normal';
    else return 'Underweight';
  }

  String getFeedback(){
    String result = getResult();
    switch(result){
      case 'Overweight':
        return 'This is too bad! You shoud do some sport';
      case 'Normal':
        return "You're healthy! Keep up the good work!";
      default:
        return "Some error happended!";
    }
  }
}