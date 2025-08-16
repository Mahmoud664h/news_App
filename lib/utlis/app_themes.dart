import 'package:flutter/material.dart';
import 'package:news_app/utlis/app_colors.dart';
import 'package:news_app/utlis/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,

    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.blackColor),
      centerTitle: true,
    ), // AppBarTheme
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16Black,
      labelSmall: AppStyles.medium12Gray,
      labelMedium: AppStyles.medium14Black,
      headlineMedium: AppStyles.medium24Black,
      headlineLarge: AppStyles.medium20Black,
      bodyMedium: AppStyles.medium14White,
    ),
    tabBarTheme: TabBarThemeData(indicatorColor: AppColors.blackColor),
  ); // TextTheme, ThemeData

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
    ), // AppBarTheme
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16White,
      labelMedium: AppStyles.medium14White,
      labelSmall: AppStyles.medium12Gray,
      headlineMedium: AppStyles.medium24White,
      headlineLarge: AppStyles.medium20White,
      bodyMedium: AppStyles.medium14Black,
    ),
    tabBarTheme: TabBarThemeData(indicatorColor: AppColors.whiteColor),
  ); // TextTheme, ThemeData
}
