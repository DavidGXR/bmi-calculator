import 'dart:math';

class CalculatorBrain {

  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    this._bmi = weight / pow(height/100, 2);
    return this._bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (this._bmi >= 25) {
      return 'Overweight';
    } else if (this._bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }

  }

  String getInterpretation() {
    if (this._bmi >= 25) {
      return 'You are overweight. Try to exercise more!';
    } else if (this._bmi > 18.5) {
      return 'Your weight is normal. Don\'t forget to do exercise daily to maintain healthy lifestyle.';
    } else {
      return 'You\'re underweight. Try to eat more!';
    }
  }

}// End of class