import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/rounded_container.dart';

class TSingleAddress extends StatelessWidget{
  const TSingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark=THelpersFunction.isDarkMode(context);
    return  TRoundedContainer(
      padding: EdgeInsets.all(TSizes.md),
              backgroundColor:selectedAddress?TColors.primaryColour.withOpacity(0.5):Colors.transparent ,
              showBorder: true,
              margin: EdgeInsets.only(bottom: TSizes.spaceBetItems),
              width: double.infinity,
              borderColor: selectedAddress?Colors.transparent:dark?TColors.darkergrey:TColors.grey,
              child: Stack(
                children: [
                  Positioned(
                    right: 5,
                    top: 0,
                   
                    child:   Icon(selectedAddress?Iconsax.tick_circle:null,
                      color: selectedAddress?dark?TColors.light:TColors.dark.withOpacity(0.6):null,
                      ),
                      
              
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Swati Suryawanshi',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                      
                      
                      ),
                      const SizedBox(height: TSizes.sm/2,),
                       Text('8856842393',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,),
                       const SizedBox(height: TSizes.sm/2,),
                       Text('Anjalinagra katraj pune 46',
                      softWrap: true,),



                    ],
                  )
                ],
              ),
            );
  }
  
}