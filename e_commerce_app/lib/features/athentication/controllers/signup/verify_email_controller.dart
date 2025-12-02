import 'dart:async';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce_app/utils/constants/texts.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/common/widgets/loaders/T_loaders.dart';
import 'package:e_commerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';



class VerifyEmailController  extends GetxController{ 

static VerifyEmailController get instance => Get.find();

@override
void onInit(){
  sendEmailVerification();
  setTimerforAutoDirect();
  super.onInit();
}
//end email verification line
sendEmailVerification()async{
  try{
    await AuthenticationRepository.Instance.sendEmailVerification();
         Loaders.sucessSnackbar(title: 'Email Sent',message: 'Please Check your inbox and verify your email.');


  }catch(e){
     Loaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());


  }

}
// timer to request of emial verifications
  setTimerforAutoDirect() {
    Timer.periodic( const Duration(seconds: 1),(timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user=FirebaseAuth.instance.currentUser;
      if(user?.emailVerified??false){
        timer.cancel();
        Get.off(()=>successScreen(image: TImages.sucesspaymenticon, title: TText.yourAccountCreatedTitle, subTitle:  TText.yourAccountCreatedSubtitle, onPressed: ()=>AuthenticationRepository.Instance.screenRedirect()));
      }

    });

  }

// chcekif email verifes 
checkEmailVerificationStatus(){
    final currentUser=FirebaseAuth.instance.currentUser;
    if(currentUser!=null&&currentUser.emailVerified){
  Get.off(()=>successScreen(image: TImages.sucesspaymenticon, title: TText.yourAccountCreatedTitle, subTitle:  TText.yourAccountCreatedSubtitle, onPressed:()=> AuthenticationRepository.Instance.screenRedirect()));
    }
  }

}