

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getx_mvvm/res/colors/app_colors.dart';

class Roundbutton extends StatelessWidget{
    const Roundbutton({
      Key? key,
      this.buttonColor=AppColor.DarkBlueColor,
      this.textColor=AppColor.whitecolor,
    required  this.title,
   required this.onPress,
    this.height=40,
    this.width=70,
    this.loading=false

      }):super(key: key);
    final bool loading;
    final String title;
    final double height,width;
    final VoidCallback onPress;
    final Color textColor,buttonColor;
    

  @override
  Widget build(BuildContext context) {
    
    return InkWell( 
   onTap: onPress,
      
   child:  Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(50)
      ),
      child: loading?Center(child: CircularProgressIndicator())
      :
      Center(
        child:Text(title,style: Theme.of(context).textTheme.labelMedium!.copyWith(color:Colors.white ),) ,
      )
    ));
  }
  
}
