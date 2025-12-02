import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/product/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.sort),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TSizes.md),
            ),
          ),
          items:
              [
                    'Name',
                    'Higher Price',
                    'Lower Price',
                    'Populalarity',
                    'Sale'
                    'Newest',
                  ]
                  .map(
                    (option) => DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    ),
                  )
                  .toList(),
          onChanged: (value) {},
        ),
        SizedBox(height: TSizes.spaceBetSections),
    
        // products
        TGridLayout(
          itemCount: 6,
          itemBuilder: (_, index) => const TProductCardVertical(),
        ),
      ],
    );
  }
}
