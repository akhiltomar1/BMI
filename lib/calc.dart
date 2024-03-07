import 'dart:math';

class cal {

  cal(
      {required this.height,
        required this.weight}
      );

  final int height;
  final int weight;
  double _bmi = 1.0;

  String calculateBMI(){

    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(2);

  }

  String getResult(){

    if(_bmi >= 25){
      return'Overweight';
    }
    else if(_bmi > 18.5 ){
      return'Normal';
    }
    else{
      return'Underweight';
    }
  }

  String getInt(){
    if(_bmi >= 25){
      return'You have a higher than normal body weight. Exercise more !';
    }
    else if(_bmi > 18.5){
      return'You have a normal body weight. Good job !';
    }
    else{
      return'You have a lower than normal body weight. Eat more !';
    }
  }


}