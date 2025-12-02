import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/features/athentication/controllers/onboarding/onboarding_controller.dart';

// class OnBoardingDotNavigation extends StatelessWidget {
//   final PageController controller;

//   const OnBoardingDotNavigation({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return Positioned(
//       bottom: TDeviceUtils.getBottomNavigationBarHeight() * 2.5, // use smaller multiplier
//       left: TSizes.defaultSpace,
//       child: SmoothPageIndicator(
//         controller: controller, // ✅ use the same controller as PageView
//         count: 3,
//         effect: ExpandingDotsEffect(
//           activeDotColor: isDark ? Colors.white54 : Colors.grey,
//           dotColor: Colors.grey, // ✅ add contrast
//           dotHeight: 6,
//           dotWidth: 12,
//           expansionFactor: 3, // ✅ ensures dots expand
//         ),
//       ),
//     );
//   }
// }

class onBoardingdotNavigation extends StatelessWidget {
const  onBoardingdotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=OnboardingController.instance;

    final dark=THelpersFunction.isDarkMode(context);
    return  Positioned(
                  bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25 ,
                  left: TSizes.defaultSpace,
                
                   child: SmoothPageIndicator(
                    controller: controller.pageController,
                    onDotClicked: controller.dotNavigatonClick,
                    count: 3,
                      effect:  ExpandingDotsEffect(
                    activeDotColor:dark ? TColors.light: TColors.dark,
                    dotHeight: 6,
                  //  dotWidth: 12
                   
                  ),
                   ),
                 );

          
        
      
  }
}

