

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import '../view_model/controller/login/login_view_model.dart';

class InputEmailWidget extends StatelessWidget {

   InputEmailWidget({super.key});
   final loginvm=Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
              controller: loginvm.emailController.value,
            focusNode: loginvm.emailFocusNode.value,
              validator: (value){
                if(value!.isEmpty){
                  Utils.SnackBar('Email', 'enter email');

                }

              },
              onFieldSubmitted: (value){
                 if(value!.isEmpty){
                  Utils.fieldFocusChange(context,loginvm.emailFocusNode.value,loginvm.passwordFocusNode.value);

                } 
              },

              decoration: InputDecoration(
                hintText: 'email_hint'.tr,
                border: OutlineInputBorder(),
                
              ),
             
              
              
      
            );
            
            
  }

  }
