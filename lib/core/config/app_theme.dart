import 'package:chemistryapp/core/services/get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appcolors.dart';
import 'apptextstyle.dart';

////////////////////////App Themes////////////////////////////////
class AppThemes {
  static ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.openSans(color: AppColor.white).fontFamily,
      disabledColor: AppColor.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryIconTheme: Icontheme.darkIconTheme,
      primaryColor: AppColor.primary,
      colorScheme: const ColorScheme.dark(
          primary: AppColor.primary,
          secondary: AppColor.secondary,
          background: AppColor.black),
      scaffoldBackgroundColor: AppColor.black,
      textTheme: TextThemes.darkTextTheme,
      iconTheme: Icontheme.darkIconTheme,
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconColor:
                  MaterialStateColor.resolveWith((states) => AppColor.red))),
      cardColor: AppColor.black,
      useMaterial3: false,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.primary
      ),
      appBarTheme: AppBarTheme(
          elevation: 0.9,
          centerTitle: false,
          backgroundColor: AppColor.primary,
          iconTheme: IconThemeData(size: 23.sp, color: AppColor.primary),
          actionsIconTheme: IconThemeData(color: AppColor.white, size: 15.sp),
          titleTextStyle: TextThemes.darkTextTheme.bodyLarge!.px19));

  static ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light,
      fontFamily: GoogleFonts.openSans(color: AppColor.black).fontFamily,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      disabledColor: AppColor.black,
      // unselectedWidgetColor: AppColor.unselcetedlight,
      primaryIconTheme: Icontheme.lightIconTheme,
      textTheme: TextThemes.primaryTextTheme,
      primaryColor: AppColor.primary,
      cardColor: AppColor.white,
      useMaterial3: false,
      colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: AppColor.primary,
          secondary: AppColor.secondary,
          background: AppColor.white),
      scaffoldBackgroundColor: AppColor.white,
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconColor:
                  MaterialStateColor.resolveWith((states) => AppColor.red))),
      appBarTheme: AppBarTheme(
          elevation: 0.9,
          centerTitle: false,
          titleTextStyle: TextThemes.primaryTextTheme.bodyLarge!.px25,
          backgroundColor: AppColor.primary,
          actionsIconTheme: IconThemeData(color: AppColor.green, size: 15.sp),
          iconTheme: IconThemeData(size: 23.sp, color: AppColor.black)));

  static CupertinoThemeData get iosdarkTheme => MaterialBasedCupertinoThemeData(
      materialTheme: AppThemes.darkTheme.copyWith(
          cupertinoOverrideTheme: CupertinoThemeData(
              primaryContrastingColor: AppColor.primary,
              scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
              barBackgroundColor: AppColor.primary,
              applyThemeToAll: true,
              textTheme: CupertinoTextThemeData(
                  primaryColor: AppColor.red,
                  textStyle: TextThemes.darkTextTheme.headlineLarge),
              primaryColor: AppColor.white,
              brightness: Brightness.dark)));

  static CupertinoThemeData get ioslightTheme =>
      MaterialBasedCupertinoThemeData(
          materialTheme: AppThemes.lightTheme.copyWith(
              cupertinoOverrideTheme: CupertinoThemeData(
                  primaryContrastingColor: AppColor.primary,
                  scaffoldBackgroundColor: CupertinoColors.lightBackgroundGray,
                  barBackgroundColor: AppColor.primary,
                  primaryColor: AppColor.black,
                  applyThemeToAll: true,
                  textTheme: CupertinoTextThemeData(
                      primaryColor: AppColor.black,
                      textStyle: TextThemes.primaryTextTheme.headlineLarge),
                  brightness: Brightness.light)));
}

////////////////////////Text Theme////////////////////////////////
class TextThemes {
  static TextTheme get textTheme {
    return TextTheme(
      bodyLarge: AppTextStyle.bodyLarge,
      bodyMedium: AppTextStyle.bodyMedium,
      titleMedium: AppTextStyle.titleMedium,
      titleSmall: AppTextStyle.titleSmall,
      displayLarge: AppTextStyle.displayLarge,
      displayMedium: AppTextStyle.displayMedium,
      displaySmall: AppTextStyle.displaySmall,
      headlineMedium: AppTextStyle.headlineMedium,
    );
  }

  static TextTheme get darkTextTheme {
    Color textColor = AppColor.white;
    return TextTheme(
      bodyLarge: AppTextStyle.bodyLarge.copyWith(color: textColor),
      bodyMedium: AppTextStyle.bodyMedium.copyWith(color: textColor),
      titleMedium: AppTextStyle.titleMedium.copyWith(color: textColor),
      titleSmall: AppTextStyle.titleSmall.copyWith(color: textColor),
      displayLarge: AppTextStyle.displayLarge.copyWith(color: textColor),
      displayMedium: AppTextStyle.displayMedium.copyWith(color: textColor),
      displaySmall: AppTextStyle.displaySmall.copyWith(color: textColor),
      headlineMedium: AppTextStyle.headlineMedium.copyWith(color: textColor),
    );
  }

  static TextTheme get primaryTextTheme {
    Color textColor = AppColor.black;
    return TextTheme(
      bodyLarge: AppTextStyle.bodyLarge.copyWith(color: textColor),
      bodyMedium: AppTextStyle.bodyMedium.copyWith(color: textColor),
      titleMedium: AppTextStyle.titleMedium.copyWith(color: textColor),
      titleSmall: AppTextStyle.titleSmall.copyWith(color: textColor),
      displayLarge: AppTextStyle.displayLarge.copyWith(color: textColor),
      displayMedium: AppTextStyle.displayMedium.copyWith(color: textColor),
      displaySmall: AppTextStyle.displaySmall.copyWith(color: textColor),
      headlineMedium: AppTextStyle.headlineMedium.copyWith(color: textColor),
    );
  }
}

////////////////////////Icon Theme////////////////////////////////
class Icontheme {
  static IconThemeData get lightIconTheme =>
      IconThemeData(size: 25.sp, color: AppColor.black);
  static IconThemeData get darkIconTheme =>
      IconThemeData(size: 25.sp, color: AppColor.white);
}
