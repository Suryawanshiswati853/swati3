import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key, required this.text,  this.icon=Iconsax.search_normal,  this.showBackground=true,  this.showborder=true,
    this.onTap,this.padding = const EdgeInsetsGeometry.symmetric(horizontal:TSizes.defaultSpace),
  });
  final String text;
  final IconData? icon;
  final bool showBackground,showborder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final dark=THelpersFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding!,
        child: Container(
          width: TDeviceUtils.getScreenwidth(context),
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
            color:showBackground ?dark?TColors.dark: TColors.light:Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border:showborder? Border.all(color: TColors.grey):null,
          ),
          child: Row(
            children: [
              Icon(icon,color: TColors.grey,),
              const SizedBox( height: TSizes.spaceBetSections,),
              Text(text,style: Theme.of(context).textTheme.bodySmall),
              
                 
              
                  
            ],
          ),
        ),
      ),
    );
  }
}

