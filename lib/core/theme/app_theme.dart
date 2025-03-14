import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Common Colors
  static const Color primaryColor = Color(0xFFC1FD50); // Greenish
  static const Color secondaryColor = Color(0xFFFD6333); // Orange
  static const Color backgroundLight = Color(0xFFFFFFFF); // White
  static const Color backgroundDark = Color(0xFF000000); // Black
  static const Color textColorLight = Color(0xFF000000);
  static const Color textColorDark = Color(0xFFFFFFFF);
  static const Color greyColor = Color(0xFFE1E5EA); // Light Grey

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundLight,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700, color: textColorLight),
      displayMedium: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: textColorLight),
      displaySmall: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, color: textColorLight),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundLight,
      titleTextStyle: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: textColorLight),
      iconTheme: IconThemeData(color: textColorLight),
    ),
    buttonTheme: ButtonThemeData(buttonColor: primaryColor),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: secondaryColor,
    scaffoldBackgroundColor: backgroundDark,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700, color: textColorDark),
      displayMedium: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: textColorDark),
      displaySmall: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, color: textColorDark),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundDark,
      titleTextStyle: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: textColorDark),
      iconTheme: IconThemeData(color: textColorDark),
    ),
    buttonTheme: ButtonThemeData(buttonColor: secondaryColor),
  );
}
