import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import '../../../../../utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/features/athentication/controllers/signup/signup_controller.dart';

class TermsConditionCheckbox extends StatelessWidget {
  const TermsConditionCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(SignupController());
    final dark = THelpersFunction.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(() =>
             Checkbox
          (value:controller. privacyPolicy.value, onChanged: (value)=>controller. privacyPolicy.value=!controller. privacyPolicy.value),
        ),
        ),

       // SizedBox(width: TSizes.lg),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${TText.iAgreeTo}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: '${TText.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.light : TColors.primaryColour,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: ' ${TText.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: TText.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.light : TColors.primaryColour,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
