import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/rounded_container.dart';


class TBillingPaymentSection extends StatelessWidget{
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
        final dark=THelpersFunction.isDarkMode(context);


    return Column(
      children: [
        TSectionHeading(text: 'Payment Mode',buttonTitle: 'Change',onPressed: (){},),
                  SizedBox(height: TSizes.spaceBetItems/2),
                  Row(
                    children: [
                      TRoundedContainer(
                         padding: EdgeInsets.all(TSizes.sm),

                        width: 60,
                        height: 35,
                        backgroundColor: dark?TColors.black:TColors.textwhite,
                        child: Image(image: AssetImage(TImages.paypal),fit: BoxFit.contain,)
                        ),
                      SizedBox(height: TSizes.spaceBetItems/2),
                      Text('PayPal',style: Theme.of(context).textTheme.bodyLarge,),


       // )
                    ],
                  )

      ],
    );
  }
  
}