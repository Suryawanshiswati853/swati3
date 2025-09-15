import 'package:my_hrm_system/res/imports.dart';


class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool hasToggle;
  final bool showPassword;
  final VoidCallback? togglePassword;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
     this.prefixIcon,
    this.obscureText = false,
    this.hasToggle = false,
    this.showPassword = false,
    this.togglePassword,
      this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
     autovalidateMode: AutovalidateMode.onUserInteraction,

      style: AppTextStyles.Style,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.hintText,
        prefixIcon: Icon(prefixIcon),
        prefixIconColor: AppColours.blue,
        suffixIcon: hasToggle
            ? IconButton(
                icon: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                  color: AppColours.onPrimary,
                ),
                onPressed: togglePassword,
              )
            : null,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border:  OutlineInputBorder(
                    borderSide:  BorderSide(color: Color.fromARGB(115, 108, 105, 105)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(115, 108, 105, 105)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(115, 108, 105, 105), width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}




