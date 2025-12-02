import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import '../../../../../utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/icons/t_cirular_icon.dart';


class TProductQtyWithaddandremoveButton extends StatelessWidget {
  const TProductQtyWithaddandremoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          width: 32,
          height: 32,
          size: TSizes.md,
          icon: Iconsax.minus,
          iconColor: THelpersFunction.isDarkMode(context)?TColors.textwhite:TColors.black,
         backgroundColor: THelpersFunction.isDarkMode(context)?TColors.dark:TColors.light,
        
          ),
           SizedBox(width:TSizes.spaceBetItems),
       Text('2',style: Theme.of(context).textTheme.titleSmall,),
       SizedBox(width:TSizes.spaceBetItems),
        TCircularIcon(
      width: 32,
      height: 32,
      size: TSizes.md,
      icon: Iconsax.add,
      iconColor: TColors.textwhite,
     backgroundColor: TColors.primaryColour,
    
      ),
      ],
    );
  }
}

