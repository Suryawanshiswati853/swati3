import 'dart:convert';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/exception/exception.dart';
import 'package:e_commerce_app/features/shop/models/banner_model.dart';



class BannerRepository  extends GetxController{
    static BannerRepository get instance => Get.find();
  
//variables
  final  _db = FirebaseFirestore.instance;
  @override
  void onInit() {
    super.onInit();
    fetchBanners();

fetchCloudinaryImagesMap();

  }

  /// get all banners
     Future<List<BannerModel>> fetchBanners() async {
    try {
      final result=await _db.collection('Banners').where('Active',isEqualTo:true).get();
     return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();

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
    Future<Map<String, String>> fetchCloudinaryImagesMap() async {
    const cloudName = 'doraxvspc';
    const apiKey = '571264351488212';      
    const apiSecret = 'Vxp0BXIGQ5y3pCUizJWouD9UgSU'; 

    try {
      print(" Step 1: Encoding API ");
      final auth = base64Encode(utf8.encode('$apiKey:$apiSecret'));
      print(" Step 1: Auth encoded========");

      print(" Step 2: Sending request to Cloudinary API");
      final response = await Dio().get(
        'https://api.cloudinary.com/v1_1/$cloudName/resources/image',
        queryParameters: {
          'type': 'upload',
         // 'prefix': folder,
          'max_results': 100,
        },
        options: Options(headers: {'Authorization': 'Basic $auth'}),
      );
      print("✅ Step 2: Response ");

      final resources = response.data['resources'] as List;
      print("📌 Step 3: Total resources found: ${resources.length}");

      final Map<String, String> imageMap = {};
      for (var r in resources) {
        final publicId = r['public_id'].toString(); 
        final fileName = publicId.split('/').last.toLowerCase(); 
        final url = r['secure_url'].toString();
        imageMap[fileName] = url;
        print("🔹 Found: $fileName -> $url");
      }

      return imageMap;
    } catch (e) {
      print("❌ Error fetching Cloudinary images: $e");
      return {};
    }
  }
    String sanitizeDocId(String input) {
    if (input.isEmpty) return DateTime.now().millisecondsSinceEpoch.toString();
    return input
        .replaceAll(RegExp(r'[\/#\[\]?*\\]'), '_')  // replace invalid chars
        .replaceAll(' ', '_')                        // spaces to _
        .toLowerCase();
  }

  Future<void> saveBannerImage({
    required String docId,
    required String imageUrl,
  }) async {
    try {
      await _db.collection('Banners').doc(docId).set({
        'imageUrl': imageUrl,
        'uploadedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      print("✅ Saved banner: $docId -> $imageUrl");
    } catch (e) {
      print("❌ Failed to save banner $docId: $e");
    }
  }

  /// Save all banners from Cloudinary
  Future<void> saveAllBannerImages(Map<String, String> imageMap) async {
    for (var entry in imageMap.entries) {
      final imageUrl = entry.value;
      if (imageUrl.isEmpty) {
        print("⚠️ Skipping ${entry.key}, empty URL");
        continue;
      }

      final docId = sanitizeDocId(entry.key); // safe doc ID
      await saveBannerImage(docId: docId, imageUrl: imageUrl);
    }

    print("🎉 All banner images processed!");
  }

  //  Future<void> saveAllBannerImages(Map<String, String> imageMap) async {
  //   for (var entry in imageMap.entries) {
  //     final docId = entry.key; 
  //     final imageUrl = entry.value;

  //     await _db.collection('Banners').doc(docId).set({
  //       'imageUrl': imageUrl,
  //       'uploadedAt': FieldValue.serverTimestamp(), 
  //     }, SetOptions(merge: true)); 

  //     print("✅ Saved image URL for banner: $docId");
  //   }

  //   print("🎉 All banner image URLs saved to Firestore!");
  // }

}





