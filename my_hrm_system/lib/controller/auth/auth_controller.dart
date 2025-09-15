import 'package:http/http.dart' as http;
import 'package:my_hrm_system/res/imports.dart';





class AuthController extends GetxController {
  Map<String, String> get authHeaders => {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer $token',
};
 Map<String, String> get authHeaders2=> {
  'Content-Type': 'application/json',
 
};
Map<String, String> getAuthHeaders({bool withToken = true}) {
  final headers = {
    'Content-Type': 'application/json',
  };

  if (withToken && token != null && token.isNotEmpty) {
    headers['Authorization'] = 'Bearer $token';
  }

  return headers;
}


  bool showPassword = false;
   String userEmail = '';
  // bool isLoggedIn = false;
    String token = '';
    String? userRole;
     bool isLoading = false;
  String? loginError;
  String name = '';
  String role = '';
  String image = '';
  String designation='';



  void togglePassword() {
    showPassword = !showPassword;
    update();
  }
   @override
  void onInit() {
    super.onInit();
   // checkAuthStatus();
  }
  Future<String?> loginEmployee(String email, String password) async {
  isLoading = true;
  loginError = null;
  update();

  // ✅ Determine role based on email
  String internalRole;
  final lowerEmail = email.trim().toLowerCase();
  if (lowerEmail == 'hrswati341@gmail.com') {
    internalRole = 'hr';
  } else if (lowerEmail == 'suryawanshiswati853@gmail.com') {
    internalRole = 'admin';
  } else {
    internalRole = 'employee'; 
  }

  try {
    final response = await http.post(
      Uri.parse(AppConstants.loginEndpoint),
      headers: authHeaders,
      body: jsonEncode({
        'email': email.trim(),
        'password': password.trim(),
        'role': internalRole, 
      }),
    );

    debugPrint("🔁 Backend response: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
       token = data['token'];
      final user = data['user'];
      role = (user['role'] as String).toLowerCase();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_name', user['name']);
      await prefs.setString('user_email', user['email']);
      await prefs.setString('user_role', role);
      await prefs.setInt('user_id', user['id']);
      await prefs.setString('user_image', user['employee_image'] ?? '');
      await prefs.setString('auth_token', token);
      await  prefs.setString('user_designation', user['designation']);


      debugPrint('🔐 Token: $token');
      debugPrint('🎭 Role: $role');
      debugPrint('🎭 Role: $designation');
      debugPrint("✅ Login successful. Role: $role");


      debugPrint("✅ Login successful. Role: $role");
      return role;
    } else {
      loginError = 'Invalid email or password';
      return null;
    }
  } catch (e) {
    loginError = 'Login failed: $e';
    return null;
  } finally {
    isLoading = false;
    update();
  }
}


  Future<void> forgotPassword(String email) async {
    isLoading = true;
    update();
       userEmail = email.trim();

    try {
      final response = await http.post(
        Uri.parse(AppConstants.forgotPasswordEndpoint),
        headers:authHeaders2,
        body: jsonEncode({'email': userEmail}),
      );

      if (response.statusCode == 200) {
         SnackbarUtil.showSuccess('Reset link sent to your email');
        // Get.snackbar('Success', 'Reset link sent to your email',
        //     backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        SnackbarUtil.showInfo('Something went wrong');
        // Get.snackbar('Error', 'Something went wrong',
        //     backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
       SnackbarUtil.showError('Network Error');
      
      // Get.snackbar('Error', 'Network Error',
      //     backgroundColor: Colors.red, colorText: Colors.white);
    }

    isLoading = false;
    update();
  }


 

  Future<void> resetPassword(String email, String password, String confirmPassword, String otp) async {
    if (password != confirmPassword) {
       SnackbarUtil.showError('Passwords do not match');
      
      return;
    }

    isLoading = true;
    update();

    try {
      final response = await http.post(
        Uri.parse(AppConstants.resetPasswordEndpoint),
        headers:authHeaders2,
        body: jsonEncode({
          'email': userEmail,
          'otp': otp.trim(),
          'new_password': password.trim(),
          'confirm_password': confirmPassword.trim(),
        }),
      );

      if (response.statusCode == 200) {
       SnackbarUtil.showSuccess('Password reset successfully');
       Get.to(AdminLoginScreen());
      } else {
       SnackbarUtil.showError('Failed to reset password');
      }
    } catch (e) {
      SnackbarUtil.showError('Something went wrong');
      
    } finally {
      isLoading = false;
      update();
    }
  }
  Future<bool> isLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  token = prefs.getString('auth_token') ?? '';
  role = prefs.getString('user_role') ?? '';

  return token.isNotEmpty;
}






 Future<void> loadUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('user_name') ?? '';
    role = prefs.getString('user_role') ?? '';
    image = prefs.getString('user_image') ?? '';
      designation = prefs.getString('user_designation') ?? '';
    update();
  }

  /// ✅ Logout user and clear everything
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
     name = '';
    role = '';
    image = '';
    update();
    Get.offAll(() => const AdminLoginScreen()); 
  }


}
