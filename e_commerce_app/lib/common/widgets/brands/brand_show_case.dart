import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/rounded_container.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images
  });
  final List<String>images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkergrey,
      backgroundColor: Colors.transparent,
      margin: EdgeInsets.only(bottom: TSizes.spaceBetItems),
      padding: EdgeInsets.all(TSizes.md),
      child: Column(
        children: [
          TBrandCard(showBorder: false),
          SizedBox(height:  TSizes.spaceBetItems),
          Row(
            children:
            images.map((image)=>brandTopProductImageWidget(image,context)).toList()
          )
               
    
            
          
    
        ],
      ),
    );
  }
}
Widget brandTopProductImageWidget(String image,context){
  return  Expanded(
                child: TRoundedContainer(
                  height: 100,
                  backgroundColor: THelpersFunction.isDarkMode(context)?TColors.darkergrey:TColors.light,
                  margin: const EdgeInsets.only(right: TSizes.sm),
                  child: Image(fit: BoxFit.contain,image: AssetImage(image)),
                ),
              );
}

