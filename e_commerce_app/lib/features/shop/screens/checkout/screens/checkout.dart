import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import '../../../../../common/widgets/products/cart/widgets/cupon_code.dart';
import 'package:e_commerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_app/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/products/cart/widgets/cart_item.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/biling_amount_section.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/biling_address-section.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/biling_payment_section.dart';


class CheckOutScreen extends StatelessWidget{
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelpersFunction.isDarkMode(context);
    return Scaffold(
      appBar:  TAppBar(
          title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(padding:const  EdgeInsetsGeometry.all(TSizes.defaultSpace),
          child: Column(
            children: [
           TcartItems(showAddandRemoveButton: false),
           SizedBox(height: TSizes.spaceBetSections),
           //Container
           TCuponCode(),
          SizedBox(height: TSizes.spaceBetSections,),
          TRoundedContainer(
            padding: EdgeInsets.all(TSizes.md),
            showBorder: true,
            backgroundColor: dark?TColors.black:TColors.textwhite,
            child: Column(
              children: [
                ///pricing
                TBillingAmountSection(),
                SizedBox(height: TSizes.spaceBetItems,),
                ///divider
                const Divider(),
                SizedBox(height: TSizes.spaceBetItems,),

                ///payment methods
                TBillingPaymentSection(),
                SizedBox(height: TSizes.spaceBetItems,),

                ///address
                
              ],
            ),
          )

            ],
          ),
          ),
        ),
         bottomNavigationBar: Padding(
       padding: const EdgeInsets.all(TSizes.defaultSpace),
       child: ElevatedButton(onPressed: ()=>
       Get.to(()=> successScreen(
        image: TImages.sucesspaymenticon,
        title: 'Payment Successful',
        subTitle: 'Your item will be shipped soon!',
        onPressed:()=> Get.offAll(()=>const NavigationMenu()),
       )), child: Text('CheckOut \$356.0')),
     ),
    );
  }
  
}

