import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';

class Loaders{
static sucessSnackbar({required title,message='',duration=3}){
  Get.snackbar(
    title,
     message,
     isDismissible: true,
     shouldIconPulse: true,
     backgroundColor: TColors.primaryColour,
     snackPosition: SnackPosition.BOTTOM,
     duration: Duration(seconds: duration),
     margin:const EdgeInsets.all(18),
     icon: Icon(Iconsax.check,color:TColors.textwhite

  ));

}
static warningSnackBar({required title,message=''}){
  Get.snackbar(
    title,
     message,
     isDismissible: true,
     shouldIconPulse: true,
     colorText: TColors.textwhite,
     backgroundColor: Colors.orange,
     snackPosition: SnackPosition.BOTTOM,
     duration: Duration(seconds: 3),
     margin:const EdgeInsets.all(20),
     icon: Icon(Iconsax.warning_2,color:TColors.textwhite

  ));

}
static errorSnackBar({required title,message=''}){
  Get.snackbar(
    title,
     message,
     isDismissible: true,
     shouldIconPulse: true,
     colorText: TColors.textwhite,
     backgroundColor: Colors.red.shade100,
     snackPosition: SnackPosition.BOTTOM,
     duration: Duration(seconds: 3),
     margin:const EdgeInsets.all(20),
     icon: Icon(Iconsax.warning_2,color:TColors.textwhite

  ));

}
}