import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_images.dart';
import 'package:e_commerce_app/common/widgets/texts/t_title_brand_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart' show THelpersFunction;

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TRoundedWidget(
          width: 60,
          height: 60,
          padding: EdgeInsets.all(TSizes.sm),
          imageUrl: TImages.productImage16,
          backgroundColor: THelpersFunction.isDarkMode(context)
              ? TColors.darkergrey
              : TColors.grey,
        ),
        SizedBox(width: TSizes.spaceBetItems),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TBrandTitleText(title: 'Nike'),
            Flexible(
              child: const TProductTitleText(
                title: 'Black Sports Shoes',
                maxlines: 1,
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: ' Color',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: ' Green',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: ' Size',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: ' UK 08',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
