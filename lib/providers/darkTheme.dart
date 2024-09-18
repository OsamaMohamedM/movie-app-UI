import 'package:flutter/material.dart';

class darktheme with ChangeNotifier
{
  static bool _isDark = false;

  bool get isDark=>_isDark;
  void change()
  {
    _isDark=!_isDark;
    notifyListeners();
  }
}