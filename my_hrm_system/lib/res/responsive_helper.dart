import 'package:my_hrm_system/res/imports.dart';


class ResponsiveHelper {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;
      /// Width Percentage
  static double wp(BuildContext context, double percent) =>
      MediaQuery.of(context).size.width * percent / 100;

  /// Height Percentage
  static double hp(BuildContext context, double percent) =>
      MediaQuery.of(context).size.height * percent / 100;

  /// Scalable Font Size
  static double sp(BuildContext context, double scale) {
    double width = MediaQuery.of(context).size.width;
    if (isDesktop(context)) return width * scale / 100 * 1.2;
    return width * scale / 100;
  }
}
