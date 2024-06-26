import 'package:bridgebank_social_app/configuration/colors.dart';
import 'package:flutter/material.dart';

class AppTheme{


  static ThemeData light(){

    final themeData =  ThemeData(
        useMaterial3: true,
        fontFamily: "Poppins"
    );
    return themeData.copyWith(
      appBarTheme: themeData.appBarTheme.copyWith(
          centerTitle: true,
          backgroundColor: AppColors.primary,
        titleTextStyle: themeData.appBarTheme.titleTextStyle?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        iconTheme: themeData.appBarTheme.iconTheme?.copyWith(
          color: Colors.white
        )
      ),
      colorScheme: themeData.colorScheme.copyWith(
        secondary: AppColors.secondary,
        primary: AppColors.primary
      )

    );
  }
}