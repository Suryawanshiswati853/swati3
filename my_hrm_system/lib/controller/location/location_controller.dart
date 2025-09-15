import 'package:my_hrm_system/res/imports.dart';

class LocationController extends GetxController {
  Position? currentPosition;
  bool isLoading = false;
  final List<Marker> markers = [];
  final Completer<GoogleMapController> mapController = Completer();

  Future<void> fetchCurrentLocation() async {
    isLoading = true;
    update();

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        Get.snackbar("Location", "Please enable location services.");
        isLoading = false;
        update();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar("Permission", "Location permissions are denied.");
          isLoading = false;
          update();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar("Permission", "Location permissions are permanently denied.");
        isLoading = false;
        update();
        return;
      }

      currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      Get.snackbar("Error", "Failed to get location: $e");
    } finally {
      isLoading = false;
      update(); 
    }
  }
}
