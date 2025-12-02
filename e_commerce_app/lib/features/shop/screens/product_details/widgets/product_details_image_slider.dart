import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import '../../../../../common/widgets/icons/t_cirular_icon.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/utils/constants/colors.dart' show TColors;
import 'package:e_commerce_app/common/widgets/images/rounded_images.dart';
import 'package:e_commerce_app/common/widgets/curved_edge/curved_edges_widget.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    //required this.isdark,
  });

  //  final bool isdark;

  @override
  Widget build(BuildContext context) {
    final isdark = THelpersFunction.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: isdark ? TColors.dark : TColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsetsGeometry.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Image(image: AssetImage(TImages.productImage15)),
                ),
              ),
            ),

            Positioned(
              left: TSizes.defaultSpace,
              right: 0,
              bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => TRoundedWidget(
                    imageUrl: TImages.productImage16,
                    width: 80,
                    backgroundColor: isdark ? TColors.dark : TColors.light,
                    border: Border.all(color: TColors.primaryColour),
                    padding: EdgeInsets.all(TSizes.sm),
                  ),
                  separatorBuilder: (_, _) =>
                      SizedBox(width: TSizes.spaceBetItems),
                  itemCount: 4,
                ),
              ),
            ),
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5, iconColor: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
