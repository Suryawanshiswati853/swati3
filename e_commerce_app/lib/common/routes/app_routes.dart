import 'package:e_commerce_app/common/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart.dart';
import 'package:e_commerce_app/features/shop/screens/order/order_screen.dart';
import 'package:e_commerce_app/features/shop/screens/store/store_screen.dart';
import 'package:e_commerce_app/features/athentication/screens/home/home.dart';
import 'package:e_commerce_app/features/athentication/screens/login/login.dart';
import 'package:e_commerce_app/features/athentication/screens/signup/sign_up.dart';
import 'package:e_commerce_app/features/shop/screens/wishlist/wishList_screen.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/screens/checkout.dart';
import 'package:e_commerce_app/features/athentication/screens/onboarding_screen.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_app/features/athentication/screens/signup/verify_email.dart';
import 'package:e_commerce_app/features/personalization/screens/settings/settings.dart';
import 'package:e_commerce_app/features/shop/screens/product_review/product_review.dart';
import 'package:e_commerce_app/features/personalization/screens/address/screens/address.dart';
import 'package:e_commerce_app/features/athentication/screens/password_configration/forgot_password.dart';


class AppRoutes {
  static final pages=[
  GetPage(name: TRoutes.home, page: ()=> HomeScreen()),
    // GetPage(name: TRoutes.search, page: ()=> HomeScreen()),

  GetPage(name: TRoutes.store, page: ()=> StoreScreen()),
  GetPage(name: TRoutes.favourites, page: ()=> FavouriteScreen()),
  GetPage(name: TRoutes.settings, page: ()=> SettingScreen()),
  GetPage(name: TRoutes.productReview, page: ()=> ProductReviewScreen()),
  GetPage(name: TRoutes.order, page: ()=> Orderscreen()),
  GetPage(name: TRoutes.checkOut, page: ()=> CheckOutScreen()),
  GetPage(name: TRoutes.cart, page: ()=> cartScreen()),
  GetPage(name: TRoutes.userProfile, page: ()=> ProfileScreen()),
  GetPage(name: TRoutes.userAddress, page: ()=> UserAddressScreen()),
  GetPage(name: TRoutes.signUp, page: ()=> signUpScreen()),
  GetPage(name: TRoutes.verifyEmail, page: ()=> emailVerifyScreen()),
  GetPage(name: TRoutes.signIn, page: ()=> Loginscreen()),
  GetPage(name: TRoutes.forgetPassword, page: ()=> ForgotPassword()),
  GetPage(name: TRoutes.onBoarding, page: ()=> onBoardingScreen()),


  ];
}