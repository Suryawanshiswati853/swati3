import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/rounded_container.dart';

class TOrderListitems extends StatelessWidget{
  const TOrderListitems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelpersFunction.isDarkMode(context);
    return ListView.separated(
      itemCount:5,
      shrinkWrap: true,
      separatorBuilder: (_,_)=>const SizedBox(height: TSizes.spaceBetItems),
      itemBuilder:(_,index)=> TRoundedContainer(
        padding:const  EdgeInsets.all(TSizes.md),
       showBorder: true,
       backgroundColor: dark?TColors.dark:TColors.light,
       child: Column(
         mainAxisSize: MainAxisSize.min,
        children: [
         Row(
          children: [
         const   Icon(Iconsax.ship),
         const   SizedBox(width: TSizes.spaceBetItems/2),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Processing',style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primaryColour,fontWeightDelta: 1),),
                  SizedBox(height: TSizes.spaceBetItems/2),
                  Text('19 sep 2025',style: Theme.of(context).textTheme.headlineSmall,),
                ],
              ),
            ),
            IconButton(onPressed: (){}, icon:Icon(Iconsax.arrow_right_34,size: TSizes.iconSm,)),
      
          ],
         ),
          const   SizedBox(height: TSizes.spaceBetItems),
      
         
               Row(
                       children: [
                      const   Icon(Iconsax.ship),
                      const   SizedBox(width: TSizes.spaceBetItems/2),
               
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order',style: Theme.of(context).textTheme.labelMedium),
                      SizedBox(height: TSizes.spaceBetItems/2),
                      Text('V12567890',style: Theme.of(context).textTheme.titleMedium,),
                    ],
                  ),
                ),
               
                       ],
                      ),
             ],
           )
      
        
      
      ),
    );
  }
  
}