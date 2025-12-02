import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/utils/constants/texts.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/features/athentication/screens/login/login.dart';
import 'package:e_commerce_app/features/athentication/controllers/forgot_password/forgot_password_controller.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=>Get.back(), icon:const Icon(CupertinoIcons.clear))
        ],
      
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(image: AssetImage(TImages.forgot),width: THelpersFunction.screenWidth()*0.6),
               const SizedBox(height: TSizes.spaceBetSections),
               Text(email,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),

               const SizedBox(height: TSizes.spaceBetItems),
               Text(TText.chnageYourPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBetItems),            
              Text(TText.chnageYourPasswordTitleSubtitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBetItems*2), 
              TextFormField(decoration: const InputDecoration(labelText: TText.email,prefixIcon: Icon(Iconsax.direct_right)),) ,
                 const SizedBox(height: TSizes.spaceBetSections),  
                   SizedBox(
            width: double.infinity,
        child:   ElevatedButton(onPressed: ()=>Get.offAll(()=> const Loginscreen()), child: Text(TText.done))), 
                      const SizedBox(height: TSizes.spaceBetItems), 
                       SizedBox(
            width: double.infinity,
        child:   TextButton(onPressed: ()=>ForgotPasswordController.instance.resendPasswordResetEmail(email), child: Text(TText.resendEmail))),
         
           ])
            ))
            );
  }
}
