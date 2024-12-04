

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/colors/app_colors.dart';



class GeneralExceptionWidget extends StatefulWidget{
  final VoidCallback onPress;
  const GeneralExceptionWidget({Key? key, required this.onPress}):super(key: key);
  _GeneralExceptionWidgetState createState()=> _GeneralExceptionWidgetState();
}
  class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget>{

 
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
        height: height * 0.15,
      ),
          Icon(Icons.cloud_off,color: AppColor.Redcolor,size: 40,),
          Padding(padding: EdgeInsets.only(top: 30),
       child:  Center(
         
    child:   Text("general_exception".tr,textAlign: TextAlign.center,),
    
         ) 
      ),
      SizedBox(
        height: height * 0.15,
      ),
      InkWell(
        onTap: widget.onPress,
     child: Container(
        height: 30,
        width: 160,
        decoration: BoxDecoration(
        color: AppColor.Pinkcolor,
        borderRadius: BorderRadius.circular(15)

        ),
        child: Center(
          child: Text("Retry",style: Theme.of(context).textTheme.labelMedium!.copyWith(color:Colors.white ),),
        ),
      )
      )],
      ),
    );
  }
  }