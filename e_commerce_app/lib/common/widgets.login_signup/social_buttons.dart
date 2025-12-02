import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/features/athentication/controllers/login/login_controller.dart';


class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey),borderRadius:BorderRadius.circular(90) ),
          child: IconButton(onPressed: ()=>controller.googleSignIn, icon: Image(
            width: TSizes.iconMd,
            height: TSizes.iconMd,
            image: AssetImage(TImages.google))),
        ),
           SizedBox(
          width:   TSizes.spaceBetItems
          ),
           Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey),borderRadius:BorderRadius.circular(90) ),
          child: IconButton(onPressed: (){}, icon: Image(
            width: TSizes.iconMd,
            height: TSizes.iconMd,
            image: AssetImage(TImages.facebook))),
        ),
    
      ],
    );
  }
}

