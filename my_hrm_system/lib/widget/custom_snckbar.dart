import 'package:my_hrm_system/res/imports.dart';


class SnackbarUtil {
  static void showSuccess(String message, {String title = 'Success'} ) {
    Get.snackbar(
      title,
      message,
      
      backgroundColor: AppColours.green,
      colorText: AppColours.onBackground,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
    );
  }

  static void showError(String message, {String title = 'Error'}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColours.red,
      colorText: AppColours.onBackground,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
    );
  }

  static void showInfo(String message, {String title = 'Info'}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColours.orange,
      colorText: AppColours.onBackground,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
    );
  }
}
