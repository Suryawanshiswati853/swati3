import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/constants.dart';


class SimpleAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Widget? trailingIcon;
  final Color titleColor;
  final double elevation;
  final String fontFamily;
   final FontWeight? fontWeight; 
   final IconData? leadingIcon;
     final Color? leadingIconColor; 
     final VoidCallback? leadingIconOnPressed;

  const SimpleAppBar({
    Key? key,
    required this.title,
     this.trailingIcon, 
    this.actions,
    this.backgroundColor = whiteColour,
    this.titleColor = blackColour,
    this.elevation = 4.0,
    this.fontFamily = 'Poppins', 
    this.fontWeight,
    this.leadingIcon,
    this.leadingIconColor,
    this.leadingIconOnPressed,  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
    color: backgroundColor,
          padding: EdgeInsets.only(top: 10,),

      // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.bottom),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          IconButton(
            icon: Icon(leadingIcon),
            color: leadingIconColor,
            onPressed: leadingIconOnPressed,
          ),
          const SizedBox(width: 60),
          Center(
        child:   Text(
            title,
            
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: fontFamily
            ),
        ),
    )]));
  }
 
}

 

  


