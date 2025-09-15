import 'package:my_hrm_system/res/imports.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String text;
  final double borderRadius;
  final double? height;
  final bool isWeb;
  final bool isTablet;
  final Color backgroundColor;
  final TextStyle textStyle;
  final Color loadingColor;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.isLoading,
    required this.text,
    this.borderRadius = 8.0,
    this.height,
    this.isWeb = false,
    this.isTablet = false,
    required this.backgroundColor,
    required this.textStyle,
    required this.loadingColor,
  }) : super(key: key);

  double getButtonHeight() {
    if (height != null) return height!;
    if (isWeb) return 75;
    if (isTablet) return 65;
    return 55;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: getButtonHeight(),
      minWidth: double.infinity,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: 5.0,
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(loadingColor),
            )
          : Text(
              text,
              textAlign: TextAlign.center,
              style: textStyle,
            ),
    );
  }
}
