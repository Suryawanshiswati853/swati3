import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce_app/common/widgets/products/product/ratings/rating_bar_indicator.dart';

class UserReviewCard  extends StatelessWidget{
  const UserReviewCard({super.key});

 
  
  @override
  Widget build(BuildContext context) {
    final dark=THelpersFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(

                  backgroundImage: AssetImage(TImages.user2),
                ),
               const  SizedBox(width:TSizes.spaceBetItems),
                Text('Swati S.',style: Theme.of(context).textTheme.titleLarge),
                
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: dark?Colors.white:Colors.black,))
          ],
        ),
      const  SizedBox(height: TSizes.spaceBetItems,),
        Row(
          children: [
          const  TRatingBarIndicator(rating: 4.0),
         const  SizedBox(width: TSizes.spaceBetItems,),

            Text('13 sep 2025',style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
       const  SizedBox(height: TSizes.spaceBetItems,),
       ReadMoreText('te user interface of app is quite intuitive and user-friendly, making it easy to navigate through different sections and find desired products. The app provides a seamless browsing experience with smooth transitions and quick loading times. The product images are clear and visually appealing, allowing users to get a good look at the items they are interested in. Additionally, the app offers detailed product descriptions, specifications, and customer reviews, which help users make informed purchasing decisions. The checkout process is straightforward and secure, with multiple payment options available. Overall, the app provides a convenient and enjoyable shopping experience for users.',
       trimLines: 2,
       trimMode: TrimMode.Line,
       trimExpandedText: ' show less',
        trimCollapsedText: ' show more',
        moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primaryColour),
        lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primaryColour),
       ),
              const  SizedBox(height: TSizes.spaceBetItems,),
TRoundedContainer(
  backgroundColor: dark?TColors.darkergrey:TColors.grey,
  child: Padding(
    padding: const EdgeInsets.all(TSizes.md),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text("I's Store",style: Theme.of(context).textTheme.titleMedium,),
          Text("12 sep 2025",style: Theme.of(context).textTheme.bodyMedium,),
          


        //     Icon(Icons.thumb_up_alt_outlined,color: dark?Colors.white:Colors.black,),
        //  const  SizedBox(width: TSizes.spaceBetItems,),
        //     Icon(Icons.thumb_down_alt_outlined,color: dark?Colors.white:Colors.black,),
          ],
        ),
         const  SizedBox(height: TSizes.spaceBetItems,),
       ReadMoreText('te user interface of app is quite intuitive and user-friendly, making it easy to navigate through different sections and find desired products. The app provides a seamless browsing experience with smooth transitions and quick loading times. The product images are clear and visually appealing, allowing users to get a good look at the items they are interested in. Additionally, the app offers detailed product descriptions, specifications, and customer reviews, which help users make informed purchasing decisions. The checkout process is straightforward and secure, with multiple payment options available. Overall, the app provides a convenient and enjoyable shopping experience for users.',
       trimLines: 2,
       trimMode: TrimMode.Line,
       trimExpandedText: ' show less',
        trimCollapsedText: ' show more',
        moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primaryColour),
        lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primaryColour),
       ),
      ],
    ),
  ),
),
         const  SizedBox(height: TSizes.spaceBetSections,),

       
      ],

    );
  }
}