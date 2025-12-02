import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Iconsax.star5, color: Colors.amber, size: 24),
            SizedBox(width: TSizes.spaceBetItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '5.0',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(text: '(199)'),
                ],
              ),
            ),
          ],
        ),

        ///share icon
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share, size: TSizes.iconMd),
        ),
      ],
    );
  }
}
