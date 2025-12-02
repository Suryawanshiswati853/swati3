import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';


class TcirularContainer extends StatelessWidget {
  const TcirularContainer({
    super.key,
    this.child,
    this.margin,
    this.width=400,
    this.height=400,
    this.radius=400,
    this.padding=0,
    this.backgroundColor=TColors.light
  });
  final double? width;
   final double? height;
    final double? radius;
    final double padding;
        final EdgeInsets? margin;

    final Widget? child;
    final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return 
          Container(
            width: width,
            height: height,
             margin: margin,
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius!),
              color: backgroundColor,
            ),
            child: child,
    
          
            // Container(
            // width: 400,
            // height: 400,
            // padding: EdgeInsets.all(0),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(400),
            //   color: TColors.textwhite.withOpacity(0.1),
            // ),
    
          //),
        
      );
    
  }
}
