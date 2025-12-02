import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:e_commerce_app/NetworkManager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:e_commerce_app/common/widgets/loaders/T_loaders.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';



class LoginController extends GetxController {
  final remeberMe=false.obs;
    final hidePassword=true.obs;

  final localStorage=GetStorage();
  final email=TextEditingController();
    final password=TextEditingController();
    GlobalKey<FormState>loginformKey=GlobalKey<FormState>();
    final userController=Get.put(UserController());
    @override
void onInit(){
  email.text=localStorage.read('REMEMBER_ME_EMAIL')??'';
  print("--------${localStorage.read('REMEMBER_ME_EMAIL')}");

  password.text=localStorage.read('REMEMBER_ME_PASSWORD')??'';
  print("========${localStorage.read('REMEMBER_ME_PASSWORD')}");
              print(' Saved Email: ${localStorage.read('REMEMBER_ME_EMAIL')}');
  print('✅ Saved Password: ${localStorage.read('REMEMBER_ME_PASSWORD')}');


  super.onInit();



}
    
   Future    <void> emailandPasswordSignIn() async{
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
       if(!loginformKey.currentState!.validate()){
             // FullScreenLoader.stopAnimation();

        return;

      }
      if(!remeberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());


        

        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
          localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
            print("Saved Email: ${localStorage.read('REMEMBER_ME_EMAIL')}");
  print("Saved Password: ${localStorage.read('REMEMBER_ME_PASSWORD')}");





    
      }
   final userCredential=  await AuthenticationRepository.Instance.loginWithEmailandpassword(email.text.trim(), password.text.trim());
    Loaders.sucessSnackbar(title: 'Congratulations',message: 'Login Sucessfully!');

   AuthenticationRepository.Instance.screenRedirect();
    }catch(e){
    Loaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());



    }finally{


    }
   }
   Future <void> googleSignIn()async{
    //      await FullScreenLoader.openloadingDialog(
//   'Logingging you in',
//   TImages.animation,
// );

try{
    final isConnection=await NetworkManager.instance.isConnected();
      if(!isConnection){
             // FullScreenLoader.stopAnimation();

        return;
        

      }
      //save user record
  final userCredential=  await AuthenticationRepository.Instance.signInWithGoogle();
   await userController.saveUserRecord(userCredential);
   AuthenticationRepository.Instance.screenRedirect();




}catch(e){
      Loaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());


}finally{

}
   }
}


