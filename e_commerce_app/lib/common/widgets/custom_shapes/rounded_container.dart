import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';

class TRoundedContainer extends StatelessWidget{
  const TRoundedContainer(
    {
      super.key,
    this.child,
    this.width,
    this.height,
      this.padding,
      this.margin,
      this.radius=TSizes.cardRadiusMd,
      this.showBorder=false, 
      this.borderColor=TColors.borderPrimary,  this.backgroundColor=TColors.light,
    
   
    }

  );
  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;


  @override
  Widget build(BuildContext context) {
    return  Container(
            width: width,
            height: height,
             margin: margin,
            padding:padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: backgroundColor,

              border: showBorder?Border.all(color: borderColor):null,
            ),
            child: child,
  );}
  
}