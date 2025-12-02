import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/texts.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import '../../../controllers/login/login_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:e_commerce_app/features/athentication/screens/signup/sign_up.dart';
import 'package:e_commerce_app/features/athentication/screens/password_configration/forgot_password.dart';



class loginForm extends StatelessWidget {
  const loginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        final controller=Get.put(LoginController());

    return Form(
      key: controller.loginformKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:TSizes.spaceBetSections ),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
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
              
                          controller: controller.password,
            
                    //  expands: false,
                                          decoration: InputDecoration(
          //                                    helperText: " ", 
          // errorMaxLines: 1,
          // floatingLabelBehavior: FloatingLabelBehavior.always,
                                            
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
             SizedBox(
            height:   TSizes.spaceBetInputFields/2
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(()=> Checkbox(value: controller.remeberMe.value, onChanged: (value)=>controller.remeberMe.value=!controller.remeberMe.value)),
                    const Text(TText.rememberMe),
                  ],
                ),
                TextButton(onPressed: ()=>Get.to(()=>const ForgotPassword()), child: Text(TText.forgotPassword))
              ],
            ), SizedBox(
            height:   TSizes.spaceBetInputFields
            ),
            SizedBox(
              width: double.infinity,
          child:   ElevatedButton(onPressed: ()=>controller.emailandPasswordSignIn(), child: Text(TText.signIn))),
           SizedBox(
            height:   TSizes.spaceBetItems
            ),
            SizedBox(
              width: double.infinity,
          child:   OutlinedButton(onPressed: (){
            Get.to(( const signUpScreen()));
          }, child: Text(TText.createAccount))),
        
        
          ],
        ),
      ),
    );
  }
}