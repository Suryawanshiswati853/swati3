import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:e_commerce_app/common/widgets/products/cart/widgets/cart_item.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/screens/checkout.dart';
import 'package:e_commerce_app/common/widgets/products/product/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/products/cart/widgets/add_remove_button.dart';

class cartScreen extends StatelessWidget {
  const cartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true,
        ),
      
      body:Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: TcartItems(),
         
        ),
      
     bottomNavigationBar: Padding(
       padding: const EdgeInsets.all(TSizes.defaultSpace),
       child: ElevatedButton(onPressed: ()=>Get.to(()=> const CheckOutScreen()), child: Text('CheckOut \$356.0')),
     ),
    );
  }
}

