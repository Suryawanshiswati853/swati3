import 'custom_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'custom_theme/appbar_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/text_field_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_theme/elevated_button_theme.dart';







class TAppTheme{
  TAppTheme._();
  static ThemeData lightTheme=ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckBoxTheme.lightChekboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetDataTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormField.lightInputDecorationTheme
  );
    static ThemeData darkTheme=ThemeData(
     useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
     appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckBoxTheme.darkChekboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetDataTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormField.darkInputDecorationTheme
    );

}