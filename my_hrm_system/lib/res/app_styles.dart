import 'package:flutter/foundation.dart';
import 'package:my_hrm_system/res/imports.dart';

class AppTextStyles {
  static TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColours.onPrimary,
  );
  static final TextStyle dialog = TextStyle(
    fontSize: 15,
    color: AppColours.onBackground,
  );

  static  TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColours.primaryVariant,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColours.onBackground,
  );
   static const TextStyle bodyText2 = TextStyle(
    fontSize: 16,
     fontWeight: FontWeight.w600,

    color: AppColours.onBackground,
  );
  static const TextStyle bodyText3 = TextStyle(
    fontSize: 18,
     fontWeight: FontWeight.bold,

    color: AppColours.onBackground,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColours.onBackground,
  );
   static const TextStyle caption2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColours.onBackground,
  );
  static const TextStyle caption3 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: AppColours.fill3,
   
  ); //
   static const TextStyle captiongrey = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w100,
    color: AppColours.gray,
   
  ); //
  
   static const TextStyle title = TextStyle(
    fontSize: 16,
    color: AppColours.primary,
  );
  static const TextStyle textButton = TextStyle(
    fontSize: 16,
    color: AppColours.blue,
  );
  static const TextStyle textButton2 = TextStyle(
    fontSize: 16,
    color: AppColours.gray,
  );
  static const TextStyle appbar = TextStyle(
    fontSize: 20,
    fontWeight:FontWeight.bold,
    color: AppColours.onPrimary,
  );
  static const TextStyle buttonStyle = TextStyle(
    fontSize: 16,
    color: AppColours.onPrimary,
  );
  static const TextStyle Style = TextStyle(
    fontSize: 14,
    color: AppColours.onPrimary,
  );
   static const TextStyle hintText = TextStyle(
    fontSize: 16,

    color: AppColours.gray,
  );
   static const TextStyle heading3 = TextStyle(
    fontSize: 18,
    color: AppColours.onPrimary,
    fontWeight: FontWeight.w600
  );
  static const TextStyle containerHeading= TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColours.background);
  static const TextStyle leavestitle=TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColours.background);
   static const TextStyle heading5 = TextStyle(
    fontSize: 14,
    color: AppColours.primary,
    fontWeight: FontWeight.w200
  );
   static const TextStyle heading8 = TextStyle(
    fontSize: 14,
    color: AppColours.onBackground,
    fontWeight: FontWeight.w200
  );
   static const TextStyle tableRows= TextStyle(
    fontSize: 16,
    color: AppColours.onPrimary,
    fontWeight: FontWeight.bold
  );
  static TextStyle appBar(BuildContext context) {
    double fontSize = _getFontSize(context, 20, 22, 24);
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle body(BuildContext context) {
    double fontSize = _getFontSize(context, 15, 17, 19);
    return TextStyle(
      fontSize: fontSize,
      color: Colors.white,
    );
  }
  static double _getFontSize(BuildContext context, double mobileSize, double tabletSize, double desktopSize) {
    double width = MediaQuery.of(context).size.width;
    
   if (kIsWeb) {
  //  if (Platform.isIOS) {
      mobileSize += 1.5; 
      tabletSize += 2;
      desktopSize += 2.5;
    }

    if (width < 600) {
      return mobileSize; // Mobile
    } else if (width < 1200) {
      return tabletSize; // Tablet
    } else {
      return desktopSize; // Desktop
    }
  }
}
  

