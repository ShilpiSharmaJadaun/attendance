import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class AppTheme {
  static final theme = ThemeData(
      fontFamily: 'Poppins',
      primaryTextTheme: const TextTheme(),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: AppColors.bloodred,
              elevation: 8,
              padding: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              minimumSize: const Size(250, 40))),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
            //statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.light,
           // systemNavigationBarContrastEnforced: true,
            //statusBarBrightness: Brightness.light,
            //systemNavigationBarIconBrightness: Brightness.light,
            systemStatusBarContrastEnforced: true
        ),
        backgroundColor: AppColors.white,
        titleTextStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      cardTheme: CardTheme(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
}
