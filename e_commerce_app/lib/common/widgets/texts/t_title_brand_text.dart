import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key, this.color, 
    required this.title,
     this.textAlign=TextAlign.center, 
      this.brandTextSize=TextSizes.small,  this.maxLine=1,
  });
  final Color? color;
  final String title;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  final int maxLine;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: brandTextSize==TextSizes.small?
      Theme.of(context).textTheme.labelMedium!.apply(color: color): brandTextSize==TextSizes.medium?
      Theme.of(context).textTheme.bodyLarge!.apply(color: color): brandTextSize==TextSizes.large?
      Theme.of(context).textTheme.titleLarge!.apply(color: color):
      Theme.of(context).textTheme.bodyMedium!.apply(color: color),
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}

