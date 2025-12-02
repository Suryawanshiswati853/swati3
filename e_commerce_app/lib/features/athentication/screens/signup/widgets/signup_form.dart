import '../sign_up.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/texts.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/features/athentication/screens/signup/verify_email.dart';
import 'package:e_commerce_app/features/athentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce_app/features/athentication/screens/signup/widgets/terms_condition_checkbox.dart';







class TsignUpForm extends StatelessWidget {
  const TsignUpForm({
    super.key,
   });



  @override
  Widget build(BuildContext context) {
    final controller=Get.put(SignupController());
final dark=THelpersFunction.isDarkMode(context);

    return Form(
      key: controller.signupFormkey,
      child: Column(
        children: [
          Row(
  children: [
    Expanded(
      child: TextFormField(
        controller: controller.firstName,
        maxLines: 1,
        keyboardType: TextInputType.name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
          labelText: "First Name",
          prefixIcon: Icon(Iconsax.user),
          helperText: " ", 
          errorMaxLines: 1,
          floatingLabelBehavior: FloatingLabelBehavior.always, 
        ),
        validator: (value) =>
            TValidator.validatemptyfiled('First Name', value),
      ),
    ),
    const SizedBox(width: TSizes.spaceBetInputFields),
    Expanded(
      child: TextFormField(
        controller: controller.lastName,
        maxLines: 1,
        keyboardType: TextInputType.name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
          labelText: "Last Name",
          prefixIcon: Icon(Iconsax.user),
          helperText: " ", 
          errorMaxLines: 1,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        validator: (value) =>
            TValidator.validatemptyfiled('Last name', value),
      ),
    ),
  ],
),

          // Row(
          //   children: [
          //       Expanded(
                
          //         child:  TextFormField(
          //             maxLines: 1,
                   
          //           keyboardType: TextInputType.name,
          //           autovalidateMode: AutovalidateMode.onUserInteraction,

                    
          //           controller: controller.firstName,
          //          // expands: false,
          //                               decoration: InputDecoration(
          //                                 helperText: " ",
                                          
                                          
          //                                 labelText: TText.firstName,
          //                                 prefixIcon: Icon(Iconsax.user),
          //                                 helperStyle: TextStyle(height: 0),
                                         
                                          
          //                               ),
          //                               validator: (value)=> TValidator.validatemptyfiled('First Name',value),
                                        
                  
          //                             ),
          //       ),
                
          //         const SizedBox(width: TSizes.spaceBetInputFields),
          //  Expanded(
          //         child:   TextFormField(
          //          maxLines: 1,
                   
                    
          //           keyboardType: TextInputType.name,
          //           autovalidateMode: AutovalidateMode.onUserInteraction,
          //           controller: controller.lastName,
          //                               decoration: InputDecoration(
          //                                 helperText: " ",
                                          
          //                                 labelText: TText.lastName,
          //                                 prefixIcon: Icon(Iconsax.user),
          //                                 helperStyle: TextStyle(height: 0),
                                         
                                          
          //                               ),
          //                                   validator: (value)=> TValidator.validatemptyfiled('Last name',value),

                  
          //                             ),
          //       ),
    
          //  ]
          // ),
          const SizedBox(height: TSizes.spaceBetInputFields),
          TextFormField(
            maxLines: 1,
            keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
            
            controller: controller.userName,
                                        decoration: InputDecoration(
                                           helperText: " ", 
          errorMaxLines: 1,
          floatingLabelBehavior: FloatingLabelBehavior.always,
                                          
                                          labelText: TText.username,
                                          prefixIcon: Icon(Iconsax.user_edit),
                                         
                                          
                                        ),
                                     validator: (value)=> TValidator.validatemptyfiled('Username',value),

          ),
          const SizedBox(height: TSizes.spaceBetInputFields),
          TextFormField(
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.email,

                    expands: false,
                                        decoration: InputDecoration(
                                           helperText: " ", 
          errorMaxLines: 1,
          floatingLabelBehavior: FloatingLabelBehavior.always,
                                          
                                          labelText: TText.email,
                                          prefixIcon: Icon(Iconsax.direct),
                                         
                                          
                                        ),
                                        validator: (value)=> TValidator.validateEmail(value),
                                         
                                        
          ),
          const SizedBox(height: TSizes.spaceBetInputFields),
          TextFormField(
            maxLines: 1,
            keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    inputFormatters: [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(10),   
  ],
            
                        controller: controller.phoneNumber,

                    expands: false,
                                        decoration: InputDecoration(
                                           helperText: " ", 
          errorMaxLines: 1,
          floatingLabelBehavior: FloatingLabelBehavior.always,
                                          
                                          labelText: TText.phoneNo,
                                          prefixIcon: Icon(Iconsax.call),
                                         
                                          
                                        ),
                                           validator: (value)=> TValidator.validatePhoneNumber(value),

          ),
          const SizedBox(height: TSizes.spaceBetInputFields),
          Obx(
            ()=> TextFormField(
              maxLines: 1,
                 autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: controller.hidePassword.value,
              
                          controller: controller.password,
            
                      expands: false,
                                          decoration: InputDecoration(
                                             helperText: " ", 
          errorMaxLines: 1,
          floatingLabelBehavior: FloatingLabelBehavior.always,
                                            
                                            labelText: TText.password,
                                            prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: ()=>controller.hidePassword.value=!controller.hidePassword.value,
                   icon: Icon(controller.hidePassword.value?Iconsax.eye_slash:Iconsax.eye))
                                           // suffixIcon: Icon(Iconsax.eye_slash),
            
                                           
                                            
                                          ),
                              validator: (value)=> TValidator.validatePassword(value),

            ),
          ),
                              const SizedBox(height: TSizes.spaceBetSections),
                           const   TermsConditionCheckbox(),
                             
                            const    SizedBox(height: TSizes.spaceBetSections),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: (){
                                    controller.signUp();
                                    //Get.to(( const emailVerifyScreen()));
                                  },
                                  child:  const Text(TText.createAccount)
                                )
                              )
    
    
    ]
    
    
    )
    );
  }
}