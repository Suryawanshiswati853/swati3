

import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/Products1.dart';
import 'package:healthcare_app/res/components/TextFormfield.dart';
import 'package:healthcare_app/res/components/animation_widget.dart';
import 'package:healthcare_app/res/components/app_bar.dart';
import 'package:healthcare_app/res/components/constants.dart';
import 'package:healthcare_app/res/components/products2.dart';
import '../model/productData.dart';

class PharmancyScreen extends StatefulWidget {
  @override
  _PharmancyScreenState createState() => _PharmancyScreenState();
}

class _PharmancyScreenState extends State<PharmancyScreen> {
  
   List<ProductData> products = [
    ProductData(
      imagePath: 'assets/Image11.png',
      productName: 'Panadol',
      quantity: '20 pcs',
      price: '\$15.99',
    ),
    ProductData(
      imagePath: 'assets/Image12.png',
      productName: 'Bodrex Herbal',
      quantity: '100ml',
      price: '\$7.99',
    ),
    ProductData(
      imagePath: 'assets/Image13.png',
      productName: 'Panadol',
      quantity: '3pcs',
      price: '\$5.99',
    ),
  ];
   List<Map<String, dynamic>> products2 = [
      {
        'imagePath': 'assets/Image11.png',
        'productName': 'OBH Combi',
        'quantity': '75ml',
        'price': '\$9.99',
        'discountedPrice': '\$10.99',
       
      },
      {
        'imagePath': 'assets/Image12.png',
        'productName': 'Betadine',
        'quantity': '50ml',
        'price': '\$6.99',
        'discountedPrice': '\$68.00',
       
      },
      {
        'imagePath': 'assets/Image13.png',
        'productName': 'Bodrexin',
        'quantity': '75ml',
        'price': '\$7.99',
        'discountedPrice': '\$10.99',
        
      },
    ];


  TextEditingController searchController=TextEditingController();
 
  @override
  Widget build(BuildContext context) {
       final newheight2=MediaQuery.of(context).size.height*0.03;
            final newheight3=MediaQuery.of(context).size.height*0.01;
                        final newwidth=MediaQuery.of(context).size.width*0.010;
                        final newheight4=MediaQuery.of(context).size.height*0.065;
               double screenWidth = MediaQuery.of(context).size.width;
                 double containerWidth = screenWidth * 0.3; 
              double Containerheight = screenWidth * 0.4;
           final Imagewidth=MediaQuery.of(context).size.width*0.3;
            final Imageheight=MediaQuery.of(context).size.height*0.8;
    return  Scaffold(
      body: SingleChildScrollView(
         child:SlideInWidget(
          delay: 200,
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
                height: newheight2,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10,left: 10),
                child: Transform.translate(
                  offset: const Offset(14.0, 6.0),
                  child: Image.asset('assets/Frame 2.png',
                      fit: BoxFit.cover),
                ),
              ),
          SimpleAppBar(
          backgroundColor: whiteColour,
         leadingIcon: Icons.arrow_back_ios,
         leadingIconColor: blackColour,
         leadingIconOnPressed: (){
           Navigator.pop(context); 
         },
           
           title: 'Pharmancy',
           ),
             Padding(padding: const EdgeInsets.all(20),
         child:  Column(
            children:[
               TextFormFieldWidget(
            hintText: 'Search drugs,Category...',
            controller: searchController, 
            prefixIconData: Icons.search,
            hintTextColor: newColour,
            fontFamily: 'Poppins',
            fontSize: 14,
            fillColor:fillColour ,
            borderColor: const Color.fromRGBO(64, 124, 226, 0.39),
            keyboardType: TextInputType.name,
            prefixColor:iconColour,
            borderRadius: 25.0,
                 ),
           SizedBox(
            height: newheight2,
           ),
           Padding(padding:  const EdgeInsets.only(left: 9),
           child:   Container(
                  width:MediaQuery.of(context).size.width*1.0,
                       height:MediaQuery.of(context).size.height*0.2,
                  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: const Color.fromRGBO(227, 234, 246, 0.922),
    border: Border.all(color: GreyColour),
  ),
                child: Padding(padding: const EdgeInsets.only(left: 10),
             child:   Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          SizedBox(
          height: newheight2,
        ),
                     
                        const Text(
        'Order quickly with \nPrescription !',
        style: BlackTextStyle18Bold,
      ),
      SizedBox(
        height: newheight3,
      ),
                      
                   Container(
                    decoration: BoxDecoration(
                    
                      
                    ),
                   
 child:  Padding(padding:const EdgeInsets.only(right: 0,),
        child:  ElevatedButton( 
                         
              onPressed: () { 

               }, child: const Text('Upload Prescription',style: TextStyle(
                                color: whiteColour,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
               ),),
               style: ElevatedButton.styleFrom(
    backgroundColor: BlueColour, 
    shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
  ),
               
            )
      ),


                       
                    )],
                    ),
        
                  
                    Image.asset(
                      'assets/Mask2.png',
                      height: Imageheight,
                      width: Imagewidth,
                    ),
                  ],
                ),
              ),
           ),
           
         
    ),
    SizedBox(
      height: newheight3,
    ),
    
     const Padding(padding:  EdgeInsets.only(right: 10,left: 10),
  child:  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
           Text(
        'Popular Product',
        style: BlackTextStyle16withBold,
      ),
         Text(
        'see all',
        style: BlueTextStyle12,
      ),

      ],
    )
         )]
    )
    ),
    ProductScroll(
        products: products,
        containerWidth: containerWidth, 
        containerHeight: Containerheight, 
        newheight4: newheight4, 
        newwidth2: newheight2, 
      ),
     const Padding(padding:  EdgeInsets.only(right: 24,left: 28),
  child:  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
           Text(
        'Product on Sale',
        style: BlackTextStyle16withBold,
      ),
         Text(
        'see all',
        style: BlueTextStyle12,
      ),

      ],
    )),
    ProductRow(
  products: products2,
  containerWidth: containerWidth,
  containerHeight:Containerheight,
  imageHeight: 60.0,
  imageWidth: 50.0,
 newheight4: newheight4, 
  newwidth: newwidth, 
)


])

    )));
  }
}
           
