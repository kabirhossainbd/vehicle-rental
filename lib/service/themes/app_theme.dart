import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static String fontFamily = 'Ubuntu';

  static List<BoxShadow> boxShadow(BuildContext context) => [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      blurRadius: 1,
      spreadRadius: 1,
      offset: const Offset(0.0, 2),
    )
  ];

  static ThemeData get theme {
    ThemeData base = ThemeData.light(
      useMaterial3: false,
    );
    return base.copyWith(
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
      textTheme: ThemeData.light().textTheme.apply(
        fontFamily: fontFamily,
      ),
      primaryColor: const Color(0xff3b22a1),
      primaryTextTheme: ThemeData.light().primaryTextTheme.apply(
        fontFamily: fontFamily,
      ),
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        isDense: true,
        // Added this

        prefixStyle: TextStyle(
          color: Color(0xff3b22a1),
        ),

        iconColor: Color(0xff3b22a1),

        suffixStyle: TextStyle(
          color: Color(0xff3b22a1),
        ),

        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff3b22a1)),
          borderRadius: BorderRadius.all(Radius.circular(45)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff3b22a1)),
          borderRadius: BorderRadius.all(Radius.circular(45)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        errorStyle: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    ThemeData base = ThemeData.dark(
      useMaterial3: false,
    );
    return base.copyWith(
      scaffoldBackgroundColor: Colors.black,
      cardColor: Colors.black,
      textTheme: ThemeData.light().textTheme.apply(
        fontFamily: fontFamily,
      ),
      primaryColor: const Color(0xff3b22a1),
      primaryTextTheme: ThemeData.light().textTheme.apply(
        fontFamily: fontFamily,
      ),
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }
}
