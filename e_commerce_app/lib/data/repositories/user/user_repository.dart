import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:e_commerce_app/utils/exception/exception.dart';
import 'package:e_commerce_app/features/athentication/models/user_model.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';


class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  // save

  Future<void>saveUserRecord(UserModel user)async{
    try{
      await _db.collection('Collection').doc(user.id).set(user.toJson());
     }on FirebaseException catch(e){
    throw TFirebaseException(e.code).message;
   }on FormatException catch(_){
    throw  TFormatException();
   }on PlatformException catch(e){
    throw TPlatformException(e.code).message;
   }catch(e){
    throw 'Something went wrong, Please try again';
   }
    
  }
  /// fetch users
    Future<UserModel>fetchUserDetails()async{
    try{
    final documentSnapshot = await _db.collection('Collection').doc(AuthenticationRepository.Instance.authUser?.uid).get();
    if(documentSnapshot.exists){
      return UserModel.fromSnapshot(documentSnapshot);
    }else{
      return UserModel.empty();
    }
     }on FirebaseException catch(e){
    throw TFirebaseException(e.code).message;
   }on FormatException catch(_){
    throw  TFormatException();
   }on PlatformException catch(e){
    throw TPlatformException(e.code).message;
   }catch(e){
    throw 'Something went wrong, Please try again';
   }
    
  }


  /// update users
    Future<void>updateUserRecord(UserModel updateUser)async{
    try{
      await _db.collection('Collection').doc(updateUser.id).update(updateUser.toJson());
     }on FirebaseException catch(e){
    throw TFirebaseException(e.code).message;
   }on FormatException catch(_){
    throw  TFormatException();
   }on PlatformException catch(e){
    throw TPlatformException(e.code).message;
   }catch(e){
    throw 'Something went wrong, Please try again';
   }
    
  }

  /// update particular user
    Future<void>updateSingleUserRecord(Map<String,dynamic>json)async{
    try{
      await _db.collection('Collection').doc(AuthenticationRepository.Instance.authUser?.uid).update(json);
     }on FirebaseException catch(e){
    throw TFirebaseException(e.code).message;
   }on FormatException catch(_){
    throw  TFormatException();
   }on PlatformException catch(e){
    throw TPlatformException(e.code).message;
   }catch(e){
    throw 'Something went wrong, Please try again';
   }
    
  }

  /// delete user
    Future<void>deleteUserRecord(String userId)async{
    try{
      await _db.collection('Collection').doc(userId).delete();
     }on FirebaseException catch(e){
    throw TFirebaseException(e.code).message;
   }on FormatException catch(_){
    throw  TFormatException();
   }on PlatformException catch(e){
    throw TPlatformException(e.code).message;
   }catch(e){
    throw 'Something went wrong, Please try again';
   }
    
  }
  Future<String> uploadImage(String path, XFile image) async {
  try {
    final cloudinary = CloudinaryPublic(
      'doraxvspc', 
      'user_images_preset',
      cache: false,
    );

     CloudinaryResponse response = await cloudinary.uploadFile(
    CloudinaryFile.fromFile(
      image.path,
      folder: path.isNotEmpty ? path : 'user_profiles',
      resourceType: CloudinaryResourceType.Image,
    ),
  );

  return response.secureUrl;
  } catch (e) {
    throw 'Something went wrong while uploading: $e';
  }
}


  // Future<String> uploadImage(String path, XFile image) async {
  // try {
  //   final ref=FirebaseStorage.instance.ref(path).child(image);
  //   await ref.putFile(File(image.path));
  //   final url=await ref.getDownloadURL();
  //   return url;

  // } catch (e) {
  //   throw 'Something went wrong while uploading: $e';
  // }
}


  

