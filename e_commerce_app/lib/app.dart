import 'package:get/get.dart';
import 'utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/common/routes/app_routes.dart';
import 'package:e_commerce_app/bindings/general_binding.dart';
import 'package:e_commerce_app/features/athentication/screens/onboarding_screen.dart';
// import 'firebase_options.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       themeMode:ThemeMode.system,
      title: 'Flutter Demo',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBinding(),
      getPages:AppRoutes.pages,
      
      home:  Scaffold(backgroundColor: TColors.primaryColour,body: Center(child: CircularProgressIndicator(color: TColors.textwhite,),),),
    );
  }
}




