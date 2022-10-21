import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/circle_thumb_shape.dart';
import '../../constants/constants.dart';

enum AppTheme {
  LightTheme,
  DarkTheme,
}

final appThemeData = {
  AppTheme.LightTheme: ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    platform: TargetPlatform.iOS,
    scaffoldBackgroundColor: Colors.white,
    toggleableActiveColor: AppColors.primaryDark,
    appBarTheme: AppBarTheme(
      elevation: 1,
      color: Colors.white,
      iconTheme: IconThemeData(
        color: AppColors.primaryDark,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.primaryDark,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      toolbarTextStyle: TextTheme(
        headline6: TextStyle(
          color: AppColors.primaryDark,
          fontFamily: 'Spoqa',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ).bodyText2,
      titleTextStyle: TextTheme(
        headline6: TextStyle(
          color: AppColors.primaryDark,
          fontFamily: 'Spoqa',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ).headline6,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white, elevation: 0),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey[300],
      thickness: 0.5,
      space: 0.5,
      indent: 10,
      endIndent: 10,
    ),
    textTheme: TextTheme(
      button: eTextStyleButton,
      subtitle1: eTextStyleSubtitle16.copyWith(color: AppColors.primaryDark),
      subtitle2: eTextStyleSubtitle14.copyWith(color: AppColors.primaryDark),
      bodyText2: eTextStyleBody14.copyWith(color: AppColors.primaryDark),
      headline6: eTextStyleHeadline20.copyWith(color: AppColors.primaryDark),
    ),
    iconTheme: IconThemeData(
      color: AppColors.primary,
    ),
    fontFamily: 'Spoqa',
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(width: 1, color: Colors.grey.shade200),
      ),
    ),
    sliderTheme: SliderThemeData(
      thumbColor: AppColors.primary,
      thumbShape: CircleThumbShape(thumbRadius: 15),
      activeTrackColor: AppColors.primary,
      overlayColor: AppColors.primary.withOpacity(0.2),
      trackHeight: 4,
    ),
  ),
  AppTheme.DarkTheme: ThemeData(
    brightness: Brightness.dark,
    platform: TargetPlatform.iOS,
    scaffoldBackgroundColor: Color(0xff121212),
    toggleableActiveColor: AppColors.lavenderBlue,
    appBarTheme: AppBarTheme(
      elevation: 1,
      iconTheme: IconThemeData(
        color: Colors.white.withOpacity(0.87),
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white.withOpacity(0.87),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      toolbarTextStyle: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontFamily: 'Spoqa',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ).bodyText2,
      titleTextStyle: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontFamily: 'Spoqa',
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ).headline6,
    ),
    dividerTheme: DividerThemeData(
      color: Colors.white54,
      thickness: 0.5,
      space: 0.5,
      indent: 10,
      endIndent: 10,
    ),
    textTheme: TextTheme(
      button: eTextStyleButton.copyWith(color: Colors.white.withOpacity(0.87)),
      subtitle1:
          eTextStyleSubtitle16.copyWith(color: Colors.white.withOpacity(0.87)),
      subtitle2:
          eTextStyleSubtitle14.copyWith(color: Colors.white.withOpacity(0.87)),
      bodyText2:
          eTextStyleBody14.copyWith(color: Colors.white.withOpacity(0.87)),
      headline6:
          eTextStyleHeadline20.copyWith(color: Colors.white.withOpacity(0.87)),
    ),
    iconTheme: IconThemeData(
      color: Colors.white.withOpacity(0.87),
    ),
    fontFamily: 'Spoqa',
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(width: 0, color: Colors.transparent),
      ),
    ),
    sliderTheme: SliderThemeData(
      thumbColor: AppColors.lavenderBlue,
      thumbShape: CircleThumbShape(thumbRadius: 15),
      activeTrackColor: AppColors.lavenderBlue,
      overlayColor: AppColors.lavenderBlue.withOpacity(0.2),
      trackHeight: 4,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.87)),
      ),
    ),
  ),
};
