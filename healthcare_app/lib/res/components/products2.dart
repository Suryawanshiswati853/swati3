import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/constants.dart';
import 'package:healthcare_app/screens/pharmancy2.dart';

class ProductRow extends StatelessWidget {
  const ProductRow({
    Key? key,
    required this.products,
    required this.containerWidth,
    required this.containerHeight,
    required this.imageHeight,
    required this.imageWidth,
    required this.newheight4,
    required this.newwidth,
  }) : super(key: key);

  final List<Map<String, dynamic>> products;
  final double containerWidth;
  final double containerHeight;
  final double imageHeight;
  final double imageWidth;
  final double newheight4;
  final double newwidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Row(
          children: products.map((product) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PharmancyScreen2()),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                width: product['containerWidth'] ?? containerWidth,
                height: product['containerHeight'] ?? containerHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: GreyColour),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      product['imagePath'],
                      height: product['imageHeight'] ?? imageHeight,
                      width: product['imageWidth'] ?? imageWidth,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['productName'],
                          style: BlackTextStyle12withBold,
                        ),
                        Text(
                          product['quantity'],
                          style: GreyTextStyle9,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: product['newheight4'] ?? newheight4),
                        Text(
                          product['price'],
                          style:BlackTextStyle14Bold,
                        ),
                        Stack(
                          children: [
                            Text(
                              product['discountedPrice'],
                              style: BlackTextStyle8,
                            ),
                            Positioned(
                              bottom: 5,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 1,
                                color: underLineColour,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: product['newwidth'] ?? newwidth),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: BlueColour,
                          ),
                          child: const Icon(Icons.add, color: whiteColour),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
