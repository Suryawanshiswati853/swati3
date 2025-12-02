import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/common/widgets/images/rounded_images.dart';
import 'package:e_commerce_app/common/widgets/products/product/product_card_horizontal.dart';


class SubCategories extends StatelessWidget {
  const SubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Sports'),showBackArrow: true,),
      body: SingleChildScrollView(
        child:Padding(padding: EdgeInsetsGeometry.all(TSizes.defaultSpace),child: Column(
          children: [
           TRoundedWidget(imageUrl: TImages.banner4,width: double.infinity,applyImageRadius: true,),
           const SizedBox(height: TSizes.spaceBetSections,),
           Column(
            children: [
              TSectionHeading(text: 'Sports Shirts',onPressed: (){},),
              const SizedBox(height: TSizes.spaceBetItems/2,),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: TSizes.spaceBetItems,),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,_) => const TProductCardHorizontal()
                  ),
              )

            ],
           )
          ],
        ),
      ),

    ));
  }
}