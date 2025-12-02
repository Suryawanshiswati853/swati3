import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart.dart';

class TcardCounterIcon extends StatelessWidget {
  const TcardCounterIcon({
    super.key,
   required this.onPressed,
   this.iconColour
  });
  final VoidCallback onPressed;
  final Color? iconColour; 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       IconButton(onPressed:()=> Get.to(()=>cartScreen()), icon: Icon(Iconsax.shopping_bag,color: iconColour),
                      
                        ),
                        Positioned(
    right: 0,
    child: Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: TColors.black,
        borderRadius: BorderRadius.circular(100)
      ),
        child:Center(
          child: Text('2',style: Theme.of(context).textTheme.labelLarge!.apply(color:TColors.textwhite,fontSizeFactor: 0.8),),
      
    )
    ),
                        
                        ),
    
                        ],
                      );
  }
}

