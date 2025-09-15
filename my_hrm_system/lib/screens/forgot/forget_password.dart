import 'package:my_hrm_system/res/imports.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
    final AuthController authController = Get.put(AuthController());

      
    final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
   @override
  void dispose() {
    emailController.dispose();
  
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
                  decoration: BoxDecoration(
                    color: AppColours.blue,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                   height: isWeb ? 50 : isTablet ? 45 : 35,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.key,
                        size: 25, color: AppColours.onPrimary),
                  ),
                ),
              ),
                          SizedBox(height: isWeb ? 20 : isTablet ? 15 : 10),


              /// Title
              Center(
                child: Text("Forgot Password", style: AppTextStyles.appbar),
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
                       SizedBox(height: isWeb ? 30 : isTablet ? 25 : 20),
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
                            Text("Back to Login",
                                style: AppTextStyles.textButton),
                          ],
                        ),

                         SizedBox(height: isWeb ? 20 : isTablet ? 15 : 10),
                        Text("Email Address",
                            style: AppTextStyles.Style),
                         SizedBox(height: isWeb ? 20 : isTablet ? 15 : 10),

                        /// Email Field
                          CustomTextFormField(
      controller: emailController,
      hintText: 'Enter your email',
      validator:  Validation.validateEmail ,
      //validator: (value) => value == null || value.isEmpty ? 'Please enter email' : null,
      prefixIcon: Icons.email,
    ),
                       

                          SizedBox(height: isWeb ? 55 : isTablet ? 45 : 35),


                        /// Send OTP and Continue Button
                         CustomButton(
  isLoading: authController.isLoading,
  onPressed: () async {
    if (_formKey.currentState!.validate()) {
      await authController.forgotPassword(emailController.text);
      if (!authController.isLoading) {
        Get.to(() => ResetPassword(email: emailController.text));
      }
    }
  },
  text: "Send OTP and Continue",
  isWeb: isWeb,
  isTablet: isTablet,
  backgroundColor: AppColours.blue,
  textStyle: AppTextStyles.buttonStyle,
  loadingColor: AppColours.background,
)
                  
                      
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }));
  }
}