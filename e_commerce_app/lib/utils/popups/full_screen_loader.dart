import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/loaders/animation_widget.dart';
// class FullScreenLoader {
//   static void openLoadingDialog(String text, String animation) {
//     showDialog(
//       context: Get.overlayContext!,
//       barrierDismissible: false,
//       builder: (_) => WillPopScope(
//         onWillPop: () async => false, // Prevent back button
//         child: Container(
//           color: THelpersFunction.isDarkMode(Get.context!)
//               ? TColors.dark
//               : TColors.light,
//           width: double.infinity,
//           height: double.infinity,
//           child: Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TAnimationLoaderWidget(text: text, animation: animation),
//                   const SizedBox(height: 20),
//                   Text(
//                     text,
//                     style: TextStyle(
//                       color: THelpersFunction.isDarkMode(Get.context!)
//                           ? Colors.white
//                           : Colors.black,
//                       fontSize: 16,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   static void stopAnimation() {
//     if (Get.overlayContext != null) {
//       Navigator.of(Get.overlayContext!).pop();
//     }
//   }
// }


class FullScreenLoader {

  static  Future<void> openloadingDialog(String text,String animation)async {
 showDialog(
  context: Get.context!, 
  barrierDismissible: false,
  builder: (_)=>WillPopScope(
        onWillPop: () async => false,
    child:Container(
      color: THelpersFunction.isDarkMode(Get.context!)?TColors.dark:TColors.light,
      width: double.infinity,
      height: double.infinity,
      child: Center(
         
    child:   Column(
        mainAxisSize: MainAxisSize.min, 
              mainAxisAlignment: MainAxisAlignment.center,
        children: [
        //  const SizedBox(height: 50,),
        //  TAnimationLoaderWidget(text:text,animation:animation)
        ],
      ),
    ) ,
    )
  ));
  }
  static stopAnimation(){
    Navigator.of(Get.overlayContext!).pop();
  }
}
