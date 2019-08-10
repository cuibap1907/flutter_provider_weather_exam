import 'package:flutter/material.dart';

class WeatherInfo with ChangeNotifier {
  String _tempType = "celcius";
  int _temperatureVal = 25;

  int get temperatureValue => _temperatureVal;
  String get temperatureType => _tempType;

  set temperatureValue(int newval)
  {
    _temperatureVal = newval;
    notifyListeners();
  }

  set temperatureType(String newtype)
  {
    _tempType = newtype;
    notifyListeners();
  }
}