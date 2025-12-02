import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/products/product/ratings/rating_bar_indicator.dart';
import 'package:e_commerce_app/features/shop/screens/product_review/widgets/user_review_card.dart';
import 'package:e_commerce_app/features/shop/screens/product_review/widgets/overall_product_rating.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final isdark=THelpersFunction.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(title: Text('Reviews & Rating'), showBackArrow: true),
      // bottomNavigationBar: BottomtoAddCard(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                'Ratings and reviews are verified and are from people who use the same type of device that you use',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: TSizes.spaceBetItems),
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 3.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBetSections),
              //user review list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
