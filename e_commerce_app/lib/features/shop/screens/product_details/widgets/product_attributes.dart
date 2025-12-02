import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/chip/choice_chip.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/products/product/product_price_text.dart';
    

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({
    super.key,
    //required this.isdark,
  });

  //  final bool isdark;

  @override
  Widget build(BuildContext context) {
    final isdark = THelpersFunction.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: isdark ? TColors.darkergrey : TColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  TSectionHeading(text: 'Variation', showactionButton: false),
                  SizedBox(width: TSizes.spaceBetItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),

                          // SizedBox(width:TSizes.spaceBetItems),
                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: TSizes.spaceBetItems),

                          ///sale price
                          TProductPriceText(price: '20'),
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          //  SizedBox(width:TSizes.spaceBetItems),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              ///variation description
              const TProductTitleText(
                title:
                    'This is te Description of the Product and it can go upto max 4 Lines',
                smallSize: true,
                maxlines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBetItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(text: 'Colors', showactionButton: false),
            SizedBox(height: TSizes.spaceBetItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  selected: true,
                  text: 'Green',
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  selected: false,
                  text: 'Blue',
                  onSelected: (value) {},
                ),

                TChoiceChip(
                  selected: false,
                  text: 'Yellow',
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(text: 'Size', showactionButton: false),
            SizedBox(height: TSizes.spaceBetItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  selected: true,
                  text: 'EU 34',
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  selected: false,
                  text: 'EU 36',
                  onSelected: (value) {},
                ),

                TChoiceChip(
                  selected: false,
                  text: 'EU 38',
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
