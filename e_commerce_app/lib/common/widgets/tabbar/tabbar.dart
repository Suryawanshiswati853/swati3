import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';

class TTabbar extends StatelessWidget implements PreferredSizeWidget {
  const TTabbar({
    super.key, required this.tabs,
  });
  final List<Widget>tabs;

  @override
  Widget build(BuildContext context) {
    final dark=THelpersFunction.isDarkMode(context);
    return Material(
      color: dark?TColors.black:TColors.textwhite,
      child:Container(
    height: 48, 
    width: 500,
    child:  TabBar(
          tabs:tabs,
        
       isScrollable: true,
       indicatorColor: TColors.primaryColour,
       unselectedLabelColor: TColors.darkergrey,
       labelColor: dark?TColors.light:TColors.primaryColour,
         labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0), 
         splashFactory: NoSplash.splashFactory, 
         
     
      ),
    ));
  }
  
  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
