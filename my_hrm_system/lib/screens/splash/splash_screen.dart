import 'package:my_hrm_system/res/imports.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  void _checkLogin() async {
    final loggedIn = await authController.isLoggedIn();

    if (loggedIn) {
      switch (authController.role) {
        case 'admin':
          Get.offAll(() => AdminDashboardScreen());
          break;
        case 'hr':
          Get.offAll(() => HrDashboardScreen());
          break;
        case 'employee':
          Get.offAll(() => EmployeeDashboardScreen());
          break;
        default:
          Get.offAll(() => AdminLoginScreen());
      }
    } else {
      Get.offAll(() => AdminLoginScreen());
    }
  }


  // @override
  // void initState() {
  //   super.initState();
  //   _checkAuthStatus();
  // }
//   void _checkAuthStatus() async {
//   await Future.delayed(const Duration(seconds: 2));
//    final prefs = await SharedPreferences.getInstance();
//   final token = prefs.getString('auth_token');
//   final role = prefs.getString('user_role');

//   if (token != null && role != null) {
//     switch (role) {
//       case 'admin':
//         Get.offAll(() => AdminLoginScreen());
//         break;
//       case 'hr':
//         Get.offAll(() => HrDashboardScreen());
//         break;
//       case 'employee':
//         Get.offAll(() => EmployeeDashboardScreen());
//         break;
//       default:
//         Get.offAll(() => AdminLoginScreen());
//     }
//   } else {
//     Get.offAll(() => AdminLoginScreen());
//   }
// }
     //  Get.to(MyDashboard());
   
   Future<void> checkLoginStatus() async {}
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
         child:SpinKitFadingCircle(
          itemBuilder: (_, int index) {
          return DecoratedBox(
          decoration: BoxDecoration(
          color: index.isEven ? AppColours.error : AppColours.primary,
          ),
         );
       },
         )
      ),
    );
  }
}

