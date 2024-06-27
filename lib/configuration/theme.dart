import 'package:bridgebank_social_app/configuration/colors.dart';
import 'package:bridgebank_social_app/configuration/constants.dart';
import 'package:flutter/material.dart';

class AppTheme{


  static ThemeData light(){

    return ThemeData(
        useMaterial3: true,
        fontFamily: Constants.defaultFontFamily,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.primary,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: Constants.defaultFontFamily,
          fontSize: 22
        ),
        iconTheme: IconThemeData(
          color: Colors.white
        )
      ),
      colorScheme: ColorScheme.light(
        secondary: AppColors.secondary,
        primary: AppColors.primary
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          fontFamily: Constants.defaultFontFamily
        )
      )

    );
  }

  static ThemeData dark(){

    return ThemeData(
        useMaterial3: true,
        fontFamily: "Poppins",
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.secondary,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: AppColors.primary,
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22
            ),
            iconTheme: IconThemeData(
                color: Colors.white
            )
        ),
        colorScheme: ColorScheme.dark(
            secondary: AppColors.secondary,
            primary: AppColors.primary
        ),
        textTheme: TextTheme(
            headlineLarge: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
            )
        )

    );
  }
}