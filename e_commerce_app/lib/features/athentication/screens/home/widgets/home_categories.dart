import 'package:get/get.dart';
import '../model/category.dart';
import 'package:flutter/material.dart';
import '../../../../shop/controllers/category_controller.dart';
import '../../../../../common/widgets/shimmer/Tcategory_shimmer.dart';
import 'package:e_commerce_app/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:e_commerce_app/features/shop/screens/sub_categories.dart/sub_categories.dart';



class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController=Get.put(CategoryController());
    return Obx((){ 
      if(categoryController.categoryLoading.value) return const TcategoryShimmer();
      if(categoryController.categories.isEmpty)
       return  Center(child: Text('No Categories Found',style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),));
      
       return   SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount:categoryController.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.categories[index];
            return TVerticalImageText(
              image: category.image,
              title: category.name,
              onTap:()=>Get.to(SubCategories()),
            );
            
        
          },
        
        ),
      );

      }
      
    );
  }
}

