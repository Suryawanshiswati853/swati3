import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/components/round_button.dart';
import '../view_model/controller/login/login_view_model.dart';

class LoginButtonWidget extends StatelessWidget {
final formkey;
   LoginButtonWidget({super.key,required this.formkey});
      final loginvm=Get.put(LoginViewModel());



  @override
  Widget build(BuildContext context) {
    return   Obx(() =>   Roundbutton(
              width:200,
              title: 'login'.tr,
              loading: loginvm.loading.value,
              onPress: (){
              if(formkey.currentState!.validate()){
                loginvm.loginApi();
              }
            },));
  }
}
