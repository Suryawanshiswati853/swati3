import 'package:get/get.dart';
import 'add_new_address.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/screens/address/widgets/single_address.dart';


class UserAddressScreen extends StatelessWidget{
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primaryColour,
        onPressed: ()=>Get.to(()=>const AddNewAddress(),),
      child:const Icon(Iconsax.add,color: TColors.textwhite),),
      appBar:TAppBar(
        showBackArrow: true,
        title: Text('Addresses',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsetsGeometry.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TSingleAddress(selectedAddress:false ),
            TSingleAddress(selectedAddress:true ),
            TSingleAddress(selectedAddress:false ),
             TSingleAddress(selectedAddress:true ),



           
          ],
        ),
        ),
      ),
    );
  }
}
  
