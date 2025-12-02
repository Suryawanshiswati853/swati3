import 'package:flutter/material.dart';

class TCheckBoxTheme{
  TCheckBoxTheme._();
  static CheckboxThemeData lightChekboxTheme=CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states){
      if(states.contains(MaterialState.selected)){
        return Colors.white;

      }else{
        return Colors.black;
      }
    }
    ),
    fillColor:  MaterialStateProperty.resolveWith((states){
      if(states.contains(MaterialState.selected)){
        return Colors.blue;

      }else{
        return Colors.transparent;
      }
    }
  ));
  static CheckboxThemeData darkChekboxTheme=CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states){
      if(states.contains(MaterialState.selected)){
        return Colors.white;

      }else{
        return Colors.black;
      }
    }
    ),
    fillColor:  MaterialStateProperty.resolveWith((states){
      if(states.contains(MaterialState.selected)){
        return Colors.blue;

      }else{
        return Colors.transparent;
      }
    }
  ));
}