import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/common/styles/shadows.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/icons/t_cirular_icon.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_images.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/products/model/product_model.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand_titlewith_button.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/products/product/product_price_text.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/product_details.dart';

// class TProductCardVertical extends StatelessWidget {
//   final ProductModel product;

//   const TProductCardVertical({
//     super.key,
//     required this.product,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelpersFunction.isDarkMode(context);

//     return GestureDetector(
//       onTap: () {
//         // 👆 navigate to product detail page later if needed
//       },
//       child: Container(
//         width: 180,
//         padding: const EdgeInsets.all(1),
//         decoration: BoxDecoration(
//           boxShadow: [TShadowsStyle.verticalProductShadow],
//           borderRadius: BorderRadius.circular(TSizes.productImageRadius),
//           color: dark ? TColors.darkgrey : TColors.light,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TRoundedContainer(
//               height: 180,
//               padding: const EdgeInsets.all(TSizes.sm),
//               backgroundColor: dark ? TColors.dark : TColors.light,
//               child: Stack(
//                 children: [
//                   /// Product Image
//                   Positioned.fill(
//                     child: TRoundedWidget(
//                       backgroundColor: dark ? TColors.dark : TColors.light,
//                       imageUrl: product.imageUrl,
//                       fit: BoxFit.cover,
//                     ),
//                   ),

//                   /// Discount Badge
//                   if (product.discount != "0%")
//                     Positioned(
//                       top: 8,
//                       left: 8,
//                       child: TRoundedContainer(
//                         radius: TSizes.sm,
//                         backgroundColor: TColors.secondary.withOpacity(0.8),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: TSizes.sm,
//                           vertical: TSizes.xs,
//                         ),
//                         child: Text(
//                           product.discount,
//                           style: Theme.of(context)
//                               .textTheme
//                               .labelLarge!
//                               .apply(color: TColors.black),
//                         ),
//                       ),
//                     ),

//                   /// Fav Icon
//                   Positioned(
//                     top: 0,
//                     right: 0,
//                     child: TCircularIcon(
//                       icon: product.isFav ? Iconsax.heart5 : Iconsax.heart,
//                       iconColor: product.isFav ? TColors.error : TColors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: TSizes.spaceBetItems / 2),

//             /// TITLE + BRAND
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TProductTitleText(
//                     title: product.title,
//                     smallSize: true,
//                     maxlines: 2,
//                   ),
//                   const SizedBox(height: TSizes.spaceBetItems / 2),
//                   TbrandTitleswithbutton(
//                     title: product.brand,
//                     brandTextSize: TextSizes.large,
//                   ),
//                 ],
//               ),
//             ),

//             const Spacer(),

//             /// PRICE + ADD TO CART
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: TSizes.sm),
//                   child: TProductPriceText(price: product.price.toString()),
//                 ),
//                 Container(
//                   decoration: const BoxDecoration(
//                     color: TColors.dark,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(TSizes.cardRadiusMd),
//                       bottomLeft: Radius.circular(TSizes.productImageRadius),
//                     ),
//                   ),
//                   child: SizedBox(
//                     width: TSizes.iconLg * 1.2,
//                     height: TSizes.iconLg * 1.2,
//                     child: const Icon(
//                       Iconsax.add,
//                       color: TColors.light,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelpersFunction.isDarkMode(context);

    return GestureDetector(
      onTap: ()=>Get.to(()=>const ProductDetailsScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowsStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkgrey : TColors.light,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
                        backgroundColor: dark ? TColors.dark : TColors.light,

              child: Stack(
                children: [
                   Positioned.fill(
        child: Container(
          decoration: BoxDecoration(
            color: dark ? TColors.dark : TColors.light,

            
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          ),
          child:  TRoundedWidget(
                                    backgroundColor: dark ? TColors.dark : TColors.light,

            imageUrl: TImages.productImage15,
            fit: BoxFit.cover,
          ),
        ),
      ),
                  // Positioned.fill(
                  //   child: const TRoundedWidget(
                      
                  //     imageUrl: TImages.productImage15,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),

                  /// Discount Badge - Top Left
                  Positioned(
                    top: 8,
                    left: 8,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm,
                        vertical: TSizes.xs,
                      ),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),

                  /// Heart Icon - Top Right
                  Positioned(
                    top: 0,
                    right: 0,
                    child: const TCircularIcon(
                     
                      icon: Iconsax.heart5,
                      iconColor: TColors.error,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBetItems / 2),

            /// TITLE + BRAND
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm, right: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TProductTitleText(
                    title: 'Green Nike Air Shoes',
                    smallSize: true,
                    maxlines: 2,
                  ),
                  const SizedBox(height: TSizes.spaceBetItems / 2),
                  const TbrandTitleswithbutton(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// PRICE + ADD TO CART
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child:  TProductPriceText(price: '35.0'),
                ),

                /// Add to cart button
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomLeft: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: const Icon(
                      Iconsax.add,
                      color: TColors.light,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class TProductCardVertical extends StatelessWidget {
//   const TProductCardVertical({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final dark=THelpersFunction.isDarkMode(context);
//     return GestureDetector(
//       onTap: (){},
//       child: Container(
//         width: 180,
//         padding: EdgeInsets.all(1),
//         decoration: BoxDecoration(
//           boxShadow: [TShadowsStyle.verticalProductShadow],
//           borderRadius: BorderRadius.circular(TSizes.productImageRadius),
//           color:dark?TColors.darkgrey:TColors.light
//         ),
//         child:Column(
//           children: [
//             TRoundedContainer(
//               height: 180,
//               padding: const EdgeInsets.all(TSizes.sm),
//               backgroundColor: dark?TColors.dark:TColors.light,
//               child:  Stack(
//                 children: [
//                  Positioned(
//                   top: 12,
//                   left: 0,
//                   child: const TRoundedWidget(imageUrl: TImages.productImage15,)),
//                   TRoundedContainer(
//                   radius: TSizes.sm,
//                   backgroundColor: TColors.secondary.withOpacity(0.8),
//                   padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
//                   child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
//                   ),
//                   ),
//                  Positioned(
//                   top: 0,
//                   right: 0,
//                   child: const TCircularIcon(icon: Iconsax.heart5,iconColor: TColors.error,)
//                   ),
                
              
//                 ],
//               ),
//             ),
//             const SizedBox(height: TSizes.spaceBetItems/2),
//               Padding(
//                     padding: const EdgeInsetsGeometry.only(left: TSizes.sm),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         TProductTitleText(title: 'Green Nike Air Shoes',smallSize: true,maxlines: 2),
//                          const SizedBox(height: TSizes.spaceBetItems/2),
//                           TbrandTitleswithbutton(title: 'Nike',brandTextSize: TextSizes.large),
                       
                         
      
                       
//                       ],
//                     ),
//                     ),
//                    const Spacer(),
//                          Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(left: TSizes.sm),
//                               child: TProductPriceText(price: '35.0')
//                               ),
//                             const SizedBox(width: TSizes.spaceBetItems),
//                             Container(
//                               decoration: const BoxDecoration(
//                                 color: TColors.dark,
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(TSizes.cardRadiusMd),
//                                   bottomLeft: Radius.circular(TSizes.productImageRadius)
//                                 )
//                               ),
//                               child:SizedBox(
//                                 width: TSizes.iconLg*1.2,
//                                 height: TSizes.iconLg*1.2,
      
//                                 child: const Icon(Iconsax.add,color: TColors.light
//                                 )),
//                             )
      
//                           ],
      
//                          )
          
//           ],
//         ),
      
//       ),
//     );
//   }
// }

