import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:swallet/constants/app_constants.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.grey,
        fontFamily: 'Chillax',
        scaffoldBackgroundColor: AppConstants.kPrimaryColor,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        primarySwatch: generateMaterialColor(color: AppConstants.kPrimaryColor),
        fontFamily: 'Chillax',
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        textTheme: const TextTheme().apply(
          bodyColor: AppConstants.kPrimaryColor,
          displayColor: AppConstants.kPrimaryColor,
          fontFamily: 'Chillax',
        ),
      );
}
