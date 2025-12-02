import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/texts.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';


class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
   
  });

  

  @override
  Widget build(BuildContext context) {
        final dark=THelpersFunction.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? TImages.lightAppLogo:TImages.darkAppLogo),
          ),
          Text(TText.loginTitle,style: Theme.of(context).textTheme.headlineMedium,),
          SizedBox(height: TSizes.sm,),
        Text(TText.loginSubtitle,style: Theme.of(context).textTheme.bodyMedium,),

      ],
    );
  }
}
