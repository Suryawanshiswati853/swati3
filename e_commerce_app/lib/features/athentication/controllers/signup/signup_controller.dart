import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/NetworkManager.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/common/widgets/loaders/T_loaders.dart';
import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/athentication/models/user_model.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/athentication/screens/signup/verify_email.dart';


class SignupController extends GetxController {
  static SignupController get instance=>Get.find();
  final hidePassword=true.obs;
    final privacyPolicy=true.obs;

  final email=TextEditingController();
    final lastName=TextEditingController();

  final firstName=TextEditingController();

  final userName=TextEditingController();

  final password=TextEditingController();
  final phoneNumber=TextEditingController();
  GlobalKey<FormState> signupFormkey=GlobalKey<FormState>();
   final userRepository=Get.put(UserRepository());



   void signUp() async{
    try{
//      await FullScreenLoader.openloadingDialog(
//   'We are processing your information...',
//   TImages.animation,
// );
    //FullScreenLoader.openloadingDialog('we are processing your information...', TImages.animation);
      //network
      final isConnection=await NetworkManager.instance.isConnected();
      if(!isConnection){
             // FullScreenLoader.stopAnimation();

        return;

      }
      //form validation
       if(!signupFormkey.currentState!.validate()){
             // FullScreenLoader.stopAnimation();

        return;

      }
      //privancy policy
      if(!privacyPolicy.value){
      //  FullScreenLoader.stopAnimation();

        Loaders.warningSnackBar(title: 'Accept Privancy Policy',message: 'in order to create account, you must have to read and accept the privacy policy & Terms of use');
         return;
      }
   final userCredential=  await AuthenticationRepository.Instance.registerWithEmailandpassword(email.text.trim(), password.text.trim());
 // save 
 final newUser=UserModel(
  id: userCredential.user!.uid,
  firstName:firstName.text.trim(),

  lastName:lastName.text.trim(),

  userName:userName.text.trim(),
  email:email.text.trim(),

  phoneNumber:phoneNumber.text.trim(),
  profilePicture:''
 );
 await userRepository.saveUserRecord(newUser);

 Loaders.sucessSnackbar(title: 'Congratulations',message: 'Your account has been created! verify email to continue');
 await Future.delayed(Duration(milliseconds: 100));

 await Get.to(()=> emailVerifyScreen(email: email.text.trim()));



    }catch(e){

          Loaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());



    }finally{
           //   FullScreenLoader.stopAnimation();


    }
   }
}