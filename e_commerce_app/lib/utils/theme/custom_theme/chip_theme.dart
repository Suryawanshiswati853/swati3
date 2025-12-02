import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';

class TChipTheme{
  TChipTheme._();
  static ChipThemeData lightChipTheme=ChipThemeData(
    disabledColor: TColors.grey.withOpacity(0.4),
    labelStyle: TextStyle(color: TColors.black),
    selectedColor: TColors.primaryColour,
    padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
    checkmarkColor: TColors.textwhite
  );
    static ChipThemeData darkChipTheme=ChipThemeData(
    disabledColor: TColors.darkergrey,
    labelStyle: TextStyle(color: TColors.textwhite),
    selectedColor: TColors.primaryColour,
    padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
    checkmarkColor: TColors.textwhite
  );
}