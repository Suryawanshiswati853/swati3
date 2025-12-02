import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/icons/t_cirular_icon.dart';
import 'package:e_commerce_app/features/athentication/screens/home/home.dart';
import 'package:e_commerce_app/common/widgets/products/cart/widgets/cart_menu_icon.dart';
import 'package:e_commerce_app/common/widgets/products/product/product_card_vertical.dart';

class FavouriteScreen  extends StatelessWidget{
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
        appBar: TAppBar(
          title: Text('Wishlist',style:Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCircularIcon(

              icon:Iconsax.add,
              onPressed: (){
                Get.to(HomeScreen());
      
            },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsetsGeometry.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(itemCount: 4, itemBuilder: (_,index)=> const TProductCardVertical()),
            ],
          ),
          ),
        ),
     );
  }
}