import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import '../../../athentication/screens/changeName/change_name.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/common/widgets/shimmer/TShimmerEffect.dart';
import 'package:e_commerce_app/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/profile_menu.dart' show TProfileMenu;



class ProfileScreen extends StatelessWidget {

   ProfileScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
        final controller=UserController.instance;

     return Scaffold(
      appBar: TAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsetsGeometry.all(TSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                 Obx((){
                  final userImage=controller.user.value.profilePicture;
                  final image=userImage.isNotEmpty?userImage:TImages.user;

                return 
                controller.imageLoading.value? const TShimmerEffect(width: 80, height: 80,radius: 80,)
                 : TCircularImage(image:image,width: 80,height: 80,isNetworkImage: userImage.isNotEmpty,);

                 } ),
                  TextButton(onPressed: ()=> controller.uploadImageProfile(), child:const Text('Change Profile Photo'))
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBetItems /2,),
           const  Divider(),
             const SizedBox(height: TSizes.spaceBetItems),
           const  TSectionHeading(text: 'Profile Information',showactionButton: false,),
           const SizedBox(height: TSizes.spaceBetItems),
           TProfileMenu(onPressed: () =>Get.to(()=>ChangeName()), title: 'Name', value: controller.user.value.fullName,),
          TProfileMenu(onPressed: () {  }, title: 'UserName', value: controller.user.value.userName,),
            const SizedBox(height: TSizes.spaceBetItems),
           const  Divider(),
             const SizedBox(height: TSizes.spaceBetItems),
             const  TSectionHeading(text: 'Personal Information',showactionButton: false,),
            TProfileMenu(onPressed: () {  }, title: 'User Id',icon:Iconsax.copy, value: controller.user.value.id,),

           TProfileMenu(onPressed: () {  }, title: 'Email', value: controller.user.value.email,),

           TProfileMenu(onPressed: () {  }, title: 'Phone No', value: controller.user.value.phoneNumber,),

           TProfileMenu(onPressed: () {  }, title: 'Gender', value: 'Female',),
          TProfileMenu(onPressed: () {  }, title: 'Date of Birth', value: '31 jan 1999',),
           const  Divider(),
             const SizedBox(height: TSizes.spaceBetItems),
             Center(
              child: TextButton(onPressed: (){
                controller.deleteAccountwarningPopup();

              }, 
              child:const Text('Close Account',style: TextStyle(color: Colors.red),),
             )
             ),








          ],
        ),
        ),

      )
      );
  }
}

