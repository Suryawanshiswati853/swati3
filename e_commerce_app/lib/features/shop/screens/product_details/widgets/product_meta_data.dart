import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand_titlewith_button.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/products/product/product_price_text.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = THelpersFunction.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///price,sale price
          Row(
            children: [
              ///sale tag
              TRoundedContainer(
                radius: TSizes.sm,
                backgroundColor: TColors.secondary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm,
                  vertical: TSizes.xs,
                ),
                child: Text(
                  '25%',
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.apply(color: TColors.black),
                ),
              ),
              //price
              const SizedBox(width: TSizes.spaceBetItems),
              Text(
                '\$250',
                style: Theme.of(context).textTheme.titleSmall!.apply(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(width: TSizes.spaceBetItems),
              TProductPriceText(price: '179', isLarge: true),
            ],
          ),
          const SizedBox(width: TSizes.spaceBetItems / 1.5),

          ///title
          TProductTitleText(title: 'Green Nike Sports Shoes'),
          const SizedBox(width: TSizes.spaceBetItems / 1.5),

          ///stack status
          Row(
            children: [
              TProductTitleText(title: 'Status'),
              const SizedBox(width: TSizes.spaceBetItems),

              Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
          const SizedBox(width: TSizes.spaceBetItems / 1.5),

          ///brand
          Row(
            children: [
              TCircularImage(
                width: 32,
                height: 32,
                overlaycolor: isdark ? TColors.light : TColors.dark,
                image: TImages.shoeIcon,
              ),
              const TbrandTitleswithbutton(
                title: 'Nike',
                brandTextSize: TextSizes.medium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
