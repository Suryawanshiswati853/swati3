import 'package:flutter/cupertino.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';

class TShadowsStyle{

  static final verticalProductShadow=BoxShadow(
    color: TColors.darkgrey.withOpacity(0.1),
  blurRadius: 50,
  spreadRadius: 7,
  offset: const Offset(0, 2)
  );
    static final horizontalProductShadow=BoxShadow(
    color: TColors.darkgrey.withOpacity(0.1),
  blurRadius: 50,
  spreadRadius: 7,
  offset: const Offset(0, 2)
  );
}