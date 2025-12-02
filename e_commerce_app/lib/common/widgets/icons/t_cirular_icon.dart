import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
     super.key, 
     this.width,
      this.height, 
      this.size=TSizes.lg,
     required this.icon,
      this.iconColor, 
      this.backgroundColor,
       this.onPressed,
  });
  final double? width,height,size;
  final IconData icon;
  final Color? iconColor,backgroundColor;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    final dark=THelpersFunction.isDarkMode(context);
    return Container(
      width: width,
      height: height,
     decoration: BoxDecoration(
      color:backgroundColor!=null?backgroundColor!: dark?TColors.black.withOpacity(0.9):TColors.light.withOpacity(0.9),
      borderRadius: BorderRadius.circular(50)
     ),
     child: IconButton(onPressed: onPressed, icon:  Icon(icon,color: iconColor,size: size)),
    );
  }
}
