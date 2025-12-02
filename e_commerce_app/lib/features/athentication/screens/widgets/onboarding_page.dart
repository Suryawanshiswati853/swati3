import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';

class onBoardingPage extends StatelessWidget {
const   onBoardingPage({super.key,required this.image, required this.title, required this.subTitle});
  final String image,title,subTitle;

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return 
              Padding(padding: const  EdgeInsetsGeometry.all(TSizes.defaultSpace),
             child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                children: [
                
       Image.asset(
  image,
  width:size.width * 0.8,
  height:size.height * 0.6,
  fit: BoxFit.contain,
  errorBuilder: (context, error, stackTrace) {
    return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
  },
),
          const SizedBox(height: TSizes.spaceBetItems),



                  //  Image(
                  //   width: THelpersFunction.screenWidth()*0.8,
                  //   height: THelpersFunction.screenHeight()*0.6,
                  //   image:  AssetImage(image),
                  //   fit: BoxFit.contain,
                    
                  //   ), 
                 //  ),
                    Text(title,
                    style:Theme.of(context).textTheme.headlineMedium,
                    textAlign:TextAlign.center),
                 const   SizedBox(
                      height: TSizes.spaceBetItems,
                    ),  
                    Text(subTitle,
                    style:Theme.of(context).textTheme.bodyMedium,
                    textAlign:TextAlign.center),
                ],
               

              )

          );
          
        
      
  }
}