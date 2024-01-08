import 'package:flutter/material.dart';

class AppTheme {
  static get theme {
    final theme = ThemeData(
      fontFamily: FontsName.halveticaFont,
      bottomNavigationBarTheme: _navigationBarTheme(),
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: _appBarTheme(),
      unselectedWidgetColor: AppColors.secondaryTextColor,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryTextColor),
        displayMedium: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryTextColor),
        displaySmall: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryTextColor),
        headlineMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryTextColor),
        headlineSmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryTextColor),
        titleLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: AppColors.secondaryTextColor),
        titleMedium: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryTextColor),
        titleSmall: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.red),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryTextColor),
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor, // background (button) color
        ),
      ),
      primaryColor: AppColors.primaryColor,
      canvasColor: AppColors.secondaryColor,
    );
    return theme;
  }

  static AppBarTheme _appBarTheme() =>
      AppBarTheme(backgroundColor: AppColors.primaryColor);

  static BottomNavigationBarThemeData _navigationBarTheme() {
    return BottomNavigationBarThemeData(
      unselectedIconTheme: const IconThemeData(color: Colors.white, size: 33),
      selectedIconTheme: const IconThemeData(size: 36),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.blue[100],
      type: BottomNavigationBarType.shifting,
      showUnselectedLabels: true,
    );
  }
}

class AppColors {
  static Color primaryColor = const Color(0xff00466A);
  static Color primaryColorShadeOne = const Color.fromARGB(255, 28, 90, 121);
  static Color primaryColorShadetwo = const Color.fromARGB(255, 45, 103, 133);
  static Color primaryColorShadeThree =
      const Color.fromARGB(255, 105, 158, 185);
  static Color primaryColorShadefour = const Color.fromARGB(255, 203, 223, 233);

  static Color secondaryColor = Colors.blue[200]!;
  static const Color primaryTextColor = Color(0xff1B4567);
  static const Color secondaryTextColor = Color(0xff718E9F);
  static const Color buttonHoverColor = Color(0xffF5A623);

  static const Color cardButtonColor = Color(0xffC1E6D1);
  static const Color cardBackgroundColor = Color(0xff799AEF);
  static const Color grey = Colors.grey;
  static const Color greyLight = Color.fromARGB(255, 216, 216, 216);

  static const Color red = Colors.red;

  static Color white = const Color(0xffFFFFFF);
  static const Color graphBack = Color.fromARGB(102, 121, 154, 239);
  static const Color graphFront = Color.fromARGB(255, 121, 154, 239);
  static const Color graphLow = Color.fromARGB(107, 226, 60, 59);
}

class FontsName {
  static const halveticaFont = 'Helvetica';
}
