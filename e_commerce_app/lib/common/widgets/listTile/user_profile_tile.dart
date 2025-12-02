import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';


class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key, required this.onPressed, 
    //this.title, this.subtitle,this.onTap
  });
  // final String? title,subtitle;
   final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;
    return ListTile(
     leading: TCircularImage(image: TImages.user,width: 50,height: 50,padding: 0,),
     title: Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.textwhite),),
     subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.textwhite),),
    
     trailing: IconButton(
       icon:const Icon(Iconsax.edit,color: TColors.textwhite,),
       onPressed: onPressed,
     ),
    
    );
  }
}

   