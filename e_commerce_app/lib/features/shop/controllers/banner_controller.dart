import 'package:get/get.dart';
import '../../../common/widgets/loaders/T_loaders.dart';
import 'package:e_commerce_app/features/shop/models/banner_model.dart';
import 'package:e_commerce_app/data/repositories/banner/banner_repository.dart';



class BannerController  extends GetxController{
 static BannerController get instance=>Get.find();
     final bannerRepo=Get.put(BannerRepository());

 final carouselCurretIndex=0.obs;
  final  isLoading=false.obs;
  RxList<BannerModel> banners=<BannerModel>[].obs;
      @override
      void onInit(){
        super.onInit();
        fetchAllBanners();
        importBannerImagesFromCloudinary();
       // importBannerImages();
      }

 
  void updatePageIndicator(index){
    carouselCurretIndex.value=index;

  }
     Future<void> fetchAllBanners() async {
  try {
    isLoading.value = true;
    final fetchedBanners = await bannerRepo.fetchBanners();
     this.banners.assignAll(fetchedBanners); 
  } catch (e) {
    Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  } finally {
    isLoading.value = false;
  }
}
  Future<void> importBannerImagesFromCloudinary() async {
    try {
      print("🚀 Starting banner import...");
      isLoading.value = true;

      // Fetch all Cloudinary images
      final imageMap = await bannerRepo. fetchCloudinaryImagesMap(); 
      print("📸 Total images fetched: ${imageMap.length}");

      if (imageMap.isEmpty) {
        print("⚠️ No images found in Cloudinary.");
        return;
      }

      // Save all images into Firestore
      await bannerRepo.saveAllBannerImages(imageMap);

      print("✅ Banner images successfully saved to Firestore!");
    } catch (e) {
      print("❌ Error importing banner images: $e");
    } finally {
      isLoading.value = false;
      print("🏁 Banner import finished.");
    }
  }

  // Future<void> importBannerImages() async {
  //   try {
  //     isLoading.value = true;
  //     print(" Starting banner image import...");

  //     final imageMap = await bannerRepo.fetchCloudinaryImagesMap(); // your existing method
  //     print("📸 Total images fetched: ${imageMap.length}");

  //     if (imageMap.isEmpty) {
  //       print(" No images found in Cloudinary.");
  //       return;
  //     }

  //     await bannerRepo.saveAllBannerImages(imageMap);

  //     print("✅ Banner images successfully saved to Firestore!");
  //   } catch (e) {
  //     print("❌ Error importing banner images: $e");
  //   } finally {
  //     isLoading.value = false;
  //     print("🏁 Banner import process finished.");
  //   }
  // }


  // Future<void> uploadCloudinaryToFirestore({
  //   required String targetScreen,
  //   required bool active,
  // }) async {
  //   final imageMap = await bannerRepo. fetchCloudinaryImagesMap(); 

  //   if (imageMap.isNotEmpty) {
  //     await bannerRepo.saveImagesToFirestore(
  //       imageMap: imageMap,
  //       targetScreen: targetScreen,
  //       active: active,
  //     );
  //     print("🎉 All images saved to Firestore");
  //   } else {
  //     print("⚠️ No images found in Cloudinary");
  //   }
  // }



}