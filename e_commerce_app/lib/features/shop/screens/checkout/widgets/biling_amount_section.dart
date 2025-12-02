import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget{
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SubTotal',style:Theme.of(context).textTheme.bodyMedium),
            Text('\$256.0',style:Theme.of(context).textTheme.bodyMedium)

          ],
        ),
                  SizedBox(height: TSizes.spaceBetItems/2,),
                   Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee',style:Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0',style:Theme.of(context).textTheme.labelLarge)

          ],
        ),
           SizedBox(height: TSizes.spaceBetItems/2,),
                   Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee',style:Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0',style:Theme.of(context).textTheme.labelLarge)

          ],
        ),
          SizedBox(height: TSizes.spaceBetItems/2,),
                   Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total',style:Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0',style:Theme.of(context).textTheme.titleMedium)

          ],
        ),

      ],

    );
  }
  
}