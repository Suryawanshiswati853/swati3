import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/texts.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:e_commerce_app/features/athentication/screens/password_configration/reset_password.dart';
import 'package:e_commerce_app/features/athentication/controllers/forgot_password/forgot_password_controller.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ForgotPasswordController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
        ],
      
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
           // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(TText.forgotPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBetItems),            
              Text(TText.forgotPasswordSubtitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBetItems*2), 
              Form(
                key: controller.forgotPasswordformKey,
                child: TextFormField(
                  
                  controller: controller.email,
                  validator: TValidator.validateEmail,
                  decoration: const InputDecoration(labelText: TText.email,prefixIcon: Icon(Iconsax.direct_right)),)) ,
                 const SizedBox(height: TSizes.spaceBetSections),  
                   SizedBox(
            width: double.infinity,
        child:   ElevatedButton(onPressed: ()=>controller.sendPasswordResetEmail(), child: Text(TText.submit))),          
          



            ])
            ))
            );
  }
}
