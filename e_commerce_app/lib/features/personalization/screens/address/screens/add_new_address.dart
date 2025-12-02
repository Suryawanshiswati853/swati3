import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';

class AddNewAddress extends StatelessWidget{
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true,title: Text('Add new Address'),),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsetsGeometry.all(TSizes.defaultSpace),
        child: Form(
          child: Column(
          children: [
            TextFormField(decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.user),
              labelText: 'Name',

            ),),
            SizedBox(height: TSizes.spaceBetInputFields,),
             TextFormField(decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.mobile),
              labelText: 'Mobile',

            ),),
            SizedBox(height: TSizes.spaceBetInputFields,),
            Row(
              children: [
               Expanded(
                 child: TextFormField(decoration: InputDecoration(
                               prefixIcon: Icon(Iconsax.building_32),
                               labelText: 'Street',
                 
                             ),),
               ),
            SizedBox(width: TSizes.spaceBetInputFields,),
             Expanded(
               child: TextFormField(decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.code),
                labelText: 'Postal Code',
               
                           ),),
             ),

            ],),
             SizedBox(height: TSizes.spaceBetInputFields,),

             Row(
              children: [
               Expanded(
                 child: TextFormField(decoration: InputDecoration(
                               prefixIcon: Icon(Iconsax.building),
                               labelText: 'City',
                 
                             ),),
               ),
            SizedBox(width: TSizes.spaceBetInputFields,),
             Expanded(
               child: TextFormField(decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.activity),
                labelText: 'State',
               
                           ),),
             ),

          ],
        ),
        SizedBox(height: TSizes.spaceBetInputFields,),
        
                TextFormField(decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.global),
                labelText: 'Country',
               
                           ),),
             SizedBox(height: TSizes.defaultSpace,),
             SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text('Save')),)


        ]),
      ),
    )));
  }
  
}