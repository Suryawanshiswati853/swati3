import 'package:flutter/material.dart';

class TBottomSheetTheme{
  TBottomSheetTheme._();
  static BottomSheetThemeData lightBottomSheetDataTheme=BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))

  );
   static BottomSheetThemeData darkBottomSheetDataTheme=BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.black,
    modalBackgroundColor: Colors.black,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))

  );
}