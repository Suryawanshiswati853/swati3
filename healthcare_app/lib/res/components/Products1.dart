import 'package:flutter/material.dart';
import 'package:healthcare_app/model/productData.dart';
import 'package:healthcare_app/res/components/constants.dart';


class ProductScroll extends StatelessWidget {
  const ProductScroll({
    Key? key,
    required this.products,
    required this.containerWidth,
    required this.containerHeight,
    required this.newheight4,
    required this.newwidth2,
  }) : super(key: key);

  final List<ProductData> products;
  final double containerWidth;
  final double containerHeight;
  final double newheight4;
  final double newwidth2;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Row(
          children: products
              .map(
                (product) => ProductContainer(
                  containerWidth: containerWidth,
                  containerHeight: containerHeight,
                  imagePath: product.imagePath,
                  productName: product.productName,
                  quantity: product.quantity,
                  price: product.price,
                  newHeight4: newheight4,
                  newWidth2: newwidth2,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    Key? key,
    required this.containerWidth,
    required this.containerHeight,
    required this.imagePath,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.newHeight4,
    required this.newWidth2,
  }) : super(key: key);

  final double containerWidth;
  final double containerHeight;
  final String imagePath;
  final String productName;
  final String quantity;
  final String price;
  final double newHeight4;
  final double newWidth2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: GreyColour),
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 60,
            width: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: BlackTextStyle12withBold,
              ),
              Text(
                quantity,
                style:GreyTextStyle9,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: newHeight4,
              ),
              Text(
                price,
                style:BlackTextStyle14Bold,
              ),
              
              SizedBox(
                width: newWidth2,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: BlueColour
                ),
                child: Icon(
                  Icons.add,
                  color: whiteColour,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


