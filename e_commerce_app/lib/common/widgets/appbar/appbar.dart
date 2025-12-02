import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TAppBar({super.key,
  this.title,
  this.actions,
  this.leadingIcon,
  this.leadingOnpressed,
  this.showBackArrow=false
  });
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnpressed;

  @override
  Widget build(BuildContext context) {
    final dark=THelpersFunction.isDarkMode(context);
    return  Padding(padding:const EdgeInsetsGeometry.symmetric(horizontal: TSizes.md),
    child:AppBar(
     // toolbarHeight: 0,
      automaticallyImplyLeading: false,
      leading:showBackArrow 
      ?IconButton(onPressed: ()=>Get.back(), icon:  Icon(Iconsax.arrow_left,color: dark?TColors.light:TColors.dark,))
      :leadingIcon != null? IconButton(onPressed: leadingOnpressed, icon:  Icon(leadingIcon)): null,
      title: title,
      actions: actions,
    ) ,);
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
  
}