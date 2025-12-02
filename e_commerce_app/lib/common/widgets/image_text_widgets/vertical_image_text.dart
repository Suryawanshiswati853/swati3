import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';


class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key, 
    required this.image, 
    required this.title,  
    this.textColor = TColors.light, 
    this.backgroundColor, 
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelpersFunction.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBetItems),
        child: Column(
                mainAxisSize: MainAxisSize.min,

          children: [
            Container(
              height: 56,
              width: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? TColors.light : TColors.dark),
                borderRadius: BorderRadius.circular(100),
              ),
             child: Center(
                child: image.isNotEmpty
                    ? Image.network(
                        image,
                        color: dark ? TColors.primaryColour : TColors.light,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Icon(Icons.image_not_supported),
                      )
                    : Icon(Icons.image), // fallback if empty
              ),
            ),
            
            const SizedBox(height: TSizes.spaceBetItems / 2),
            SizedBox(
              width: 70,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String image, bool dark) {
    if (image.isEmpty) {
      return Image.asset(
        TImages.user, 
        fit: BoxFit.cover,
        color: dark ? TColors.light : TColors.primaryColour,
      );
    } else if (image.startsWith('http')) {
      return Image.network(
        image,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Image.asset(
          TImages.user2,
          fit: BoxFit.cover,
          color: dark ? TColors.light : TColors.primaryColour,
        ),
      );
    } else {
      return Image.asset(
        image,
        fit: BoxFit.cover,
        color: dark ? TColors.light : TColors.primaryColour,
      );
    }
  }
}

// class TVerticalImageText extends StatelessWidget {
//   const TVerticalImageText({
//     super.key, required this.image, required this.title,  this.textColor=TColors.light, this.backgroundColor, this.onTap,
//   //  this.iconColor = TColors.black,
//   });
//   final String image,title;
//   final Color textColor;
//   final Color? backgroundColor;
//   final void Function()? onTap;
//    // final Color iconColor;



//   @override
//   Widget build(BuildContext context) {
//     final dark=THelpersFunction.isDarkMode(context);
//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//        padding: EdgeInsetsGeometry.only(right: TSizes.spaceBetItems),
//         child: Column(children: [
//            Container(
//              height: 56,
//              width: 56,
//              padding:const  EdgeInsets.all(TSizes.sm),
//              decoration: BoxDecoration(
//                color: backgroundColor??(dark?TColors.dark:TColors.light),
//                borderRadius: BorderRadius.circular(100)
//              ),
//              child: Center(
//                child: Image(image: AssetImage(image),fit:BoxFit.cover,color: dark?TColors.light:TColors.primaryColour, 
               
               
//                ),
               
//              ),
//            ),
//              const SizedBox(
//                         height: TSizes.spaceBetItems/2,
//                       ),
//                       SizedBox(
//                         width: 55,
//                         child: Text(title,style: Theme.of(context).textTheme.labelMedium!.apply(color:textColor),maxLines: 1,overflow: TextOverflow.ellipsis,),
//                       )
      
//          ],),
//       ),
//     );
//   }
// }

