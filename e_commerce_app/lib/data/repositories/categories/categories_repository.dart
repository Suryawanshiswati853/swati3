import 'dart:convert';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/exception/exception.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';



class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();
  
//variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String cloudName = 'doraxvspc';
  final String apiKey = '571264351488212';
  final String apiSecret = 'Vxp0BXIGQ5y3pCUizJWouD9UgSU';
 // final String folder = 'category_images';
  @override
  void onInit() {
    super.onInit();
    getAllCategories();

//fetchCloudinaryImages();
fetchCloudinaryImagesMap();
updateCategoriesFromCloudinary();
  }
  /// get all categories
    Future<List<CategoryModel>> getAllCategories()async{
    try{
      final querySnapshot = await _db.collection('Categories').get();
      final categories = querySnapshot.docs
          .map((doc) => CategoryModel.fromSnapshot(doc))
          .toList();
      return categories;
    }on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  /// Update a single category image in Firestore
  Future<void> updateCategoryImage(String categoryId, String imageUrl) async {
    try {
      await _db.collection('Categories').doc(categoryId).update({
        'image': imageUrl,
      });
    } catch (e) {
    }
  }

 
  Future<Map<String, String>> fetchCloudinaryImagesMap() async {
    const cloudName = 'doraxvspc';
    const apiKey = '571264351488212';       
    const apiSecret = 'Vxp0BXIGQ5y3pCUizJWouD9UgSU'; 

    try {
      final auth = base64Encode(utf8.encode('$apiKey:$apiSecret'));

      print(" Step 2: Sending request to Cloudinary API");
      final response = await Dio().get(
        'https://api.cloudinary.com/v1_1/$cloudName/resources/image',
        queryParameters: {
          'type': 'upload',
          'max_results': 100,
        },
        options: Options(headers: {'Authorization': 'Basic $auth'}),
      );

      final resources = response.data['resources'] as List;

      final Map<String, String> imageMap = {};
      for (var r in resources) {
        final publicId = r['public_id'].toString(); // e.g., category_images/cosmatic_bgfrqu
        final fileName = publicId.split('/').last.toLowerCase(); // cosmatic_bgfrqu
        final url = r['secure_url'].toString();
        imageMap[fileName] = url;
      }

      return imageMap;
    } catch (e) {
      return {};
    }
  }
  Future<void> updateCategoriesFromCloudinary() async {
    final imageMap = await fetchCloudinaryImagesMap();
    final categories = await getAllCategories();

    for (var category in categories) {
      final catName = category.name.toLowerCase().replaceAll(' ', '_'); // normalize
      final matchedUrl = imageMap.entries
          .firstWhere(
              (entry) => entry.key.contains(catName), orElse: () => MapEntry('', ''))
          .value;

      if (matchedUrl.isNotEmpty) {
        await updateCategoryImage(category.id, matchedUrl);
      } else {
      }
    }

  }



}

    
  