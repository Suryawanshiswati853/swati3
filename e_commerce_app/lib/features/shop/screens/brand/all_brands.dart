import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/common/widgets/products/sortable/sortable.dart';
import 'package:e_commerce_app/features/shop/screens/brand/brand_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'),showBackArrow: true,),
      body:  SingleChildScrollView(
        child:Padding(
          padding:const EdgeInsetsGeometry.all(TSizes.defaultSpace),
        child: Column(
          children: [
           const TSectionHeading(text: 'Brands',showactionButton: false,),
          const  SizedBox(height: TSizes.spaceBetSections),
            //brands 
            TGridLayout(itemCount: 10,mainAxisExtent: 80, itemBuilder: (context,index)=>
            TBrandCard(showBorder: true,onTap: () => Get.to(()=>const BrandsProductsScreen()),),)


          ],
        ),),
      ),
    );
  }
}