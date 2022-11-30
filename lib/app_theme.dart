import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.manrope(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(36, 54, 86, 1),
    ),
    bodyMedium: GoogleFonts.manrope(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.manrope(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(36, 54, 86, 1),
    ),
    titleLarge: GoogleFonts.manrope(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    titleMedium: GoogleFonts.manrope(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(36, 54, 86, 1),
    ),
    titleSmall: GoogleFonts.manrope(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(36, 54, 86, 1),
    ),
    labelLarge: GoogleFonts.manrope(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(36, 54, 86, 1),
    ),
    labelMedium: GoogleFonts.manrope(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(36, 54, 86, 0.5),
    ),
    labelSmall: GoogleFonts.manrope(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(0, 112, 186, 1),
    ),
    displaySmall: GoogleFonts.manrope(
      fontSize: 13.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.manrope(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),

    // headlineSmall: GoogleFonts.manrope(
    //   fontWeight: FontWeight.w400,
    //   fontSize: 16.0,
    //   color: Colors.white,
    // ),
    // displayLarge: GoogleFonts.manrope(
    //     fontSize: 40, fontWeight: FontWeight.w400, color: Colors.white),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: const Color.fromRGBO(21, 70, 160, 1)),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color.fromRGBO(0, 112, 186, 1),
        unselectedItemColor: Colors.black,
        elevation: 0.0,
      ),
      textTheme: lightTextTheme,
    );
  }
}
