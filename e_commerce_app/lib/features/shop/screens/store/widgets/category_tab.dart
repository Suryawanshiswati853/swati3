import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/common/widgets/brands/brand_show_case.dart';
import 'package:e_commerce_app/common/widgets/products/model/product_model.dart';
import 'package:e_commerce_app/common/widgets/products/product/product_card_vertical.dart';
// class CategoryTab extends StatelessWidget {
//   final CategoryModel category;
//   // final List<ProductModel> products; // pass filtered products

//   CategoryTab({Key? key, required this.category,}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       shrinkWrap: true,
//       physics: const AlwaysScrollableScrollPhysics(),
//       children: [
//         Padding(
//           padding: EdgeInsets.all(TSizes.defaultSpace),
//           child: Column(
//             children: [
//               // Show category image
//               if (category.image != null && category.image!.isNotEmpty)
//                 TBrandShowcase(images: [category.image!]),

//               const SizedBox(height: TSizes.spaceBetItems),

//               // Section heading
//               TSectionHeading(text: 'You might Like', onPressed: () {}),

//               const SizedBox(height: TSizes.spaceBetItems),

//               // Grid of products
//               // TGridLayout(
//               //   itemCount: products.length,
//               //   itemBuilder: (_, index) => TProductCardVertical(product: products[index]),
//               // ),

//               const SizedBox(height: TSizes.spaceBetSections),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }


class CategoryTab extends StatelessWidget{
   CategoryTab({super.key, required this.category});
  final CategoryModel category;
  final List<ProductModel> sampleProducts = [
  ProductModel(
    id: "1",
    title: "Green Nike Air Shoes",
    brand: "Nike",
    imageUrl: TImages.productImage15,
    price: 35.0,
    discount: "25%",
    isFav: true,
  ),
  ProductModel(
    id: "2",
    title: "Apple Watch Series 8",
    brand: "Apple",
    imageUrl: TImages.productImage17,
    price: 299.0,
  ),
  ProductModel(
    id: "3",
    title: "Leather Handbag",
    brand: "Gucci",
    imageUrl: TImages.productImage18,
    price: 120.0,
    discount: "10%",
  ),
  ProductModel(
    id: "4",
    title: "Wireless Headphones",
    brand: "Sony",
    imageUrl: TImages.productImage19,
    price: 89.0,
    isFav: true,
  ),
];


  @override
  Widget build(BuildContext context) {
   return ListView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: [
      Padding(padding: EdgeInsetsGeometry.all(TSizes.defaultSpace),
            child: Column(
              children: [
              TBrandShowcase(images: [TImages.productImage3,TImages.productImage2,TImages.productImage1,]),
             // TBrandShowcase(images: [TImages.productImage4,TImages.productImage5,TImages.productImage15,]),

               const SizedBox(height: TSizes.spaceBetItems,),
              TSectionHeading(text: 'You might Like',onPressed: (){},),
              const SizedBox(height: TSizes.spaceBetItems,),
//               GridView.builder(
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
// ),

               TGridLayout(itemCount: 4, itemBuilder: (_,index)=>const TProductCardVertical()),
                const SizedBox(height: TSizes.spaceBetSections,),

          ],)
          ),
   ]);
  }

}