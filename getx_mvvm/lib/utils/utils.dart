
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../res/Colors/app_colors.dart';

class Utils{

     static void fieldFocusChange(BuildContext context,FocusNode current,FocusNode nextFocus){
    current.unfocus();
     FocusScope.of(context).requestFocus(nextFocus);
  }
  static toastMessage( String message){
    Fluttertoast.showToast(msg: message,
    backgroundColor: AppColor.Blackcolor,
    gravity: ToastGravity.BOTTOM
    );
    
  }
  static toastMessagecenter( String message){
    Fluttertoast.showToast(msg: message,
    backgroundColor: AppColor.Blackcolor,
    gravity: ToastGravity.CENTER
    );
    
  }
   static SnackBar( String title, String message){
    Get.snackbar(title, message);
}
}
