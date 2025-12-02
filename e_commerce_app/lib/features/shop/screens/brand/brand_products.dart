import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_commerce_app/common/widgets/products/sortable/sortable.dart';

class BrandsProductsScreen extends StatelessWidget {
  const BrandsProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Nike'),showBackArrow: true,),
      body:  SingleChildScrollView(
        child:Padding(
          padding:const EdgeInsetsGeometry.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //brands 
              TBrandCard(showBorder: true),
               const  SizedBox(height: TSizes.spaceBetSections),
               TSortableProducts(),

              ])


        
        ),),
      
    );
  }
}