import 'package:get/get.dart';
import 'package:e_commerce_app/NetworkManager.dart';
import '../../../common/widgets/loaders/T_loaders.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/data/repositories/categories/categories_repository.dart';



class CategoryController  extends GetxController{
  static CategoryController get instance=>Get.find();
   final categoryRepository=Get.put(CategoryRepository());
      final  categoryLoading=false.obs;
      RxList<CategoryModel> categories=<CategoryModel>[].obs;
       RxList<CategoryModel> featuresCategories=<CategoryModel>[].obs;


   @override
   void onInit(){
    fetchAllCategories();
    
        updateCategoriesFromCloudinary();

   // updateCategoriesFromCloudinary();
    super.onInit();
   }
   Future<void> fetchAllCategories() async {
  try {
    categoryLoading.value = true;

    final allCategories = await categoryRepository.getAllCategories();

    // Update the observable list
    categories.assignAll(allCategories);

    // Featured categories
    featuresCategories.assignAll(
      allCategories
          .where((category) => category.isFeatured && category.ParentId.isEmpty)
          .take(8)
          .toList(),
    );

  } catch (e) {
    Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  } finally {
    categoryLoading.value = false;
  }
}
Future<void> updateCategoriesFromCloudinary() async {
    try {
      categoryLoading.value = true;

      // Call repository method
      await categoryRepository.updateCategoriesFromCloudinary();

      // Refresh categories after updating images
      await fetchAllCategories();

    } catch (e) {
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      categoryLoading.value = false;
    }
  }


 Future<void> updateCategoryImages(Map<String, String> categoryImages) async {
    try {
      categoryLoading.value = true;

      for (var entry in categoryImages.entries) {
        await categoryRepository.updateCategoryImage(entry.key, entry.value);
      }
      await fetchAllCategories();

    } catch (e) {
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      categoryLoading.value = false;
    }
  }
}

