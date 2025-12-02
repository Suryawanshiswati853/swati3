import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/common/styles/shadows.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/icons/t_cirular_icon.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_images.dart';
import 'package:e_commerce_app/common/widgets/texts/t_title_brand_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/products/product/product_price_text.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark=THelpersFunction.isDarkMode(context);
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 310,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          // boxShadow: [TShadowsStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color:dark?TColors.darkgrey:TColors.light
        ),
         child:Row(
           children: [
                 TRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark?TColors.dark:TColors.light,
              child:  Stack(
                children: [
                   SizedBox(height: 120,width: 120,    child: const TRoundedWidget(imageUrl: TImages.productImage10, applyImageRadius: true)),
                     Positioned(
                  top: 12,
                 child:
                 // const TRoundedWidget(imageUrl: TImages.productImage10, applyImageRadius: true)),
                  TRoundedContainer(
                    radius: TSizes.sm,
                  backgroundColor: TColors.secondary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
                  child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
                  ),
                  ),
                 ),
                   Positioned(
                  top: 0,
                  right: 0,
                  child: const TCircularIcon(icon: Iconsax.heart5,iconColor: TColors.error,)
                  ),
                 ]),
               
               
                
              
          ),
        SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm,right: TSizes.sm),
              child: Column(
                children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: 'Green Nike Half Sleeves Shirt',smallSize: true,maxlines: 2),
                       const SizedBox(height: TSizes.spaceBetItems/2),
                       TBrandTitleText(title: 'Nike')
                  
                        // Text(
                        //   'Green Nike Air Shoes',
                        //   style: Theme.of(context).textTheme.labelLarge!
                        //   .apply(
                        //     color: dark?TColors.light:TColors.dark,
                            
                        //   ),
                        //   maxLines: 2,
                        //   overflow: TextOverflow.ellipsis,
                           
                        //   textAlign: TextAlign.left,
                        // )
                    ],
                  ),
                 const Spacer(),                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Flexible(child: TProductPriceText(price:'256.0' ,)),
                                          Container(
                              decoration: const BoxDecoration(
                                color: TColors.dark,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(TSizes.cardRadiusMd),
                                  bottomRight: Radius.circular(TSizes.productImageRadius)
                                )
                              ),
                              child:SizedBox(
                                width: TSizes.iconLg*1.2,
                                height: TSizes.iconLg*1.2,
      
                                child:Center(child:  const Icon(Iconsax.add,color: TColors.light
                               ) )),
                            )
                    ],
                  )
                ],
              ),
            ),
          )
          ],
              
              
              ),
            ),
    
         );
        // //     TRoundedContainer(
        // //       height: 180,
        // //       padding: const EdgeInsets.all(TSizes.sm),
        // //       backgroundColor: dark?TColors.dark:TColors.light,
        // //       child:  Stack(
        // //         children: [
        // //          Positioned(
        // //           top: 12,
        // //           child: const TRoundedWidget(imageUrl: TImages.productImage10, applyImageRadius: true)),
        // //           TRoundedContainer(
        // //             radius: TSizes.sm,
        // //           backgroundColor: TColors.secondary.withOpacity(0.8),
        // //           padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
        // //           child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
        // //           ),
        // //           ),
        // //          Positioned(
        // //           top: 0,
        // //           right: 0,
        // //           child: const TCircularIcon(icon: Iconsax.heart5,iconColor: TColors.error,)
        // //           ),
                
              
        // //         ],
        // //       ),
        // //     ),
        //     const SizedBox(height: TSizes.spaceBetItems/2),
        //       Padding(
        //             padding: const EdgeInsetsGeometry.only(left: TSizes.sm),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 TProductTitleText(title: 'Green Nike Air Shoes',smallSize: true,maxlines: 2),
        //                  const SizedBox(height: TSizes.spaceBetItems/2),
                         
        //                  Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     TProductPriceText(price: '35.0',),
        //                     const SizedBox(width: TSizes.spaceBetItems),
        //                     Container(
        //                       decoration: const BoxDecoration(
        //                         color: TColors.dark,
        //                         borderRadius: BorderRadius.only(
        //                           topLeft: Radius.circular(TSizes.cardRadiusMd),
        //                           bottomLeft: Radius.circular(TSizes.productImageRadius)
        //                         )
        //                       ),
        //                       child:SizedBox(
        //                         width: TSizes.iconLg*1.2,
        //                         height: TSizes.iconLg*1.2,
      
        //                         child: const Icon(Iconsax.add,color: TColors.light
        //                         )),
        //                     )
      
        //                   ],
      
        //                  )
      
                        // Text(
                        //   'Green Nike Air Shoes',
                        //   style: Theme.of(context).textTheme.labelLarge!
                        //   .apply(
                        //     color: dark?TColors.light:TColors.dark,
                            
                        //   ),
                        //   maxLines: 2,
                        //   overflow: TextOverflow.ellipsis,
                         
                        //   textAlign: TextAlign.left,
                        // )
    //                   ],
    //                 ),
    //                 ),
          
    //       ],
    //     ),
      
    //   ),
  
  }
}

