import 'package:ecommerce_store/utils/constants.dart';
import 'package:ecommerce_store/utils/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeHelper {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true
  ).copyWith(
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(primaryLightBrown),
      )
    ),
    textTheme: TextThemes.textTheme(color: primaryBlack),
    bottomAppBarTheme: const BottomAppBarTheme(
        shadowColor: primaryLightBrown,
        padding: EdgeInsets.all(15),
        elevation: 10,
        color: primaryDarkBrown
    ),
    iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(
        foregroundColor: primaryCreamWhite, iconSize: 20)),
    iconTheme: const IconThemeData(color: primaryWhite, size: 20,),
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: primaryWhite,
        surfaceTintColor: primaryWhite,
        scrolledUnderElevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark
        )
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryDarkBrown,
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: primaryWhite,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryWhite,
      primaryContainer: secondaryCreamWhite,
      onPrimaryFixedVariant: primaryCreamWhite,
      primary: primaryDarkBrown, /// Primary is used as the variant of yellow used in this theme
      secondary: secondaryDarkBrown, /// Secondary is the second most used color. This is used as border color, description text color and shadow color
      tertiaryContainer: primaryLightBrown,
    ),
  );
}