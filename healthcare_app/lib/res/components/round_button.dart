import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/constants.dart';



class RoundedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double borderRadius;
  final double? height;
  final double? width;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color borderColor;
  final TextStyle? textStyle;
  final bool isLogin ;

  const RoundedButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = const Color(0xFF407CE2),
    this.borderRadius = 30.0,
    this.height,
    this.width,
    this.fontFamily,
    this.fontWeight,
    this.borderColor = Colors.black,
    this.textStyle,
    this.isLogin=false, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(
            color: isLogin ? borderColor : BlueColour, 
          ),
          ),
        ),
        child: Stack(
          children: [
            Text(
              text,
              style: textStyle ?? TextStyle(
                color: Colors.white,
                fontFamily: fontFamily,
                fontWeight: fontWeight,
                fontSize: text=='Checkout'||text=='Buy'|| text  == 'Confirm Location'?14:16,
              ),
            ),
            if (text == 'Login')
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontWeight: fontWeight,
                      fontSize: 16, 
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1 
                        ..color = borderColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


