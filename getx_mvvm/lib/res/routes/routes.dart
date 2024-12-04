
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/splash_screen.dart';

import '../../view/Home/home_view.dart';
import '../../view/Login/login_view.dart';


class AppRoutes{
  static appRoutes()=>[
    GetPage(name: RouteNames.SplashScreen, 
    page:()=>  SplashScreen(),
    transitionDuration: Duration(milliseconds: 250),
    transition: Transition.leftToRightWithFade),
     GetPage(name: RouteNames.loginView, 
    page:()=>  LoginView(),
    transitionDuration: Duration(milliseconds: 250),
    transition: Transition.leftToRightWithFade),

    //  GetPage(name: RouteNames.homeView, 
    // page:()=>  HomeView(),
    // transitionDuration: Duration(milliseconds: 250),
    // transition: Transition.leftToRightWithFade)
  ];
  
  
  
}