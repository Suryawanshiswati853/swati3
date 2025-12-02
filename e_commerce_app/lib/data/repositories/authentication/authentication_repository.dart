import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/exception/exception.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:e_commerce_app/data/services/coludery_service.dart';
import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/athentication/models/user_model.dart';
import 'package:e_commerce_app/features/athentication/screens/login/login.dart';
import 'package:e_commerce_app/features/athentication/screens/onboarding_screen.dart';
import 'package:e_commerce_app/features/athentication/screens/signup/verify_email.dart';



class AuthenticationRepository  extends GetxController{
  static AuthenticationRepository get Instance =>Get.find();

  final devicestorage=GetStorage();
  final _auth=FirebaseAuth.instance;
  User? get authUser=>_auth.currentUser;

@override
void onReady(){
  FlutterNativeSplash.remove();
  screenRedirect();
}
screenRedirect()async{
  final  user=_auth.currentUser;
  if(user!=null){
    if(user.emailVerified){
      Get.offAll(()=> const NavigationMenu());
    }else{
      Get.offAll(()=> emailVerifyScreen(email: _auth.currentUser?.email));
    }

    }else{
        devicestorage.writeIfNull('isFirstTime', true);
  devicestorage.read('isFirstTime')!= true ? Get.offAll(()=>const Loginscreen()): Get.offAll(onBoardingScreen());


    }
  }

  // if(kDebugMode){
  //   print("----------------------------------------");
  //   print(devicestorage.read('isFirstTime'));
  // }
  // local storage

///--------------------email and Password-----------------------------
///login email and pssword
Future<UserCredential>loginWithEmailandpassword(String email,String password) async{
  try{
    return await _auth.signInWithEmailAndPassword(email: email, password: password);


  }on FirebaseAuthException catch(e){
    throw TFirebaseAuthException(e.code).message;
  }on FirebaseException catch(e){
    throw TFirebaseException(e.code).message;
   }on FormatException catch(_){
    throw TFormatException();
   }on PlatformException catch(e){
    throw TPlatformException(e.code).message;
   }catch(e){
    throw 'Something went wrong, Please try again';
   }
}

///Register(email with password)
Future<UserCredential>registerWithEmailandpassword(String email,String password) async{
  try{
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);


  }on FirebaseAuthException catch(e){
    throw TFirebaseAuthException(e.code).message;
  }on FirebaseException catch(e){
    throw TFirebaseException(e.code).message;
   }on FormatException catch(_){
    throw TFormatException();
   }on PlatformException catch(e){
    throw TPlatformException(e.code).message;
   }catch(e){
    throw 'Something went wrong, Please try again';
   }
}
/// 
/// /// Send Email Verification
  Future<void> sendEmailVerification() async {
    try {
       await _auth.currentUser?.sendEmailVerification();
   
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
   Future<void> logout() async {
    try {
    final googleSignIn = GoogleSignIn.instance;
    await googleSignIn.signOut();
       await FirebaseAuth.instance.signOut();
       Get.offAll(()=>const Loginscreen());
   
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
 /// sign in with google 
 /// 
 /// 
 Future<UserCredential?>signInWithGoogle() async{
  try{
    final googleSignIn = GoogleSignIn.instance;

    // Interactive sign-in
    final GoogleSignInAccount? userAccount = await googleSignIn.authenticate();

    // If somehow null, handle cancellation
    if (userAccount == null) {
      print("Google Sign-In cancelled");
      return null;
    }

    // Get Firebase credential
    final GoogleSignInAuthentication? auth = await userAccount.authentication;
     if (auth?.idToken == null) {
      print("GoogleSignInAuthentication returned null idToken");
      return null;
    }


     final OAuthCredential credential = GoogleAuthProvider.credential(
     
       idToken: auth?.idToken,
    );

    return await _auth.signInWithCredential(credential);

   

  }on FirebaseAuthException catch(e){
    throw TFirebaseAuthException(e.code).message;
  }on FirebaseException catch(e){
    throw TFirebaseException(e.code).message;
   }on FormatException catch(_){
    throw TFormatException();
   }on PlatformException catch(e){
    throw TPlatformException(e.code).message;
   }catch(e){
    if(kDebugMode) print("Someting went wrong:$e");
    return null;
   // throw 'Something went wrong, Please try again';
   }
}
 Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
  ///reAuthenticateWithEmailandPassword
   Future<UserCredential> reAuthenticateWithEmailandPassword(String email,String password) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      return await _auth.currentUser!.reauthenticateWithCredential(credential);
    
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
   Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.deleteUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
//   Future<String> uploadImage(String path, XFile image) async {
//   try {
//     return await CloudinaryService.uploadImage(path, image);
//   } catch (e) {
//     throw 'Something went wrong while uploading: $e';
//   }
// }

}









