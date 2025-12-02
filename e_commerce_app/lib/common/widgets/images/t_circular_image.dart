import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/shimmer/TShimmerEffect.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key, 
    this.fit=BoxFit.cover, 
    required this.image,
      this.isNetworkImage=false,
      this.overlaycolor,
       this.backgroundColor,
        this.width=56,
          this.height=56,
           this.padding=TSizes.sm,
  });
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlaycolor;
  final Color? backgroundColor;
  final double width,height,padding;

  @override
  Widget build(BuildContext context) {
        final dark = THelpersFunction.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? TColors.light : TColors.dark),

       // color:backgroundColor?? (THelpersFunction.isDarkMode(context)?TColors.black:TColors.light),
        borderRadius: BorderRadius.circular(100)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(child:isNetworkImage?CachedNetworkImage(
          fit: fit,
          color: overlaycolor,
          imageUrl: image,
          errorWidget: (context, url, error) => const Icon(Icons.error),
          progressIndicatorBuilder: (context, url, progress) => TShimmerEffect(width: 55, height: 55),
          )
        : Image(image: AssetImage(image),   color: overlaycolor,fit: fit,)),
      ),
  
     
    
    
    );
  }
}