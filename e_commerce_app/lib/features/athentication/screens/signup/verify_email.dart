import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_commerce_app/utils/constants/texts.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import '../../controllers/signup/verify_email_controller.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';
import 'package:e_commerce_app/utils/helpers/helpers_function.dart';
import 'package:e_commerce_app/features/athentication/screens/login/login.dart';
import 'package:e_commerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';


class emailVerifyScreen extends StatelessWidget {
  const emailVerifyScreen({super.key,this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> AuthenticationRepository.Instance.logout(), icon: Icon(CupertinoIcons.clear))
        ],
      
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage(TImages.productEmailIssulation,),width: THelpersFunction.screenWidth()*0.6),
               const SizedBox(height: TSizes.spaceBetSections),

              
            
              Text(TText.confirmEmail,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),

              const SizedBox(height: TSizes.spaceBetItems),
            Text(email??'',style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBetItems),

              /// Title
            
              Text(TText.confirmEmailSubtitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
                            const SizedBox(height: TSizes.spaceBetSections),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: ()=>controller.checkEmailVerificationStatus(),
                                  
                                  child:  const Text(TText.tContinue)
                                )
                              ),
                               const SizedBox(height: TSizes.spaceBetSections),
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: ()=>controller.sendEmailVerification(),
                                  child:  const Text(TText.resendEmail)
                                )
                              )



          ]))));
  }
}