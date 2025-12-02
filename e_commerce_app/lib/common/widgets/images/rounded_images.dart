import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
class TRoundedWidget extends StatelessWidget {
  const TRoundedWidget({
    super.key, 
    this.width,
    this.height,
    required this.imageUrl,  
    this.applyImageRadius = true,
    this.border, 
    this.backgroundColor = TColors.light,
    this.fit = BoxFit.cover, 
    this.padding, 
    this.onPressed, 
    this.boderRadius = TSizes.md, 
    this.isNetworkImage = false,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double boderRadius;

  @override
  Widget build(BuildContext context) {
     bool hasImage = imageUrl.isNotEmpty && imageUrl.startsWith('http');

    ImageProvider provider = hasImage
        ? NetworkImage(imageUrl)
        : const AssetImage(TImages.banner6); 
    Widget childWidget = hasImage
        ? Image(fit: fit, image: provider)
        : Row(
            children: [
             // Expanded(child: Image(fit: fit, image: AssetImage(TImages.banner6))),
              const SizedBox(width: 4),
              Expanded(child: Image(fit: fit, image: provider)),
            ],
          );
// ImageProvider? provider;

// if (isNetworkImage) {
//   // If imageUrl is empty → don't assign any provider
//   if (imageUrl.isNotEmpty && imageUrl.startsWith('http')) {
//     provider = NetworkImage(imageUrl);
//   } else {
//     provider = const AssetImage(TImages.user2); // <--- No fallback
//   }
// } else {
//   // Local asset image only if provided
//   provider = imageUrl.isNotEmpty ? AssetImage(imageUrl) : null;
// }
    // if (isNetworkImage) {
    //   provider = (imageUrl.isEmpty || !imageUrl.startsWith('http'))
    //       ? const AssetImage(TImages.user2)
    //       : NetworkImage(imageUrl);
    // } else {
    //   provider = AssetImage(imageUrl);
    // }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(boderRadius),
        ),
          child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(boderRadius)
              : BorderRadius.zero,
          child: childWidget,
        ),
    //    child: ClipRRect(
    //   borderRadius: applyImageRadius
    //       ? BorderRadius.circular(boderRadius)
    //       : BorderRadius.zero,
    //   child: provider != null
    //       ? Image(
    //           fit: fit,
    //           image: provider,
    //         )
    //       : const SizedBox.shrink(), // <--- Empty placeholder instead of Asset
    // ),
      ),
    );
  }
}


// class TRoundedWidget extends StatelessWidget {
//   const TRoundedWidget({
//     super.key, 
//     this.width,
//      this.height,
//      required this.imageUrl,  
//       this.applyImageRadius=true,
//        this.border, 
//         this.backgroundColor=TColors.light,
//          this.fit=BoxFit.cover, 
//          this.padding, 
//           this.onPressed, 
//          this.boderRadius=TSizes.md, 
//          this.isNetworkImage=false,

//   });
//   final double? width,height;
//   final String imageUrl;
//   final bool applyImageRadius;
//   final BoxBorder? border;
//   final Color backgroundColor;
//   final BoxFit? fit;
//   final EdgeInsetsGeometry? padding;
//   final bool isNetworkImage;
//   final VoidCallback? onPressed;
//   final double boderRadius;



//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         height: height,
//         width: width,
//         padding: padding,
//         decoration: BoxDecoration(
//           border: border,
//           color: backgroundColor,

//           borderRadius: BorderRadius.circular(boderRadius),
          
//         ),
//         child:ClipRRect(
//           borderRadius:applyImageRadius? BorderRadius.circular(boderRadius):BorderRadius.zero ,
//            child:Image(
//             fit: fit,
//             image: isNetworkImage ? NetworkImage(imageUrl): AssetImage(imageUrl)as ImageProvider
//             )
//             )
//       ),
//     );
//   }
// }

