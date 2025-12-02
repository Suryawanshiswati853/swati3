import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/NetworkManager.dart';
import '../../../common/widgets/loaders/T_loaders.dart';
import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';



class updateUserController extends GetxController {
  static updateUserController get instance=>Get.find();
  final userRepository=Get.put(UserRepository());
  final firstName=TextEditingController();
  final userController=UserController.instance;
      final lastName=TextEditingController();
GlobalKey<FormState>updateNameformKey=GlobalKey<FormState>();
   

   @override
   void onInit(){
    intializeNames();
    super.onInit();
   }
   Future<void>intializeNames()async{
    firstName.text=userController.user.value.firstName;
    lastName.text=userController.user.value.lastName;
   
   }
    Future<void>updateUserName()async {
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
        if(!updateNameformKey.currentState!.validate()){
          return;
        }
        Map<String,dynamic>name={
          'firstName':firstName.text.trim(),
          'lastName':lastName.text.trim(),
        };
        await userRepository.updateSingleUserRecord(name);
        userController.user.value.firstName=firstName.text.trim();
        userController.user.value.lastName=lastName.text.trim();
       
        Loaders.sucessSnackbar(title: 'Success',message:  'Your name has been updated successfully');
        Get.off(()=>  ProfileScreen());
      }catch(e){
          Loaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      }
    }
   
}