import 'package:get/get.dart';
import 'utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:e_commerce_app/NetworkManager.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
 import 'firebase_options.dart';






// Future<void> main() async {
//   final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//   await GetStorage.init();
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   // Register repositories/managers globally
//   Get.put(AuthenticationRepository());
//   Get.put(NetworkManager(), permanent: true);  
//  // Get.put(NetworkManager());

//   runApp(const MyApp());
// }

 Future<void> main() async{
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
    // await FirebaseAuth.instance.setLanguageCode("en");

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value)=>Get.put(AuthenticationRepository()),  );
  
  runApp(const MyApp());
}


