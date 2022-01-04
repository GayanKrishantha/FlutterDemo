import 'package:flutter/material.dart';
import 'extension.dart';
import 'dart:core';

class IconTypes {
  static const alarm = 1;
  static const business = 2;
  static const bookmark = 3;
  static const breakfast = 4;
  static const home = 5;
  static const pharmacy = 6;

  static String displayText(int type) {
    switch (type) {
      case alarm:
        return 'assets/images/baseline_alarm_black_24pt.png';
      case business:
        return 'assets/images/baseline_business_center_black_24pt.png';
      case bookmark:
        return 'assets/images/baseline_class_black_24pt.png';
      case breakfast:
        return 'assets/images/baseline_free_breakfast_black_24pt.png';
      case home:
        return 'assets/images/baseline_home_black_24pt.png';
      case pharmacy:
        return 'assets/images/baseline_local_pharmacy_black_24pt.png';
      default:
        return 'None';
    }
  }
}

class CheckBoxTypes {
  static const empty = 1;
  static const checkedWhite = 2;
  static const checkedGreen = 3;

  static String displayText(int type) {
    switch (type) {
      case empty:
        return 'assets/images/Ellipse.png';
      case checkedWhite:
        return 'assets/images/Checked.png';
      case checkedGreen:
        return 'assets/images/Group.png';
      default:
        return 'None';
    }
  }
}

class Dimensions {
  static const pX200 = 200.0;
  static const pX150 = 150.0;
  static const pX60 = 60.0;
  static const pX64 = 64.0;
  static const pX48 = 48.0;
  static const pX40 = 40.0;
  static const pX32 = 32.0;
  static const pX24 = 24.0;
  static const pX22 = 22.0;
  static const pX20 = 20.0;
  static const pX18 = 18.0;
  static const pX16 = 16.0;
  static const pX14 = 14.0;
  static const pX12 = 12.0;
  static const pX10 = 10.0;
  static const pX8 = 8.0;
  static const pX6 = 6.0;
  static const pX4 = 4.0;
  static const pX2 = 2.0;
}

class AppColors {
  final Color primary = HexColor("#E6E6E6");
  final Color accent = HexColor("#51878F");
  final Color unSelect = HexColor("#FAFAFA");
  final Color date = HexColor("#6A6A6A");
}

class AppTheme {
  static String fontFamily = "AvenirNext";
  final TextStyle appTitle = TextStyle(
      fontWeight: FontWeight.w100,
      fontSize: 22,
      fontFamily: fontFamily,
      color: Colors.black);
  final TextStyle appSubTitle = TextStyle(
      fontWeight: FontWeight.w100,
      fontSize: 16,
      fontFamily: fontFamily,
      color: Colors.black);
  final TextStyle titleBlack = TextStyle(
      fontWeight: FontWeight.w100,
      fontSize: 18,
      fontFamily: fontFamily,
      color: Colors.black);
  final TextStyle titleWhite = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 18,
      fontFamily: fontFamily,
      color: Colors.white);
  final TextStyle subTitleBlack = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14,
      fontFamily: fontFamily,
      color: Colors.black);
  final TextStyle subTitleWhite = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 14,
      fontFamily: fontFamily,
      color: Colors.white);
  final TextStyle titleDate = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 22,
      fontFamily: fontFamily,
      color: AppColors().date);
}

class AppDateFormat {
  final String apiDateFormatter = 'yyyy-MM-dd hh:mm:ss';
  final String appDateFormatter = 'EEEE DD MMM';
}
