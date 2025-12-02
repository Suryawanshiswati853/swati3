import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/common/widgets/tabbar/tabbar.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/brands/brand_card.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/common/widgets/brands/brand_show_case.dart';
import 'package:e_commerce_app/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce_app/common/widgets/texts/t_title_brand_text.dart';
import 'package:e_commerce_app/features/shop/controllers/category_controller.dart';
import 'package:e_commerce_app/common/widgets/texts/t_brand_titlewith_button.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/search_container.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_commerce_app/common/widgets/products/cart/widgets/cart_menu_icon.dart';
class StoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Obx(() {
     // final category = controller.featuresCategories;

      if (controller.categories.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
            final category = controller.categories;


      return DefaultTabController(
        length: category.length,
        child: Scaffold(
          appBar: TAppBar(
            title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
            actions: [
              TcardCounterIcon(
                onPressed: () {},
              ),
            ],
          ),
          body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  toolbarHeight: 0,
                  backgroundColor: THelpersFunction.isDarkMode(context)
                      ? TColors.black
                      : TColors.light,
                  expandedHeight: 430,
                  flexibleSpace: Padding(
                    padding: EdgeInsets.all(TSizes.sm),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: TSizes.spaceBetItems),
                        const TSearchContainer(
                          text: 'Search in Store',
                          showborder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: TSizes.spaceBetSections),
                        TSectionHeading(
                          text: 'Features Brands',
                          showactionButton: true,
                          onPressed: () {},
                        ),
                        const SizedBox(height: TSizes.spaceBetSections / 1.5),
                        TGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return TBrandCard(showBorder: false);
                          },
                        ),
                      ],
                    ),
                  ),
                  bottom: TTabbar(
                    tabs: category.map((cat) => Tab(text: cat.name)).toList(),

                    // tabs: category
                    //     .map((cat) => Tab(child: Text(cat.name)))
                    //     .toList(),
                  ),
                ),
              ];
            },
            body: TabBarView(
                       //   children: category.map((cat) => categoryTab(category: cat)).toList(),

              children: category
                  .map((cat) => CategoryTab(category: cat))
                  .toList(),
            ),
          ),
        ),
      );
    });
  }
  Widget categoryTab({required CategoryModel category}) {
  return Center(
    child: Column(
      children: [
        if (category.image != null && category.image.isNotEmpty)
          Image.network(category.image, height: 100, width: 100),
        Text(category.name, style: TextStyle(fontSize: 20)),
      ],
    ),
  );
}

}


// class StoreScreen  extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     final category=CategoryController.instance.featuresCategories;
//     return Obx(() {
//   if (category.isEmpty) {
//     return const Center(child: CircularProgressIndicator());
//   }
//      DefaultTabController(
//       length: category.length,
//     child:   Scaffold(
//         appBar: TAppBar(
//           title: Text('Store',style:Theme.of(context).textTheme.headlineMedium),
//           actions: [
//             TcardCounterIcon(onPressed: (){
      
//             },)
//           ],
//         ),
//         body: NestedScrollView(headerSliverBuilder: (_,innerBoxIsScrolled){
//           return [
//             SliverAppBar(
//               automaticallyImplyLeading: false,
//               pinned: true,
//               floating: true,
//               toolbarHeight: 0,
//               backgroundColor: THelpersFunction.isDarkMode(context)?TColors.black:TColors.light,
//              expandedHeight: 430,
//              flexibleSpace: Padding(padding: EdgeInsetsGeometry.all(TSizes.sm),
//               child:
//               ListView(
//               shrinkWrap: true,
        
//               physics:const  NeverScrollableScrollPhysics(
      
//               ),
//               children: [
//                 const SizedBox(height: TSizes.spaceBetItems,),
//                const TSearchContainer(text: 'Search in Store',showborder: true,showBackground: false,padding: EdgeInsets.zero,),
//                const SizedBox(height: TSizes.spaceBetSections),
//                 TSectionHeading(text: 'Features Brands',showactionButton: true,onPressed: (){},),
//                const SizedBox(height: TSizes.spaceBetSections/1.5),
//                TGridLayout(itemCount: 4,mainAxisExtent: 80, itemBuilder: (_,index){
//               return    TBrandCard(showBorder: false,);
//                }
            
//              )])
//         ),
//           bottom:              TTabbar(
              
              
//               tabs: category.map((category) => Tab(child: Text(category.name))).toList(),
//               // [
//               //   // Tab(child: Text('sports'),),
//               //   // Tab(child: Text('Furtiture'),),
            
//               //   // Tab(child: Text('Electronic'),),
            
//               //   // Tab(child: Text('Clothes'),),
            
//               //   // Tab(child: Text('Cosmetics'),)
            
            
            
//               //  ],
//                ),
//           ),
        
//         ];
//         },
//          body:  TabBarView(children: 
//           category.map((category) => categoryTab(category:category)).toList(),
//         //  categoryTab(),
//         //    categoryTab(),
//         //      categoryTab(),
//         //       categoryTab(),
//         //       categoryTab(),
              
//       ),
//     )));
//   });

// }
// }



