import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key, this.textColour, required this.text,  this.buttonTitle='view all',  this.showactionButton=true, this.onPressed,
  });
  final Color? textColour;
  final String text,buttonTitle;
  final bool showactionButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
       Text(text,style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColour),maxLines: 1,overflow: TextOverflow.ellipsis,),
  if(showactionButton)
  TextButton(
    onPressed: onPressed,
   child: Text(buttonTitle)
   )
    ]);
  }
}

