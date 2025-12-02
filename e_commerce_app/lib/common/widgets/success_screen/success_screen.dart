import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce_app/utils/constants/texts.dart';
import 'package:e_commerce_app/common/styles/spacing_styles.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';


class successScreen extends StatelessWidget {
  const successScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});
  final String image,title,subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingstyle.paddingWithppbar*2,
           
              child:  Column(
                children: [
                    Image(image: AssetImage(image),width: THelpersFunction.screenWidth()*0.6),
               const SizedBox(height: TSizes.spaceBetSections),

              /// Title
            
              Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),

              const SizedBox(height: TSizes.spaceBetItems),

              /// Title
            
              Text(subTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
                            const SizedBox(height: TSizes.spaceBetSections),
                             SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: onPressed,
                                    
                                  
                                  child:  const Text(TText.tContinue)
                                )
                              ),

                ],
              ),
            ),
         
        ),
      
    );
  }
  
}