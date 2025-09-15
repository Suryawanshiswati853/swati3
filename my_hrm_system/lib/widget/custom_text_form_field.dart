import 'package:my_hrm_system/res/imports.dart';

class NewCustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hintText;
  final TextInputType keyboardType;
  final VoidCallback? onTap;
  final bool obscureText;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final bool readOnly;
  final int? maxLines;
  final TextCapitalization textCapitalization;
   final List<TextInputFormatter>? inputFormatters;
   final TextStyle? errorStyle; 

  const NewCustomTextFormField({
    Key? key,
    required this.controller,
     this.label,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.readOnly = false,
    this.maxLines = 1,
   this.errorStyle,
    this.textCapitalization = TextCapitalization.sentences,
    this.onTap,this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      EdgeInsets padding = ResponsiveHelper.isMobile(context)
          ? const EdgeInsets.symmetric(horizontal: 10)
          : ResponsiveHelper.isTablet(context)
              ? const EdgeInsets.symmetric(horizontal: 40)
              : const EdgeInsets.symmetric(horizontal: 80);

      EdgeInsets contentPadding = ResponsiveHelper.isMobile(context)
          ? const EdgeInsets.symmetric(horizontal: 20, vertical: 12)
          : ResponsiveHelper.isTablet(context)
              ? const EdgeInsets.symmetric(horizontal: 30, vertical: 14)
              : const EdgeInsets.symmetric(horizontal: 40, vertical: 18);
   
    return Padding(
      padding: padding,
      child: TextFormField(
        onTap: onTap,

        controller: controller,
        
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        readOnly: readOnly,
        maxLines: maxLines,
        
              autovalidateMode: AutovalidateMode.onUserInteraction,
               inputFormatters: inputFormatters,
        
        textCapitalization: textCapitalization,
        decoration: InputDecoration(
          errorStyle: errorStyle,
          labelText: label,
          hintText: hintText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null
              ? GestureDetector(
                  onTap: onSuffixIconTap,
                  child: Icon(suffixIcon),
                )
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
