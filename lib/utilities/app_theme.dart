import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'app_colors.dart';

abstract class OnClocTheme{
  static var fontFamily = 'Lexend';

  static final ThemeData onClocLightTheme = ThemeData(
    splashColor: Colors.transparent,   // Removes the splash color
    highlightColor: Colors.transparent,   // Removes the highlight color
    scaffoldBackgroundColor: whiteColor,
    primaryColor: appColorPrimary,
    primaryColorDark: appDarkColorPrimary,
    hoverColor: Colors.white54,
    dividerColor: viewLineColor,
    fontFamily: fontFamily,
    inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: whiteColor),
    appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: whiteColor,
        titleTextStyle: TextStyle(color: Colors.black),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black,selectionColor: Colors.green,selectionHandleColor: Colors.black),
          colorScheme: const ColorScheme.light(primary: Colors.white),
          cardTheme: const CardTheme(color: Colors.white),
          cardColor: cardLightColor,
          iconTheme: const IconThemeData(color: Colors.black),
          bottomSheetTheme: const BottomSheetThemeData(backgroundColor: whiteColor),
          primaryTextTheme: TextTheme(
            titleLarge: TextStyle(
              color: appTextColorPrimary,
              fontFamily: fontFamily,
            ),
            labelSmall: TextStyle(
              fontFamily: fontFamily,
              color: appTextColorPrimary,
            ),
          ),
          textTheme: TextTheme(
            displayLarge: TextStyle(
              fontSize: 48.0,
              color: appTextColorPrimary,
              fontFamily: fontFamily,
            ),
            displayMedium: TextStyle(
              fontSize: 40.0,
              color: appTextColorPrimary,
              fontFamily: fontFamily,
            ),
            displaySmall: TextStyle(
              fontSize: 32.0,
              color: appTextColorPrimary,
              fontFamily: fontFamily,
            ),
            headlineMedium: TextStyle(
              fontSize: 24.0,
              fontFamily: fontFamily,
              color: appTextColorPrimary,
            ),
            headlineSmall: TextStyle(
              fontSize: 20.0,
              color: appTextColorPrimary,
              fontFamily: fontFamily,
            ),
            titleLarge: TextStyle(
              fontSize: 18.0,
              color: appTextColorPrimary,
              fontFamily: fontFamily,
            ),
            bodyLarge: TextStyle(
              fontSize: 16.0,
              color: appTextColorPrimary,
              fontFamily: fontFamily,
            ),
            bodyMedium: TextStyle(
              fontSize: 14.0,
              color: appTextColorPrimary,
              fontFamily: fontFamily,
            ),
            bodySmall: TextStyle(
              fontSize: 12.0,
              color: appTextColorPrimary,
              fontFamily: fontFamily,
            ),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          popupMenuTheme: const PopupMenuThemeData(color: whiteColor))
      .copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
        }),
  );

  static final ThemeData onClocDarkTheme = ThemeData(
    splashColor: Colors.transparent,  // Removes the splash color
    highlightColor: Colors.transparent,  // Removes the highlight color
    scaffoldBackgroundColor: appDarkColorPrimary,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: appDarkColorPrimary),
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(color: whiteColor),
      titleTextStyle: TextStyle(color: Colors.white),
      backgroundColor: appDarkColorPrimary,
      iconTheme: IconThemeData(color: whiteColor),
    ),
    primaryColor: appDarkColorPrimary,
    dividerColor: const Color(0xFFDADADA).withOpacity(0.3),
    primaryColorDark: appDarkColorPrimary,
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white, selectionColor: Colors.green,selectionHandleColor: Colors.white),
    hoverColor: Colors.black12,
    fontFamily: fontFamily,
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: appDarkColorPrimary),
    primaryTextTheme: TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontFamily: fontFamily),
        labelSmall: TextStyle(
          color: Colors.white,
          fontFamily: fontFamily,
        )),
    cardTheme: const CardTheme(color: appDarkColorPrimary),
    cardColor: appDarkCardColor,
    iconTheme: const IconThemeData(color: whiteColor),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 48.0,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
      displayMedium: TextStyle(
        fontSize: 40.0,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
      displaySmall: TextStyle(
        fontSize: 32.0,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
      headlineMedium: TextStyle(
        fontSize: 24.0,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
      titleLarge: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontFamily: fontFamily,
        // letterSpacing: 1.5
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
      bodySmall: TextStyle(
        fontSize: 12.0,
        color: Colors.white,
        fontFamily: fontFamily,
      ),
    ),
    popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme:
        const ColorScheme.dark(primary: appDarkColorPrimary, onPrimary: appDarkCardColor)
            .copyWith(secondary: whiteColor),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
        }),
  );

}