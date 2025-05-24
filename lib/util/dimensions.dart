import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {

  final width = MediaQuery.of(Get.context!).size.width;
  static double height = MediaQuery.of(Get.context!).size.height;

  static double fontSize10 = height / 87; /// around 10
  static double fontSize12 = height / 68; /// around 12
  static double fontSize14 = height / 58; /// around 14
  static double fontSize16 = height / 51; /// around 16
  static double fontSize18 = height / 45; /// around 18
  static double fontSize20 = height / 40; /// around 20

  static const double fontSizeOverExtraSmall = 10.0;
  static const double fontSizeExtraSmall = 12.0;
  static const double fontSizeSmall = 14.0;
  static const double fontSizeDefault = 16.0;
  static const double fontSizeLarge = 18.0;
  static const double fontSizeExtraLarge = 20.0;
  static const double fontSizeOverLarge = 24.0;


  static const double paddingSizeExtraSmall = 5.0;
  static const double paddingSizeMediumSmall = 8.0;

  static const double paddingSizeSmall = 10.0;
  static const double paddingSizeDefault = 16.0;
  static const double paddingSizeLarge = 18.0;
  static const double paddingSizeMiniLarge = 20.0;
  static const double paddingSizeExtraLarge = 25.0;

  static const double smallSizeFont = 11.0;
  static const double mediumSmallSizeFont = 13.0;
  static const double bigSizeFont = 32.0;

}