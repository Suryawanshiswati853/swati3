import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';

class TAppBarTheme{
  TAppBarTheme._();

  static final lightAppBarTheme=AppBarTheme(
   
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: TColors.black,size: TSizes.iconMd),
      actionsIconTheme: IconThemeData(color: TColors.black,size: TSizes.iconMd),
      titleTextStyle: TextStyle(fontSize: 18.0,color:TColors.black,fontWeight: FontWeight.w600),
    
  
    );
      static final darkAppBarTheme=AppBarTheme(
   
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: TColors.black,size: TSizes.iconMd),
      actionsIconTheme: IconThemeData(color: TColors.textwhite,size: TSizes.iconMd),
      titleTextStyle: TextStyle(fontSize: 18.0,color:TColors.textwhite,fontWeight: FontWeight.w600),
    
  
    );
}

