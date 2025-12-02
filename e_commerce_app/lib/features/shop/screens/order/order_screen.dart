import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/shop/screens/order/widgets/order_list.dart';

class Orderscreen extends StatelessWidget {
  const Orderscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:TAppBar(title: Text('My  Orders', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true,),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        // orders list
        child: TOrderListitems(),
      ),
    );
  }
}