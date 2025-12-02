import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_images.dart';
import 'package:e_commerce_app/common/widgets/shimmer/TShimmerEffect.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers.dart';
import 'package:e_commerce_app/features/shop/controllers/home_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/banner_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(BannerController());
     controller.fetchAllBanners(); 
    return Obx(
      (){
        if(controller.isLoading.value)return TShimmerEffect(width: double.infinity, height: 190);
        if(controller.banners.isEmpty){
          return const Center(child: Text('No Data Found'),);
        }else{
        return Column(
        children: [
         CarouselSlider(
        
           options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index,_)=>controller.updatePageIndicator(index),
        
          ),
           items:controller.banners.map((banner) {
                            final imageUrl = banner.imageUrl;
              final isNetwork = imageUrl.isNotEmpty && imageUrl.startsWith('http');


      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),  
        child: TRoundedWidget(
           imageUrl: isNetwork
                      ? imageUrl
                      : TImages.user, // fallback
                  isNetworkImage: isNetwork,
          // imageUrl: banner.imageUrl,
          // isNetworkImage: true,
          onPressed: (){
              Future.microtask(() {
        Get.toNamed(banner.targetScreen);
      });
          },
        ),
      );
        }).toList(),
         ),
          
       // items:banners.map((url)=>TRoundedWidget(imageUrl:url,)).toList()),
      
          
       // ),
          const SizedBox(
              height: TSizes.spaceBetItems,
            ),
            Center(
              child: Obx(
                ()=> Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for(int i=0; i<controller.banners.length;i++)
                  TcirularContainer(
                    width: 20,
                    height: 4,
                    margin:const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurretIndex.value==i?TColors.primaryColour:TColors.grey,
                  ),
                      ]),
              ),
            )
      ]);
  }});
  
  }
}

