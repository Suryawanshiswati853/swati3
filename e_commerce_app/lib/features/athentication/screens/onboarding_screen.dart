import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'widgets/onboarding_button.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'package:e_commerce_app/utils/constants/texts.dart';
import '../controllers/onboarding/onboarding_controller.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/features/athentication/screens/widgets/onboarding_skip.dart';
import 'package:e_commerce_app/features/athentication/screens/widgets/onboarding_page.dart';


class onBoardingScreen extends StatelessWidget {

   onBoardingScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OnboardingController());
     final List<Map<String, String>> pages = [
    {
      "image": TImages.onBoardingImage6,
      "title": TText.onBoardingTitle1,
      "subTitle": TText.onBoardingSubTitle1,
    },
    {
      "image": TImages.onBoardingImage2,
      "title": TText.onBoardingTitle2,
      "subTitle": TText.onBoardingSubTitle2,
    },
    {
      "image": TImages.onBoardingImage5,
      "title": TText.onBoardingTitle3,
      "subTitle": TText.onBoardingSubTitle3,
    },
  ];

    
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              final page = pages[index];
              return onBoardingPage(
                key: ValueKey(index), // keeps state per page
                image: page["image"]!,
                title: page["title"]!,
                subTitle: page["subTitle"]!,
              );
            },
          ),
          // PageView(
          //   controller: controller.pageController,
          //   onPageChanged: controller.updatePageIndicator,
          //   children:const [

             
          //      onBoardingPage(  key: PageStorageKey("onboarding1"),image: TImages.onBoardingImage6, title: TText.onBoardingTitle1, subTitle: TText.onBoardingSubTitle1),               
          //      onBoardingPage( key: PageStorageKey("onboarding2"),image: TImages.onBoardingImage2, title: TText.onBoardingTitle2, subTitle: TText.onBoardingSubTitle2),
          //      onBoardingPage(   key: PageStorageKey("onboarding3"),image: TImages.onBoardingImage5, title: TText.onBoardingTitle3, subTitle: TText.onBoardingSubTitle3),
                
              
          //        ],
          //          physics: const ClampingScrollPhysics(),
          //          pageSnapping: true,
          //         allowImplicitScrolling: true, 

               

          //     ),
             const  onBoardingTextButton(),
          const   onBoardingdotNavigation(),
          const onBoardingElevatedButton(),

          
          ])
        
        
      
    );
  }
}
