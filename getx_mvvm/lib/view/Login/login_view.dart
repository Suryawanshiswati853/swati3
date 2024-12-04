


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/controller/login/login_view_model.dart';
import '../../widgets/input_email_widget.dart';
import '../../widgets/input_password_widget.dart';
import '../../widgets/login_button_widget.dart';

class LoginView extends StatefulWidget{
  _LoginViewState createState()=> _LoginViewState();
}
  class _LoginViewState extends State<LoginView>{
 final loginvm=Get.put(LoginViewModel());
final _formkey=GlobalKey<FormState>();
@override
void dispose(){
  //Get.delete<LoginViewModel>();
  super.dispose();
}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('login'.tr),
      ),
      body: 
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key:_formkey,
              child: Column(children: [
                InputEmailWidget(),
              SizedBox(
              height: 10,
            ),
            InputPasswordWidget(),            
          ],),
            ),
                       SizedBox(
              height: 12,
            ),
           LoginButtonWidget(formkey:_formkey)
          
           
          ],
        ),
      ),
    );
  }
  }
