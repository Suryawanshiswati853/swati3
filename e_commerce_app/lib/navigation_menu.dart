import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/features/shop/screens/store/store_screen.dart';
import 'package:e_commerce_app/features/athentication/screens/home/home.dart';
import 'package:e_commerce_app/features/shop/screens/wishlist/wishList_screen.dart';
import 'package:e_commerce_app/features/personalization/screens/settings/settings.dart';

class  NavigationMenu  extends StatelessWidget{
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
      final controller=Get.put(NavigationController());
      final darkMode=THelpersFunction.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: darkMode ? TColors.dark : TColors.light,
          indicatorColor:darkMode ? TColors.light.withOpacity(0.1):TColors.dark.withOpacity(0.1),
          selectedIndex: controller.selectectedIndex.value,
          onDestinationSelected: (index)=>controller.selectectedIndex.value=index,
          destinations: const [
          NavigationDestination(icon:Icon(Iconsax.home), label: 'Home',),
          NavigationDestination(icon:Icon(Iconsax.shop), label: 'Store',),       
          NavigationDestination(icon:Icon(Iconsax.heart), label: 'WishList',),
          NavigationDestination(icon:Icon(Iconsax.user), label: 'Profile',),
        ]),
      ),
      body:Obx(() => controller.screens[controller.selectectedIndex.value]),
    );
  }
  
}
class NavigationController extends GetxController{
  final Rx<int> selectectedIndex=0.obs;
  final screens = [ HomeScreen(),  StoreScreen(), const FavouriteScreen(),SettingScreen()];
}