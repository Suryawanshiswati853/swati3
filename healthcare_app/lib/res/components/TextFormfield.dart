import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcare_app/res/components/constants.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType keyboardType;
  final IconData? prefixIconData;
  final Widget? suffixIcon;
  final Color? borderColor; 
  final Color? prefixColor; 
  final bool obscureText;
  final Color? hintTextColor; 
  final double? fontSize; 
  final String? fontFamily; 
    final Function(bool)? toggleVisibility; 
     final Color? fillColor; 
       final bool filled;
       final bool isPassword;
       final double? borderRadius;

 

  const TextFormFieldWidget({
    Key? key,
    required this.controller,
     this.labelText,
    this.hintText,
    this.contentPadding,
    this.keyboardType = TextInputType.text,
    this.prefixIconData,
    this.suffixIcon,
    this.borderColor, 
    this.obscureText = false,
    this.fontSize,
    this.hintTextColor,
    this.fontFamily,
     this.toggleVisibility,
     this.fillColor,
     this.filled=false,
     this.isPassword=false,
     this.prefixColor,
      this.borderRadius,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius!),
    border: Border.all(color: BorderColour),
    // Add border color here
  ),
  child:TextFormField(
       controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: labelText,
        hintText: hintText,
         hintStyle: TextStyle(
          color: hintTextColor,
          fontSize: fontSize,
          fontFamily: fontFamily,
          
        ),      
        fillColor: fillColor,
        filled: filled,
        
        
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        prefixIcon: prefixIconData != null ? Icon(prefixIconData) : null,
       
         suffixIconConstraints: const BoxConstraints(minWidth: 40),
          suffixIcon:isPassword ? IconButton(
         icon: Icon(
                obscureText ? Icons.visibility_off_sharp : Icons.visibility,
              ),          onPressed: () {
            if (toggleVisibility != null) {
              toggleVisibility!(!obscureText);
            }
          },
        ): null,
      
     
       ),
      
      
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the $hintText';
        }
        return null;
      },
      keyboardType: keyboardType,
      inputFormatters: [LengthLimitingTextInputFormatter(50)],
      textAlignVertical: TextAlignVertical.center,
      obscureText: obscureText,
    ));
  }
}



