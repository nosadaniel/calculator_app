import 'dart:math';

class BmiCalculator {
  BmiCalculator({this.height, this.weight});

  double _bmi;
  double height, weight;

  String getBmi() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getStatus() {
    if (_bmi < 18.5) {
      return 'Underweight';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'Healthy';
    } else {
      return 'Overweight';
    }
  }

  String getInterpretation() {
    if (_bmi < 18.5) {
      return 'Please try and be eating good food.';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'Your body mass index is Normal.';
    } else {
      return 'Your body mass index is Anormal... Please try and exercise more.';
    }
  }
}
