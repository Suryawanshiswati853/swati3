import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_app/common/widgets/loaders/T_loaders.dart';


class NetworkManager extends GetxController {
  static NetworkManager get instance=>Get.find();

final  Connectivity  _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

// late StreamSubscription<ConnectivityResult>_connectivitySubscription;
final Rx<ConnectivityResult>_connectionStatus = ConnectivityResult.none.obs;

@override
void onInit(){
  super.onInit();
   _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((results) {
      if (results.isNotEmpty) {
        updateConnetionStatus(results.first);
      }
    });
}
// _connectivitySubscription = _connectivity.onConnectivityChanged.listen(updateConnetionStatus);}
@override
void onClose(){
  super.onClose();
  _connectivitySubscription.cancel() ;
}

Future<void>updateConnetionStatus(ConnectivityResult result)async{
  _connectionStatus.value=result;
  if(_connectionStatus.value==ConnectivityResult.none){
    Loaders.warningSnackBar(title: 'No internet Connection');// used CustomToast here
  }
}
Future<bool>isConnected()async{
  try{
    final result=await _connectivity.checkConnectivity();
    if(result==ConnectivityResult.none){
      return false;
    }else{
      return true;
    }
  }on PlatformException catch (_){
    return false;
  }
}

}