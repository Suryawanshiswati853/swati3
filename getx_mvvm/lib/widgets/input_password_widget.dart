

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import '../view_model/controller/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {

   InputPasswordWidget({super.key});
   final loginvm=Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
              controller: loginvm.passwordController.value,
            focusNode: loginvm.passwordFocusNode.value,
            obscureText: true,
              validator: (value){
                if(value!.isEmpty){
                  Utils.SnackBar('Password', 'enter password');

                }

              },
              // onFieldSubmitted: (value){
              //    if(value!.isEmpty){
              //     Utils.fieldFocusChange(context,loginvm.emailFocusNode.value,loginvm.passwordFocusNode.value);

              //   } 
              // },

              decoration: InputDecoration(
                hintText: 'pass_hint'.tr,
                border: OutlineInputBorder(),
                
              ),
             
              
              
      
            );            
            
  }

  }
