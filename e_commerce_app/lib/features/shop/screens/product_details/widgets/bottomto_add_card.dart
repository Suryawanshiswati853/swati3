import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/icons/t_cirular_icon.dart';

class BottomtoAddCard extends StatelessWidget {
  const BottomtoAddCard({
    super.key,
    //required this.isdark,
  });

  //  final bool isdark;

  @override
  Widget build(BuildContext context) {
    final isdark = THelpersFunction.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
        vertical: TSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: isdark ? TColors.dark : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: TColors.grey,
                width: 40,
                height: 40,
                iconColor: TColors.light,
              ),
              SizedBox(width: TSizes.spaceBetItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              SizedBox(width: TSizes.spaceBetItems),
              TCircularIcon(
                icon: Iconsax.add,
                backgroundColor: TColors.black,
                width: 40,
                height: 40,
                iconColor: TColors.light,
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black),
            ),
            onPressed: () {},
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
