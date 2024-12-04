
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/utils/utils.dart';

import '../../../repository/login_repository/login_repository.dart';
import '../../../res/routes/routes_name.dart';
import '../user_preference/user_preference_view_model.dart';

class LoginViewModel extends GetxController{
  final api=LoginRepository();
  UserPreference userPreference=UserPreference();

  final emailController=TextEditingController().obs;
    final passwordController=TextEditingController().obs;
  final emailFocusNode=FocusNode().obs;
      final passwordFocusNode=FocusNode().obs;
      RxBool loading=false.obs;

      void loginApi(){
        loading.value=true;
        Map data={
          'email':emailController.value.text,
          'password':passwordController.value.text,

        };
          
        
        api.loginApi(data).then((value) {
                  loading.value=false;
                  if(value['error']=='user not found'){
                            Utils.SnackBar('Error', value['error']);
  
                  }else{
                    UserModel userModel=UserModel(token: value['token'],
                    isLogin: true
                    );
                   userPreference.saveUser(userModel).then((value) => {
                      Get.delete<LoginViewModel>(),


                   // userPreference.saveUser(UserModel.fromJson(value)).then((value) => {
                     // Get.toNamed(RouteNames.homeView)!.then((value) => {}),

                    }).onError((error, stackTrace) => {

                    });
                    Utils.SnackBar('Login', 'Login sucessfully');

                  }


        }).onError((error, stackTrace) {
          print(error.toString());
                  loading.value=false;

          Utils.SnackBar('Error', error.toString());
        });
      }



}