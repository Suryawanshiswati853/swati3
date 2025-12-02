import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce_app/NetworkManager.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/common/widgets/loaders/T_loaders.dart';
import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/athentication/models/user_model.dart';
import 'package:e_commerce_app/features/athentication/screens/login/login.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/re_AuthLoginform.dart';


class UserController extends GetxController {
  static UserController get instance=>Get.find();
   final userRepository=Get.put(UserRepository());
   Rx<UserModel> user=UserModel.empty().obs;
   final  profileLoading=false.obs;
   final hidePassword=false.obs;
      final  imageLoading=false.obs;

   final verifyEmail=TextEditingController();
      final verifyPassword=TextEditingController();

    GlobalKey<FormState>reAuthformKey=GlobalKey<FormState>();

   @override
   void onInit(){
    fetchUserRecord();
    super.onInit();
   }
    Future<void>fetchUserRecord()async {
      try{
        profileLoading.value=true;
        final user=await userRepository.fetchUserDetails();
        this.user(user);
       profileLoading.value=false;

      }catch(e){
        user(UserModel.empty());

      }finally{
        profileLoading.value=false;

      }
    }



  Future<void>saveUserRecord(UserCredential? userCredential)async{
    await fetchUserRecord();


    try{
if(user.value.id.isEmpty){
      if(userCredential!=null){
        final userPorts=UserModel.namePorts(userCredential.user?.displayName??'');
                final userName=UserModel.generateUsername(userCredential.user?.displayName??'');
                final user=UserModel(
  id: userCredential.user!.uid,
  firstName:userPorts[0],

  lastName:userPorts.length>1?userPorts.sublist(1).join(" "):'',

  userName:userName,
  email:userCredential.user!.email??'',

  phoneNumber:userCredential.user!.phoneNumber??'',
  profilePicture:userCredential.user!.photoURL??''
 );
 await userRepository.saveUserRecord(user);

      }

    }}catch(e){
      Loaders.warningSnackBar(title: 'Date not saved',message: 'someting went wrong while saving  your information , You can re-save your date in your Profile');
    }

  }
  void deleteAccountwarningPopup(){
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText: 'Do you want to delete your account permenantly? This action is not reversible and all of your data will be removed permanently.',
      
      confirmTextColor: Colors.white,
      onCancel: (){},
      confirm: ElevatedButton(
         onPressed: ()async{
      
          deleteUserAccount();
        },
        style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        side: BorderSide(color: Colors.red),),
        child: Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: TSizes.lg),
        child: Text('Delete'),
        ),
        
          
        
      

      
        ),
        cancel: OutlinedButton(
         onPressed: (){
        Navigator.of(Get.overlayContext!).pop();
        }, child: Text('Cancel'),
    ));
  }
  void deleteUserAccount()async{
    try{
      //      await FullScreenLoader.openloadingDialog(
//   'Processing',
//   TImages.animation,
// );
final auth=AuthenticationRepository.Instance;
final provider=auth.authUser!.providerData.map((e)=>e.providerId).first;
if(provider=='google.com'){
  await auth.signInWithGoogle();
  await auth.deleteAccount();
  Get.offAll(()=>const Loginscreen());
    }else if(provider=='password'){
      Get.to(()=>  ReAuthloginform());
    }
   
} catch(e){
      Loaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      }finally{
  }
}
void reAuthenticate()async{
  try{
     //      await FullScreenLoader.openloadingDialog(
//   'Processing',
//   TImages.animation,
// );
    //network
      final isConnection=await NetworkManager.instance.isConnected();
      if(!isConnection){
             // FullScreenLoader.stopAnimation();

        return;

      }
      //form validation
       if(!reAuthformKey.currentState!.validate()){
             // FullScreenLoader.stopAnimation();

        return;

      }
      await AuthenticationRepository.Instance.reAuthenticateWithEmailandPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
    await AuthenticationRepository.Instance.deleteAccount();
    Get.off(()=>const Loginscreen());
  }catch(e){
      Loaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
      }finally{
      }

}
void uploadImageProfile() async {
  print("📌 Step 1: uploadImageProfile() started");

  try {
    print("📌 Step 2: Opening Image Picker...");

    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxHeight: 512,
      maxWidth: 512,
    );

    print("📌 Step 3: Image Picker returned: ${image != null ? "Image Selected" : "No Image"}");

    if (image != null) {
      print("📌 Step 4: Picked Image Path: ${image.path}");

      imageLoading.value = true;
      print("📌 Step 5: Uploading to Cloudinary...");

      final imageUrl = await userRepository.uploadImage('user_profiles', image);
      print("✅ Step 6: Uploaded Image URL: $imageUrl");

      Map<String, dynamic> json = {
        'profilePicture': imageUrl,
      };

      print("📌 Step 7: Updating Firestore...");
      await userRepository.updateSingleUserRecord(json);

      print("📌 Step 8: Updating local user object...");
      user.value.profilePicture = imageUrl;
      user.refresh();

      print("✅ Step 9: Success - Snackbar triggered");
      Loaders.sucessSnackbar(title: 'Success', message: 'Profile picture updated successfully');
    }
  } catch (e) {
    print("❌ ERROR in uploadImageProfile: $e");
    Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  } finally {
    print("📌 Step 10: Finally block reached");
    imageLoading.value = false;
  }
}

// void uploadImageProfile() async {
//    print("uploadImageProfile() started"); 
//   try {
//     final image = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 70,
//       maxHeight: 512,
//       maxWidth: 512,
//     );

//     if (image != null) {
//         print("Picked Image Path: ${image.path}");

//       imageLoading.value = true;

//       final imageUrl = await userRepository.uploadImage('user_profiles', image);

//       Map<String, dynamic> json = {
//         'profilePicture': imageUrl,
//       };

//       await userRepository.updateSingleUserRecord(json);

//       user.value.profilePicture = imageUrl;
//       user.refresh();

//       Loaders.sucessSnackbar(title: 'Success', message: 'Profile picture updated successfully');
//     }
//   } catch (e) {
//     Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
//   } finally {
//     imageLoading.value = false;
//   }
// }

// void uploadImageProfile()async{
//   try{
// final image=await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512,maxWidth: 512);
// if(image!=null){
//   imageLoading.value=true;
//   final imageUrl= await userRepository.uploadImage('path',image);
//   Map<String,dynamic>json={
//     'profilePicture':imageUrl,
//   };
//   await userRepository.updateSingleUserRecord(json);
//   user.value.profilePicture=imageUrl;
//   user.refresh();
//   Loaders.sucessSnackbar(title: 'Success',message:  'Profile picture updated successfully');

// }
//   }catch(e){
//       Loaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
// }finally{
//   imageLoading.value=false;
// }
// }
}