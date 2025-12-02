import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'widgets/product_meta_data.dart';
import 'widgets/product_attributes.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/product_review/product_review.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/bottomto_add_card.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_details_image_slider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = THelpersFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: BottomtoAddCard(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///product image slider
            TProductImageSlider(),
            //product Details
            Padding(
              padding: EdgeInsetsGeometry.only(
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
                right: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating and share
                  const TRatingAndShare(),

                  /// price,title,stock,brand
                  const ProductMetaData(),

                  /// attributes
                  const TProductAttributes(),
                  SizedBox(height: TSizes.spaceBetSections),

                  /// checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TColors.primaryColour,
                      ),
                      child: Text('CheckOut'),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBetSections),

                  /// Description
                  TSectionHeading(text: 'Description', showactionButton: false),
                  SizedBox(height: TSizes.spaceBetItems),
                  ReadMoreText(
                    'This is the product description  for Blue Nike shoes,There are more things that can be added but i am just practing and nothing less',
                    trimLines: 2,
                    //  colorClickableText: TColors.primaryColour,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show More',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  /// Reviews
                  const Divider(),

                  const SizedBox(height: TSizes.spaceBetItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(
                        text: 'Reviews(199)',
                        showactionButton: false,
                      ),
                      IconButton(
                        onPressed: () =>
                            Get.to(() => const ProductReviewScreen()),
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBetSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
