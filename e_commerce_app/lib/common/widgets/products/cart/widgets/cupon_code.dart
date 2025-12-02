import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/rounded_container.dart';

class TCuponCode extends StatelessWidget {
  const TCuponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark=THelpersFunction.isDarkMode(context);

    return TRoundedContainer(
     showBorder: true,
     padding: EdgeInsets.only(top: TSizes.sm,bottom: TSizes.sm,right: TSizes.sm,left: TSizes.md),
     backgroundColor: dark?TColors.dark:TColors.light,
     child: Row(
       children: [
         Flexible(
           child: TextFormField(
             decoration: InputDecoration(
               hintText: 'Have a promo enter here',
               focusedBorder: InputBorder.none,
               border: InputBorder.none,
               enabledBorder: InputBorder.none,
               errorBorder: InputBorder.none,
               disabledBorder: InputBorder.none,
             ),
           ),
         ),
         SizedBox(width: 80
         ,    child: ElevatedButton(
           style: ElevatedButton.styleFrom(
             foregroundColor: dark?TColors.light.withOpacity(0.5):TColors.dark.withOpacity(0.5),
              backgroundColor: TColors.grey.withOpacity(0.2),
                                   side: BorderSide(color:TColors.grey.withOpacity(0.1))
    
           ),
           onPressed: (){}, child: const Text('Apply')
           ))
       ],
     ),
     
    );
  }
}