import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/common/widgets/listTile/setting_menu_tie.dart';
import 'package:e_commerce_app/features/shop/screens/order/order_screen.dart';
import 'package:e_commerce_app/common/widgets/listTile/user_profile_tile.dart';
import 'package:e_commerce_app/features/athentication/screens/login/login.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/primary_header_container.dart';
import 'package:e_commerce_app/features/personalization/screens/address/screens/address.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';

class SettingScreen extends StatelessWidget {

   SettingScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          TPrimaryHeaderContainer(child: Column(
            children: [
              TAppBar(title: Text('Account',style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.textwhite),),),
             TUserProfileTile(onPressed: ()=>Get.to(ProfileScreen()),),
             const  SizedBox(height: TSizes.spaceBetSections,),


            ],
          )
          ),
          Padding(padding:const EdgeInsetsGeometry.all(TSizes.defaultSpace),
          child: Column(
            children: [
            const  TSectionHeading(text: 'Account Settings',showactionButton:false),
              const  SizedBox(height: TSizes.spaceBetItems),
              TSettingMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subtitle: 'Set shopping delivery address',onTap: ()=>Get.to(()=> const UserAddressScreen()),),
              TSettingMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subtitle: 'Add,remove products and move to checkout',onTap: ()=>Get.to(()=>cartScreen()),),
              TSettingMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subtitle: 'In-progress and Completed Orders',onTap: ()=>Get.to(()=>const Orderscreen()),),
              TSettingMenuTile(icon: Iconsax.bank, title: 'Bank Account', subtitle: 'Withdraw balance to registered bank account',onTap: (){},),
              TSettingMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subtitle: 'List of all the discounted coupons',onTap: (){},),
              TSettingMenuTile(icon: Iconsax.notification, title: 'notifications', subtitle: 'Set any kind of notification message',onTap: (){},),

               TSettingMenuTile(icon: Iconsax.security_card, title: 'Account Privancy', subtitle: 'Manage data usage and connected accounts',onTap: (){},),
                const  SizedBox(height: TSizes.spaceBetItems),
                const  TSectionHeading(text: 'Account Settings',showactionButton:false),
                const  SizedBox(height: TSizes.spaceBetItems),
              TSettingMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subtitle: 'Upload Data to your Cloud Firebase',onTap: (){},),
              TSettingMenuTile(icon: Iconsax.location, title: 'GeoLocation', subtitle: 'Set recommendation based on location',trailing: Switch(value:true,onChanged: (value){},),),
              TSettingMenuTile(icon: Iconsax.security_user, title: 'Safe Mode', subtitle: 'Search result is safe for all ages',trailing: Switch(value:true,onChanged: (value){})),

              TSettingMenuTile(icon: Iconsax.image, title: 'HD Image Quality', subtitle: 'Set image quality to be seen',trailing: Switch(value:true,onChanged: (value){})),
              const  SizedBox(height: TSizes.spaceBetSections),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(onPressed: ()=>AuthenticationRepository.Instance.logout(), child: const Text('Logout')),
              ),
             const  SizedBox(height: TSizes.spaceBetSections*2.5),













            ],
          ),
          )
          ],
        ),
      )
    );
  }

  }

