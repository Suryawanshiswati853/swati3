import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/texts.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';

class ReAuthloginform  extends StatelessWidget {
 ReAuthloginform({super.key});

    @override
    Widget build(BuildContext context) {
             final controller=UserController.instance;
 return Scaffold(
        appBar: TAppBar(
            title: const Text('Re-Authenticate'),
            showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
             child: Form(
            key: controller.reAuthformKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              TextFormField(
              controller: controller.verifyEmail,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TText.email
              ),
              validator: (value)=>TValidator.validateEmail(value),
            ),
             SizedBox(
            height:   TSizes.spaceBetInputFields
            ),
             Obx(
            ()=> TextFormField(
            //  maxLines: 1,
                 autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: controller.hidePassword.value,
              
                          controller: controller.verifyPassword,
            
                    //  expands: false,
                                          decoration: InputDecoration(
          //                                
                                            
                                            labelText: TText.password,
                                            prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: ()=>controller.hidePassword.value=!controller.hidePassword.value,
                   icon: Icon(controller.hidePassword.value?Iconsax.eye_slash:Iconsax.eye))
            
                                           
                                            
                                          ),
                              validator: (value)=> TValidator.validatePassword(value),

            ),
          ),
                const SizedBox(height: TSizes.spaceBetSections,),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                    onPressed: ()=> controller.reAuthenticate(),
                    
                       
                    child:const Text('Verify'),
                    ),
                ),
                ],
            ),
            ),
           ),
        ));
    }


}