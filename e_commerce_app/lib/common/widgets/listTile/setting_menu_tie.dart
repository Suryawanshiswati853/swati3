import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';

class TSettingMenuTile extends StatelessWidget{

  const TSettingMenuTile({super.key, required this.icon, required this.title, required this.subtitle, this.trailing, this.onTap});
    final IconData icon;
    final String title,subtitle;
    final Widget? trailing;
    final VoidCallback? onTap;
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,size: 28,color: TColors.primaryColour,),
           title: Text(title,style: Theme.of(context).textTheme.titleMedium!.apply(color:THelpersFunction.isDarkMode(context)?TColors.light:TColors.black),),
     subtitle: Text(subtitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: THelpersFunction.isDarkMode(context)?TColors.light:TColors.black),),
     trailing: trailing,
     onTap: onTap,

    );
  }
  
}