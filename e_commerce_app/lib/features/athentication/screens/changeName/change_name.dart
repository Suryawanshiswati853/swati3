import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/validators/validation.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/controllers/update_name_cotroller.dart';



class ChangeName  extends StatelessWidget{
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(updateUserController());
    return Scaffold(
      appBar: TAppBar(
        title: Text('Change Name',style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
        
      ),
      body: Padding(padding:  EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Use real name for verification . This name will appear on several pages',style: Theme.of(context).textTheme.headlineSmall,),
         
          const SizedBox(height: TSizes.spaceBetSections,),
          Form(
            key:controller.updateNameformKey ,
            child: Column(
            children: [
              TextFormField(
                expands: false,
              controller: controller.firstName,
              decoration:const InputDecoration(
                prefixIcon: Icon(Iconsax.user),
                labelText: TText.firstName
              ),
              validator: (value)=>TValidator.validatemptyfiled('First Name',value),
            ),
               const SizedBox(height: TSizes.spaceBetInputFields,),
              TextFormField(
                expands: false,
              controller: controller.lastName,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.user),
                labelText:  TText.lastName
              ),
              validator: (value)=>TValidator.validatemptyfiled('Last Name',value),
            ),
            ],
          )),
                         const SizedBox(height: TSizes.spaceBetSections,),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed:()=> controller.updateUserName(), child: Text('Save'))
          )
        ],
    )));
  }
}