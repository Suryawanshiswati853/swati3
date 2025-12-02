import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/texts.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/common/widgets/products/model/product_model.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/search_container.dart';
import 'package:e_commerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/products/product/product_card_vertical.dart';
import 'package:e_commerce_app/features/athentication/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/common/widgets/products/product/product_card_horizontal.dart';
import 'package:e_commerce_app/features/athentication/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce_app/features/athentication/screens/home/widgets/home_categories.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
//   final List<ProductModel> sampleProducts = [
//   ProductModel(
//     id: "1",
//     title: "Green Nike Air Shoes",
//     brand: "Nike",
//     imageUrl: TImages.productImage15,
//     price: 35.0,
//     discount: "25%",
//     isFav: true,
//   ),
//   ProductModel(
//     id: "2",
//     title: "Apple Watch Series 8",
//     brand: "Apple",
//     imageUrl: TImages.productImage17,
//     price: 299.0,
//   ),
//   ProductModel(
//     id: "3",
//     title: "Leather Handbag",
//     brand: "Gucci",
//     imageUrl: TImages.productImage18,
//     price: 120.0,
//     discount: "10%",
//   ),
//   ProductModel(
//     id: "4",
//     title: "Wireless Headphones",
//     brand: "Sony",
//     imageUrl: TImages.productImage19,
//     price: 89.0,
//     isFav: true,
//   ),
// ];


  @override
  Widget build(BuildContext context) {

    return    Scaffold(
     
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
               TPrimaryHeaderContainer(
                child: Column(
                children: [
                  
                                    THomeAppBar(),
                const SizedBox(
                  height: TSizes.spaceBetItems,
                ),
                  //searchbar
                const  TSearchContainer(text: '    Search in Store',),
                 const SizedBox(
                  height: TSizes.spaceBetItems,
                ),
                Padding(padding: EdgeInsetsGeometry.only(left: TSizes.defaultSpace,),
                child: Column(
                  children: [
                TSectionHeading(text: 'Popular Categories',showactionButton: false,textColour: TColors.textwhite,
                onPressed: ()=>Get.to(()=>const TAllProducts()),
                ),
                  const SizedBox(
                  height: TSizes.spaceBetItems,
                ),
               const THomeCategories(),
                 ],
                ),
                ),
                 SizedBox(height: TSizes.spaceBetSections,),


                  ]),
        ),
        Padding(
          padding:const EdgeInsetsGeometry.all(TSizes.defaultSpace),
          child: Column(children: [

           const  TPromoSlider(),
               const SizedBox(
                  height: TSizes.spaceBetSections,
                ),
//                 GridView.builder(
//   padding: const EdgeInsets.all(16),
//   itemCount: sampleProducts.length,
//   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2,
//     mainAxisSpacing: 16,
//     crossAxisSpacing: 16,
//     childAspectRatio: 0.68,
//   ),
//   itemBuilder: (context, index) {
//     return TProductCardVertical(product: sampleProducts[index]);
//   },
// )

                 TGridLayout(itemCount: 2, itemBuilder: (_ , index) =>const TProductCardVertical(),),          
                


             
             ]
             )
          
        ),
        
        ],
        ),
        ));
  }
}

