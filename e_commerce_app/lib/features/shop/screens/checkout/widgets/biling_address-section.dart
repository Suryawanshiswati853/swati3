import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';

class TBillingAddressSection extends StatelessWidget{
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
        final dark=THelpersFunction.isDarkMode(context);


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(text: 'Shipping Address',buttonTitle: 'Change',onPressed: (){},),
                  SizedBox(height: TSizes.spaceBetItems/2),
         Text('Coding with swati',style:Theme.of(context).textTheme.bodyLarge),
                              SizedBox(height: TSizes.spaceBetItems/2),

         Row(
          children: [
            Icon(Icons.phone,color: TColors.grey,size: 16,),
            SizedBox(width: TSizes.spaceBetItems,),
            Expanded(
              child: Text('8856842393',style:Theme.of(context).textTheme.bodyMedium))
          ],
         ),
                     SizedBox(height: TSizes.spaceBetItems/2),
                        Row(
          children: [
            Icon(Icons.location_history,color: TColors.grey,size: 16,),
            SizedBox(width: TSizes.spaceBetItems,),
            Expanded(
              child: Text('anjalinagar katraj pune 46',style:Theme.of(context).textTheme.bodyMedium,softWrap: true,))
          ],
         ),
                     SizedBox(height: TSizes.spaceBetItems/2),


    ]);
  }
}

