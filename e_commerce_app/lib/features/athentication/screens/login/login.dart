import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import '../../../../utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/utils/constants/texts.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/common/styles/spacing_styles.dart';
import 'package:e_commerce_app/common/widgets.login_signup/form_divider.dart';
import 'package:e_commerce_app/common/widgets.login_signup/social_buttons.dart';
import 'package:e_commerce_app/features/athentication/screens/login/widgets/login_form.dart';
import 'package:e_commerce_app/features/athentication/controllers/login/login_controller.dart';
import 'package:e_commerce_app/features/athentication/screens/login/widgets/login_header.dart';



class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
        final dark=THelpersFunction.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: TSpacingstyle.paddingWithppbar,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            TLoginHeader(),
            Form(child: loginForm(),),
            TFormDivider(dividerText: TText.orSignInWith.capitalize!),
              SizedBox(
                  height: TSizes.spaceBetSections
                  ),
             TSocialButtons()
            
            ],
          ),
        ),
      ),
    );
  }
}

