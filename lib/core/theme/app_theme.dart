import 'package:flutter/material.dart';

import 'app_button_styles.dart';
import 'app_text_styles.dart';

const primaryColor = Color(0xFF00D09E);

final lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: primaryColor,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    // Used as the primary color to generate all other colors of the scheme (if not explicitly set).
    seedColor: primaryColor,
    // Defines the background color for cards, NavigationBar, BottomSheet, and other UI elements.
    surface: Colors.white,
    // Color for text and icons displayed on the surface.
    onSurface: Colors.black,
    // The main color of the app, used for buttons, indicators, AppBar, FAB, and other key elements.
    primary: Colors.red,
    // Color for text and icons displayed on primary.
    onPrimary: Colors.blue[100],
    // Secondary color, used to highlight less important buttons, tags, switches, and accents.
    secondary: Colors.lightGreen,
    // Color for text and icons displayed on secondary.
    onSecondary: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    // Removes the shadow.
    elevation: 0,
    // Icons in the AppBar are black.
    iconTheme: IconThemeData(color: Colors.black),
    // Background color of the AppBar.
    backgroundColor: Color(0xFF42FF00),
    // Title text style of the AppBar.
    titleTextStyle: AppTextStyles.appBar.copyWith(color: Colors.black),
  ),
  textTheme: _textTheme,
  listTileTheme: ListTileThemeData(
    titleTextStyle: AppTextStyles.appBar.copyWith(
      color: Colors.green,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    iconColor: Colors.green,
  ),
  dividerTheme: DividerThemeData(color: Colors.grey.withAlpha(20)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: AppButtonStyles.elevatedButtonStyleCreateTaskField,
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: primaryColor,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF146464),
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    surface: Color(0xFF5A2323),
    onSurface: Color(0xFFFFFFFF),
    primary: Colors.red,
    onPrimary: Colors.black,
    secondary: Colors.lightGreen,
    onSecondary: Colors.white,
    brightness: Brightness.dark,
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Color(0xFF888888),
    titleTextStyle: AppTextStyles.appBar.copyWith(color: Colors.white),
  ),
  textTheme: _textTheme,
  listTileTheme: ListTileThemeData(
    titleTextStyle: AppTextStyles.appBar.copyWith(
      color: Colors.green,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    iconColor: Colors.green,
  ),
  dividerTheme: DividerThemeData(color: Colors.white.withAlpha(20)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: AppButtonStyles.elevatedButtonStyleCreateTaskField,
  ),
);

final _textTheme = TextTheme(
  displayLarge: AppTextStyles.displayLarge,
  displayMedium: AppTextStyles.displayMedium,
  displaySmall: AppTextStyles.errorMessage,
  //
  headlineLarge: AppTextStyles.filledTaskField,
  headlineMedium: AppTextStyles.descriptionTaskField,
  headlineSmall: AppTextStyles.headlineSmall,
  //
  titleLarge: AppTextStyles.promo,
  titleMedium: AppTextStyles.appBar,
  titleSmall: AppTextStyles.detailsMain,
  //
  bodyLarge: AppTextStyles.bodyLarge,
  bodyMedium: AppTextStyles.description,
  bodySmall: AppTextStyles.card,
  //
  labelLarge: AppTextStyles.bottomNavigationMenu,
  labelMedium: AppTextStyles.dropMenu,
  labelSmall: AppTextStyles.defaultListCardMain,
);
