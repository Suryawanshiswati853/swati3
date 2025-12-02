import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/NetworkManager.dart';
import 'package:e_commerce_app/common/widgets/loaders/T_loaders.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/athentication/screens/password_configration/reset_password.dart';


class ForgotPasswordController extends GetxController {
    static ForgotPasswordController get instance=>Get.find();
      final email=TextEditingController();
    GlobalKey<FormState>forgotPasswordformKey=GlobalKey<FormState>();
    sendPasswordResetEmail()async{
      try{
        //      await FullScreenLoader.openloadingDialog(
//   'Processing your request...',
//   TImages.animation,
// );
           final isConnection=await NetworkManager.instance.isConnected();
      if(!isConnection){
             // FullScreenLoader.stopAnimation();

        return;

      }
      //form validation
       if(!forgotPasswordformKey.currentState!.validate()){
             // FullScreenLoader.stopAnimation();

        return;

      }
      await AuthenticationRepository.Instance.sendPasswordResetEmail(email.text.trim());
          Loaders.sucessSnackbar(title: 'Email Sent',message: 'Email Link Sent to Reset your Password'.tr);
          Get.to(()=>ResetPassword(email:email.text.trim()));


      }catch(e){
            Loaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());


      }
    }
     resendPasswordResetEmail(String email)async{
      try{
         //      await FullScreenLoader.openloadingDialog(
//   'Processing your request...',
//   TImages.animation,
// );
           final isConnection=await NetworkManager.instance.isConnected();
      if(!isConnection){
             // FullScreenLoader.stopAnimation();

        return;

      }
      await AuthenticationRepository.Instance.sendPasswordResetEmail(email);
      Loaders.sucessSnackbar(title: 'Email Sent',message: 'Email Link Sent to Reset your Password'.tr);


    


      }catch(e){
            Loaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());

        
      }
    }


  
}