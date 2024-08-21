import 'package:flutter/material.dart';

class AppColors {
  static Color accent = const Color(0xFF00008B);
  static Color text = const Color.fromARGB(255, 230, 220, 220);
  static Color textLight = const Color(0xff8a8a8a);
  static Color white = const Color(0xffffffff);
  static Color red = const Color.fromARGB(255, 247, 65, 52);
  static Color charcole =  const Color(0x0021242a);
  

}

class Themes {
  static ThemeData defaultTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.charcole,
      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.charcole,
          iconTheme: IconThemeData(color: AppColors.text),
          titleTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.text)),
      colorScheme: ColorScheme.light(
          primary: AppColors.accent, secondary: AppColors.accent));
}

class TextStyles {
  static TextStyle heading1 = TextStyle(
      fontWeight: FontWeight.bold, color: AppColors.text, fontSize: 48);

  static TextStyle heading2 = TextStyle(
      fontWeight: FontWeight.bold, color: AppColors.text, fontSize: 32);

  static TextStyle heading3 = TextStyle(
      fontWeight: FontWeight.bold, color: AppColors.text, fontSize: 24);

  static TextStyle body1 = TextStyle(
      fontWeight: FontWeight.normal, color: AppColors.text, fontSize: 18);

  static TextStyle body2 = TextStyle(
      fontWeight: FontWeight.normal, color: AppColors.text, fontSize: 16);
}
