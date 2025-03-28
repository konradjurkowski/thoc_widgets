import 'package:flutter/material.dart';
import 'package:thoc_widgets/utils/constants.dart';

extension BuildContextExtension on BuildContext {
  bool get isDarkTheme => Theme.of(this).brightness == Brightness.dark;
  double get deviceHeight => MediaQuery.of(this).size.height;
  double get deviceWidth => MediaQuery.of(this).size.width;
  TextTheme get textTheme => Theme.of(this).textTheme;
  bool get isSmallDevice => deviceHeight < Constants.SMALL_DEVICE_HEIGHT;
  ColorScheme get colors => Theme.of(this).colorScheme;
}
