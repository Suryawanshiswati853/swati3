import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/common/widgets/shimmer/TShimmerEffect.dart';


class TcategoryShimmer extends StatelessWidget {
  const TcategoryShimmer({super.key,  this.itemCount=6});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_,__)=>const SizedBox(width: TSizes.spaceBetItems,),

        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (_, __) {
          return 
             Column( 
              crossAxisAlignment: CrossAxisAlignment.start,            
               children: [
                TShimmerEffect(width: 55, height: 55,radius:55),
                const SizedBox(height: TSizes.spaceBetItems/2,),
                TShimmerEffect(width: 55, height: 8),
              
               
              ],
         
      );
   } ));
  }

}