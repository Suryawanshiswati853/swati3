import 'package:flutter/material.dart';
import '../../../../utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import '../../controllers/onboarding/onboarding_controller.dart';



class onBoardingTextButton extends StatelessWidget {
  const onBoardingTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(onPressed: (){
        OnboardingController.instance.skipPage();
      }, child:const Text('Skip')));
             
        
          
        
      
  }
}