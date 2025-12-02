import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/features/athentication/screens/login/login.dart';

class OnboardingController  extends GetxController{
  static OnboardingController get instance => Get.find();
   @override
  void onInit() {
    super.onInit();
    _precacheImages();
  }

  final pageController = PageController();

  Rx<int> currentPageIndex = 0.obs;
  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigatonClick(index) {
    currentPageIndex.value=index;
    pageController.jumpTo(index);
   
  }
  void nextPage(){
    if (currentPageIndex.value == 2) {
      final storage=GetStorage();
      storage.write('isFirstTime', false);
    Get.offAll(Loginscreen());
    } else {
      int page= currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }
  void skipPage() {
     currentPageIndex.value=2;
    pageController.jumpToPage(2);
   
  }
  void _precacheImages() {
    final context = Get.context;
    if (context != null) {
      for (var img in [
        TImages.onBoardingImage6,
        TImages.onBoardingImage2,
        TImages.onBoardingImage5,
      ]) {
        precacheImage(AssetImage(img), context);
      }
    }
  }
}