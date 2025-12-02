import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/features/shop/screens/sub_categories.dart/sub_categories.dart';

class Category {
  final String image;
  final String title;
  final VoidCallback onTap;
//  final Color iconColor;

  Category({required this.image, required this.title, required this.onTap, 
  });   //this.iconColor = TColors.black,

}

final List<Category> categories = [
  Category(image: TImages.shoeIcon, title: "Shoes", onTap: () {
    Get.to(()=>SubCategories());
    }),
  Category(image: TImages.clothIcon, title: "Clothes", onTap: () {  }),
  Category(image: TImages.animalIcon, title: "Animal", onTap: () { }),
  Category(image: TImages.sportIcon, title: "Sport", onTap: () {  }),
  Category(image: TImages.cosmaticIcon, title: "Cosmatic", onTap: () {  }),
  Category(image: TImages.furnitureIcon, title: "Furniture", onTap: () {  }),
  Category(image: TImages.toyIcon, title: "Toy", onTap: () {  }),
  Category(image: TImages.electronicIcon, title: "Electronic", onTap: () { }),
  Category(image: TImages.jewelleryIcon, title: "Jewellery", onTap:(){ }),
];

