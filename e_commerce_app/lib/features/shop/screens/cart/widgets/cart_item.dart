import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/common/widgets/products/cart/widgets/cart_item.dart';
import 'package:e_commerce_app/common/widgets/products/product/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/products/cart/widgets/add_remove_button.dart';

class TcartItems extends StatelessWidget {
  const TcartItems({
    super.key,  this.showAddandRemoveButton=true,
  });
  final bool showAddandRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 2,
      shrinkWrap: true,
      separatorBuilder: (_, _) {
        return  const SizedBox(height: TSizes.spaceBetSections);
      },
    
      itemBuilder: (_, index) {
        return   Column(

          children: [
            TCartItems(),
          if(showAddandRemoveButton) const SizedBox(height:TSizes.spaceBetItems),
          if(showAddandRemoveButton)
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 70,),
                    ///add remove buttons
                TProductQtyWithaddandremoveButton(),
                  ],
                ),
                                    SizedBox(width: TSizes.md,),

                
               TProductPriceText(price: '256')
    
                
                  
    
    
              ],
            )
          ],
        );
      },
    );
  }
}

