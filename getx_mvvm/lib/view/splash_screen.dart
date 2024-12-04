import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/general_exception.dart';
import '../res/components/internet_exception_widget.dart';
import '../res/components/round_button.dart';
import '../view_model/services/splash_services.dart';



class SplashScreen extends StatefulWidget{
  _SplashScreenState createState()=> _SplashScreenState();
}
  class _SplashScreenState extends State<SplashScreen>{
SplashServices splashServices=SplashServices();
@override
void initState() {
   
    super.initState();
    splashServices.isLogin();
  } 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
       child: Text("welcome_back".tr,textAlign: TextAlign.center,)
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.amber,
      //   title: Text("Splash Screen"),
      // ),
      // body: Column(
      //   children: [
      //     // Roundbutton(onPress: (){},title: 'Login',width:double.infinity ,),
      //     // Roundbutton(onPress: (){},title: 'Login',width:200 ,),

      //   ],
      // ),
   // body:   GeneralExceptionWidget(onPress: () {  },),
    );
   
     // body: Image(image: AssetImage(ImageAsset.SplashScreen)),
     
      // appBar: AppBar(
      //    backgroundColor: Colors.amber,
      //   //title: Text('email_hint'.tr),
      // ),
    //      floatingActionButton: FloatingActionButton(onPressed: (){
    //  Utils.toastMessage("swati sutryawanshi");
    //  Utils.toastMessagecenter("swati uttam suryawanshi");
    //  }),
    //  floatingActionButton: FloatingActionButton(onPressed: (){
    //   throw InternetException('this is swati ');
    //  }),
   // );
  }
  }
      
