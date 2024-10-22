

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class BmiProvider  extends ChangeNotifier{
  double _bmi =0.0;
  String get bmi => _bmi.toStringAsFixed(1);
  final bmiStatusMap = {
    underweightSevere: 'less then 16.0',
    underweightModerate: '16.0-16.9',
    underweightMild: '17.0-18.4',
    normal: '18.5 -24.9',
    preObese: '25.0 -29.9',
    Obese: '30.0-34.9',
    Obese2: '35.0- 39.9',
    Obese3: '40.0 and up'
  };
  String getBmiStatus() {
    if (_bmi < 16.0) return underweightSevere;
    if (_bmi > 16.0 && _bmi <= 16.9) return underweightModerate;
    if (_bmi > 17.0 && _bmi <= 18.4) return underweightMild;
    if (_bmi > 18.5 && _bmi <= 24.9) return normal;
    if (_bmi > 25.0 && _bmi <= 29.9) return preObese;
    if (_bmi > 30.0 && _bmi <= 34.9) return Obese;
    if (_bmi > 35.0 && _bmi <= 39.9) return Obese2;
    return Obese3;
  }
  Color? getTileColor(String status){
    if(getBmiStatus()==status) return Colors.grey;
    return null;
  }

  void calculatebmi(String h,String w) {
    final weight = double.parse(w);
    final height = double.parse(h);
  _bmi = weight / (height * height);

  }

  static const  underweightSevere = ' underweight\n(Severe thinness)';
  static const underweightModerate = ' underweight\n(Moderate thinness)';
  static const underweightMild = ' underweight\n(Mild thinness)';
  static const normal = 'Normal Range ';
  static const preObese = 'Overweight \n(Pre-Obese)';
  static const Obese = 'obese\n(Class I)';
  static const Obese2 = 'obese\n(Class II)';
  static const Obese3 = 'obese\n(Class III)';



}