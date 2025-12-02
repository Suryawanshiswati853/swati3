import 'package:get/get.dart';
import 'package:e_commerce_app/NetworkManager.dart';


class GeneralBinding  extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }

}