import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/common/widgets/images/t_circular_image.dart';
import '../../../utils/helpers/helpers_function.dart' show THelpersFunction;
import 'package:e_commerce_app/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand_titlewith_button.dart' show TbrandTitleswithbutton;


class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });
  final bool showBorder;
  final void Function()? onTap;

   

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,
    child: TRoundedContainer(
    
      padding:const EdgeInsets.all(TSizes.sm),
      showBorder: showBorder,
      backgroundColor: Colors.transparent,
      child: Row(
        children: [
          Flexible(
            child: TCircularImage(
              isNetworkImage: false,
              image: TImages.clothIcon,
              backgroundColor: Colors.transparent,
              overlaycolor: THelpersFunction.isDarkMode(context)?TColors.light:TColors.black
              
              ),
          ),
       SizedBox(width: TSizes.spaceBetSections/2),
       Expanded(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const  TbrandTitleswithbutton(title: 'Nike',brandTextSize: TextSizes.large,),
             Text('256 products',style: Theme.of(context).textTheme.labelMedium,overflow: TextOverflow.ellipsis,),
                         
          ],
         ),
       )
    
    
        ],
      ),
    ),
                  );
  }
}

