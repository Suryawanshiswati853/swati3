import 'package:my_hrm_system/res/imports.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final AuthController myAuthController = Get.put(AuthController());
  void handleLogin() async {
      if (!_formKey.currentState!.validate()) return;
  final role = await myAuthController.loginEmployee(emailController.text, passwordController.text);
  debugPrint("------------------$role");
  

  if (role == null) {
     SnackbarUtil.showError('Login Failed');
    // Get.snackbar(
    //   'Login Failed',
    //    myAuthController.loginError ?? 'Something went wrong',
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: Colors.redAccent,
    //   colorText: Colors.white,
    // );
    return;
  }

SnackbarUtil.showSuccess('Login Sucessful');


  await Future.delayed(Duration(milliseconds: 500));
  switch (role) {
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
     SnackbarUtil.showError('Access Denied');
      // Get.snackbar(
      //   'Access Denied',
      //   'Unknown role: $role',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.orange,
      //   colorText: Colors.white,
      // );
  }
}


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWeb = screenWidth >= 1024;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1024;

    final double allPadding = ResponsiveHelper.isMobile(context)
        ? 10.0
        : isTablet
            ? 20.0
            : 30.0;
    final double newPadding = ResponsiveHelper.isMobile(context)
        ? 24.0
        : isTablet
            ? 34.0
            : 44.0;
    final double borderRadius = isWeb ? 20.0 : isTablet ? 15.0 : 10.0;
    final double borderRadius2 = isWeb ? 48.0 : isTablet ? 32.0 : 16.0;

    return Scaffold(
      backgroundColor: AppColours.blue2,
       appBar: AppBar(
        backgroundColor: AppColours.blue2,
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<AuthController>(
        builder: (myAuthController) => GestureDetector(

    onTap: () => FocusScope.of(context).unfocus(),
       child:   SingleChildScrollView(
          padding: EdgeInsets.all(allPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: isWeb ? 50 : isTablet ? 45 : 35,
                  decoration: BoxDecoration(
                    color: AppColours.blue,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.balcony_outlined,
                      size: 25,
                      color: AppColours.background,
                    ),
                  ),
                ),
              ),
              SizedBox(height: isWeb ? 20 : isTablet ? 15 : 10),

              // Title
              Center(child: Text("HRM SYSTEM", style: AppTextStyles.appbar)),
              Center(
                child: SizedBox(
                  width: 70,
                  child: Divider(
                    color: AppColours.blue,
                    thickness: 5.0,
                  ),
                ),
              ),
              SizedBox(height: isWeb ? 30 : isTablet ? 25 : 20),

              Form(
                key: _formKey,
                child: Card(
                  color: AppColours.fill3,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius2),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(newPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Text("Welcome Back", style: AppTextStyles.appbar)),
                        SizedBox(height: isWeb ? 20 : isTablet ? 15 : 10),

                        // Email field
                        Text("Email or Mobile", style: AppTextStyles.buttonStyle),
                        SizedBox(height: isWeb ? 20 : isTablet ? 15 : 10),
                         CustomTextFormField(
                          
                          keyboardType: TextInputType.emailAddress,
      controller: emailController,
      hintText: 'Enter your email',
      validator: Validation.validateEmail,
     // validator: (value) => value == null || value.isEmpty ? 'Please enter email' : null,
      prefixIcon: Icons.email,
    ),
                      
                        SizedBox(height: isWeb ? 20 : isTablet ? 15 : 10),

                        // Password field
                        Text("Password", style: AppTextStyles.buttonStyle),
                         SizedBox(height: isWeb ? 20 : isTablet ? 15 : 10),
                          CustomTextFormField(
                           //  keyboardType: TextInputType.emailAddress,
      controller: passwordController,
      hintText: 'Enter your password',
      validator:Validation.validatePassword ,
     // validator: (value) => value == null || value.isEmpty ? 'Please enter password' : null,
      prefixIcon: Icons.lock,
      obscureText: !myAuthController.showPassword,
      hasToggle: true,
      showPassword: myAuthController.showPassword,
      togglePassword: myAuthController.togglePassword,
    ),
                       
                     SizedBox(height: isWeb ? 55 : isTablet ? 45 : 35),
                            CustomButton(
  isLoading: myAuthController.isLoading,
  onPressed: () async {
    if (_formKey.currentState!.validate()) {
      
    print("Form is valid. Logging in...");
    handleLogin();
  } else {
    print(" Form is invalid. failed");
  }

    
  },
  text: "Login",
  isWeb: isWeb,
  isTablet: isTablet,
  backgroundColor: AppColours.blue,
  textStyle: AppTextStyles.buttonStyle,
  loadingColor: AppColours.background,
),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.off(() => const ForgotPassword());
                              },
                              child: Text("Forgot Password?", style: AppTextStyles.textButton),
                            ),
                           
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
