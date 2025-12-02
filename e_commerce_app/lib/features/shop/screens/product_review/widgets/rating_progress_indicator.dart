import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key, required this.text, required this.value,
   
  });
  final String text;
  final double value;


  @override
  Widget build(BuildContext context) {
    final isdark=THelpersFunction.isDarkMode(context);
    return Row(
      children: [
        Expanded(flex:1, child: Text(text,style: Theme.of(context).textTheme.bodyMedium)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: TDeviceUtils.getScreenwidth(context)*0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: isdark?Colors.grey.shade800:Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation(TColors.primaryColour),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        )
      ],
    );
  }
}