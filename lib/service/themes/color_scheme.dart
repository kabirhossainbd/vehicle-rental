import 'package:flutter/material.dart';

extension CustomColorScheme on ColorScheme {
  Color get baseColor =>
      brightness == Brightness.light ? Colors.white : Colors.white;

  Color get baseLightColor =>
      brightness == Brightness.light ? Colors.white60 : Colors.black54;

  Color get shadowColor =>
      brightness == Brightness.light ? Colors.white60 : Colors.black54;

  Color get crossColor =>
      brightness == Brightness.light ? Colors.grey : Colors.grey;

  Color get appBarScaffoldBackgroundColor =>
      brightness == Brightness.light ? whiteColor : const Color(0xffd9d9d9);

  Color get appScaffoldBackgroundColor =>
      brightness == Brightness.light ? const Color(0xffF5F5F5) : const Color(0xffd9d9d9);

  Color get appBackground =>
      brightness == Brightness.light ? const Color(0xffF5F5F5) : const Color(0xffd9d9d9);

  Color get appBarColor =>
      brightness == Brightness.light ? const Color(0xff497de3) : const Color(0xff497de3);

  Color get dividerColor =>
      brightness == Brightness.light ? const Color(0xFFeeeeee) : const Color(0xFFeeeeee);

  Color get cardBgColor =>
      brightness == Brightness.light ? const Color(0xffF5F5F5) : const Color(0xff212121);

  Color get iconCardBgColor =>
      brightness == Brightness.light ? const Color(0xffF5F5F5) : Colors.black;

  Color get toolbarExpandedColor =>
      brightness == Brightness.light ? const Color(0xFFffffff) : const Color(0xFF000000);

  Color get toolbarCollapsedColor =>
      brightness == Brightness.light ? const Color(0xFFffffff) : const Color(0xFF212121);

  Color get dialogBgColor =>
      brightness == Brightness.light ? Colors.white : const Color(0xff212121);

  Color get infoDialogBgColor =>
      brightness == Brightness.light ? const Color(0xFFf7f7f7) : const Color(0xff212121);

  Color get dialogGifBgColor =>
      brightness == Brightness.light ? Colors.white : const Color(0xff424242);

  Color get triangleLineColor =>
      brightness == Brightness.light ? const Color(0xffeeeeee) : const Color(0xff424242);

  Color get gray_20 =>
      brightness == Brightness.light ? const Color(0xffF5F5F5) : const Color(0xffF5F5F5);

  Color get textColorWhite =>
      brightness == Brightness.light ? const Color(0xFFffffff) : const Color(0xFF000000);

  Color get textColor =>
      brightness == Brightness.light ? const Color(0xFF000000) : const Color(0xFFffffff);

  Color get yellowColor =>
      brightness == Brightness.light ? const Color(0xFFFFC202) : const Color(0xFFFFC202);

  Color get lightGray =>
      brightness == Brightness.light ? const Color(0xffC8C8C8) : const Color(0xffC8C8C8);

  Color get textGray => brightness == Brightness.light ? const Color(0xff666666) : const Color(0xff666666);

  Color get lightBorder =>
      brightness == Brightness.light ? const Color(0xff50C763) : const Color(0xff50C763);

  Color get buyerBackground =>
      brightness == Brightness.light ? const Color(0xffe9fff0) : const Color(0xffe9fff0);

  Color get buyerProgress =>
      brightness == Brightness.light ? const Color(0xff9cfdbb) : const Color(0xff9cfdbb);

  Color get primary =>
      brightness == Brightness.light ? const Color(0xFF0054A6) : const Color(0xFF0054A6);

  Color get sellerBackground =>
      brightness == Brightness.light ? const Color(0xffffeff0) : const Color(0xffffeff0);

  Color get sellerProgress =>
      brightness == Brightness.light ? const Color(0xffffc7c9) : const Color(0xffffc7c9);

  Color get bottomBarBackgroundColor => Colors.white;

  Color get whiteColor => Colors.white;

  Color get blackColor => Colors.black;

  Color get hintColor => const Color(0xffC8C8C8);

  Color get textColorOne => const Color(0xff666666);

  Color get cardTextGray =>
      brightness == Brightness.light ? const Color(0x66F5F5F5) : const Color(0xffF5F5F5);

  Color get redColor => const Color(0xffE56464);

  Color get greenColor => const Color(0xff70BC7C);

  Color get blueColor => const Color(0xff3967D6);

  Color get buttonBackgroundColor => const Color(0xff3967D6);

  Color get lightGrayColor => const Color(0xffC8C8C8);


  Color get greenColorTable => const Color(0x4c70bc7c);

  Color get blueColorTable => const Color(0x4d3967d6);
  Color get redColorTable => const Color(0x4ce56464);

}
