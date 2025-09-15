import 'package:my_hrm_system/res/imports.dart';


class ResetPassword extends StatefulWidget {
   final String email;
  const ResetPassword({Key? key, required this.email}) : super(key: key);
  // const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  final TextEditingController emailController           = TextEditingController();
  final TextEditingController otpController             = TextEditingController();
  final TextEditingController passwordController        = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
    final AuthController myAuthController = Get.put(AuthController());

  
  final _formKey    = GlobalKey<FormState>();
   @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    otpController .dispose();
    confirmPasswordController.dispose();
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
        init: AuthController(),
        builder: (authController) {
     return  SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(allPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              /// Icon Button
              Center(
                child: Container(
                 height: isWeb ? 50 : isTablet ? 45 : 35,
                  decoration: BoxDecoration(
                    color: AppColours.blue,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.lock,
                        size: 25, color: AppColours.onPrimary),
                  ),
                ),
              ),
               SizedBox(height: isWeb ? 20 : isTablet ? 15 : 10),

              /// Title
              Center(
                child: Text("Reset Password", style: AppTextStyles.appbar),
              ),

              /// Divider
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

              /// Form inside Card
              Form(
                key: _formKey,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius2),
                  ),
                  elevation: 8,
                  color: AppColours.fill3,
                  child: Padding(
                    padding:  EdgeInsets.all(newPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.to(AdminLoginScreen());
                              
                              },
                              icon: const Icon(Icons.arrow_back),
                              color: AppColours.blue,
                            ),
                             SizedBox(width: isWeb ? 15 : isTablet ? 10 : 5),
                            Text("Back", style: AppTextStyles.textButton),
                          ],
                        ),
                       SizedBox(height: isWeb ? 20 : isTablet ? 15 : 10),

                        // OTP Field
                        Text("OTP code", style: AppTextStyles.buttonStyle),
                       SizedBox(height: isWeb ? 20 : isTablet ? 15 : 10),
                          CustomTextFormField(
      controller: otpController,
      hintText: 'Enter otp code sent to your email',
      validator: Validation.validateOtp,
      prefixIcon: Icons.key,
    ),
                      
                       SizedBox(height: isWeb ? 20 : isTablet ? 15 : 10),

                        // New Password Field
                        Text("New Password", style: AppTextStyles.buttonStyle),
                        SizedBox(height: isWeb ? 20 : isTablet ? 15 : 10),
                         CustomTextFormField(
      controller: passwordController,
      hintText: 'Enter your password',
      validator:  Validation.validatePassword,
      prefixIcon: Icons.lock,
      obscureText: !myAuthController.showPassword,
      hasToggle: true,
      showPassword: myAuthController.showPassword,
      togglePassword: myAuthController.togglePassword,
    ),
                       
                        SizedBox(height: isWeb ? 20 : isTablet ? 15 : 10),

                        // Confirm Password Field
                        Text("Confirm Password", style: AppTextStyles.buttonStyle),
                        SizedBox(height: isWeb ? 20 : isTablet ? 15 : 10),
                         CustomTextFormField(
      controller: confirmPasswordController,
      hintText: 'Enter your password',
      validator: (value) => Validation.validateConfirmPassword(
          value,
          passwordController.text,
        ),      prefixIcon: Icons.lock,
      obscureText: !myAuthController.showPassword,
      hasToggle: true,
      showPassword: myAuthController.showPassword,
      togglePassword: myAuthController.togglePassword,
    ),
                     
                         SizedBox(height: isWeb ? 45 : isTablet ? 35 : 25),

CustomButton(
  isLoading: authController.isLoading,
  onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await authController.resetPassword(
                 widget.email,
                  passwordController.text,
                  confirmPasswordController.text,
                  otpController.text,
                );
              }
    // if (_formKey.currentState!.validate()) {
    //   await authController.forgotPassword(emailController.text);
    //   if (!authController.isLoading) {
    //     Get.to(() => ResetPassword(email: emailController.text));
    //   }
    // }
  },
  
  text: "Update Password",
  isWeb: isWeb,
  isTablet: isTablet,
  backgroundColor: AppColours.blue,
  textStyle: AppTextStyles.buttonStyle,
  loadingColor: AppColours.background,
)

      //                   MaterialButton(
      //                     height: isWeb ? 75 : isTablet ? 65 : 55,
      //                     minWidth: double.infinity,
      //                     color: AppColours.blue,
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(10.0),
      //                     ),
      //                     elevation: 5.0,
      //                      onPressed: authController.isLoading
      //     ? null
      //     : () async {
      //         if (_formKey.currentState!.validate()) {
      //           await authController.resetPassword(
      //            widget.email,
      //             passwordController.text,
      //             confirmPasswordController.text,
      //             otpController.text,
      //           );
      //         }
      //       },
      // child: authController.isLoading
      //     ? const CircularProgressIndicator(
      //         valueColor: AlwaysStoppedAnimation<Color>(AppColours.background),
      //       )
      //     : 
                        
                        
      //                         const Text(
      //                             "Update Password",
      //                             textAlign: TextAlign.center,
      //                             style: AppTextStyles.buttonStyle,
      //                           ),
      //                   ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );} ),
    );
  }
}