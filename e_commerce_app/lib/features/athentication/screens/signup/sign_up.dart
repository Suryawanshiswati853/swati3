import 'package:get/utils.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/texts.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/common/widgets.login_signup/form_divider.dart';
import 'package:e_commerce_app/common/widgets.login_signup/social_buttons.dart';
import 'package:e_commerce_app/features/athentication/screens/signup/widgets/signup_form.dart';
import 'package:e_commerce_app/features/athentication/screens/signup/widgets/terms_condition_checkbox.dart';

class signUpScreen extends StatelessWidget {
  const signUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
            
              Text(TText.signUpTitle,style: Theme.of(context).textTheme.headlineMedium,),

              const SizedBox(height: TSizes.spaceBetSections),
             
              TsignUpForm(),
 const SizedBox(height: TSizes.spaceBetSections),


  TFormDivider(dividerText: TText.orSignUpWith.capitalize!,),
const   SizedBox(height: TSizes.spaceBetSections),
const   TSocialButtons(),

]
))));  }
}

