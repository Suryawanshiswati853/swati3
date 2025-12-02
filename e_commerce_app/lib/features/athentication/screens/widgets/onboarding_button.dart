import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart' show TDeviceUtils;
import 'package:e_commerce_app/features/athentication/controllers/onboarding/onboarding_controller.dart';

class onBoardingElevatedButton extends StatelessWidget {
const  onBoardingElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelpersFunction.isDarkMode(context);
    return  Positioned(
                  bottom: TDeviceUtils.getBottomNavigationBarHeight(),

                  right: TSizes.defaultSpace,
                
                   child: ElevatedButton(
                    onPressed: ()=>  OnboardingController.instance.nextPage(),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                     backgroundColor: dark ? TColors.primaryColour : Colors.black,
                    
                    ),
                    child: const Icon(Iconsax.arrow_right_3),

                   ));


          
        
      
  }
}

