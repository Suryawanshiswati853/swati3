import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/animation_widget.dart';
import 'package:healthcare_app/res/components/constants.dart';
import 'package:healthcare_app/res/components/round_button.dart';
import 'package:healthcare_app/screens/home_screen.dart';
import '../res/components/app_bar.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
 
  @override
  Widget build(BuildContext context) {
            final newheight2=MediaQuery.of(context).size.height*0.03;
          final newheight1=MediaQuery.of(context).size.height*0.0010;
            double screenWidth = MediaQuery.of(context).size.width;
double containerWidth = 310; 
double Containerheight = screenWidth * 0.4;
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
           
           title: 'My Cart',
           ),
           SizedBox(
            height: newheight1,
           ),
           Padding(padding: const EdgeInsets.only(right: 10,left: 30),
          child: Container(
              width: containerWidth,
        height: Containerheight,
            decoration: BoxDecoration(
              
               border: Border.all(color: GreyColour),
              borderRadius: BorderRadius.circular(6.0)
            ),
         child:   Padding(padding: const EdgeInsets.only(right: 10,left: 5),
         child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Image.asset('assets/Image12.png', ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        const Text(
                          'OBH Combi',
                          style: BlackTextStyle20Bold,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
          icon: const Icon(Icons.delete_outline, color: newColour2),
          onPressed: () {},
        ),
                      ]),
                       
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          '75ml',
                          style: fentBlackTextStyle16,
                        ),  
                         Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                         const Icon(Icons.minimize,color: greyColour,),
                         const Padding(padding: EdgeInsets.only(right: 5,left: 5,top: 25,),
                       child:   Text(
                          '1',
                          style: BlackTextStyle20Bold,
                        ),
                        ),
                      
                         Padding(padding: const EdgeInsets.only(right: 5,left: 5,top: 25,),
                     child:   Container(
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: BlueColour
            ),
                      child:  const Icon(Icons.add,color: whiteColour,),
          ),                   
  ),
  const SizedBox(
    width: 29,
  ),
    const Text(
                          '\$9.99',
                          style: BlackTextStyle18Bold,
                        ),
                        
                      ])
                    ],
                    ),
                      ],
                ),
         ),
                


    ),
           ),
           const SizedBox(
            height: 10,
           ),
             Padding(padding: const EdgeInsets.only(right: 10,left: 30),
          child: Container(
              width: containerWidth,
        height: Containerheight,
            decoration: BoxDecoration(
              
               border: Border.all(color: GreyColour),
              borderRadius: BorderRadius.circular(6.0)
            ),
         child:   Padding(padding: const EdgeInsets.only(right: 10,left: 5),
         child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Image.asset('assets/Image14.png', ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                        const Text(
                          'Panadol',
                          style: BlackTextStyle20Bold,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        IconButton(
          icon: const Icon(Icons.delete_outline, color: newColour2),
          onPressed: () {},
        ),
                      ]),
                       
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          '75ml',
                          style: fentBlackTextStyle16,
                        ),  
                         Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                         const Icon(Icons.minimize,color: greyColour,),
                         const Padding(padding: EdgeInsets.only(right: 5,left: 5,top: 25,),
                       child:   Text(
                          '2',
                          style: BlackTextStyle20Bold,
                        ),
                        ),
                      
                         Padding(padding: const EdgeInsets.only(right: 5,left: 5,top: 25,),
                     child:   Container(
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: BlueColour
            ),
                      child:  const Icon(Icons.add,color: whiteColour,),
          ),                   
  ),
  const SizedBox(
    width: 29,
  ),
    const Text(
                          '\$19.99',
                          style: BlackTextStyle18Bold,
                        ),
                        
                      ])
                    ],
                    ),
                     ],
                ),
         ),
    ),
           ),
           SizedBox(
            height: newheight1,
           ),
           const Padding(padding: EdgeInsets.only(right: 10,left: 30,),
         child:  Text('Payment Detail',style: BlackTextStyle16withBold,)),
         const SizedBox(
          height: 10,
         ),
           const Padding(padding: EdgeInsets.only(right: 10,left: 30,),
           
      child:   Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
         Text('Subtotal',style: GreyTextStyle14,),
         Padding(padding: EdgeInsets.only(right: 10,left: 30,),
      child:   Text('\$25.98',style: GreyTextStyle14,)),


          ],
         ), 
    ),
    const SizedBox(
      height: 10,
    ),
     const Padding(padding: EdgeInsets.only(right: 10,left: 30,),
           
      child:   Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
         Text('Taxes',style: GreyTextStyle14,),
         Padding(padding: EdgeInsets.only(right: 10,left: 30,),
      child:   Text('\$1.00',style: GreyTextStyle14,)),


          ],
         )),
             const SizedBox(
      height: 20,
    ),
     const Padding(padding: EdgeInsets.only(right: 10,left: 30,),
           
      child:   Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
         Text('Total',style: BlackTextStyle14Bold,),
         Padding(padding: EdgeInsets.only(right: 10,left: 30,),
      child:   Text('\$26.98',style: BlackTextStyle14Bold,)),
          ],
         )),
         const SizedBox(
          height: 15,
         ),
         const Padding(padding:EdgeInsets.only(right: 14,left: 24),
    child:   Divider(),
       ),
         const Padding(padding: EdgeInsets.only(right: 10,left: 30,),
         child:  Text('Payment Method',style: BlackTextStyle16withBold,)),
          const SizedBox(
          height: 5,
         ),
           Padding(padding: const EdgeInsets.only(right: 10,left: 30),
          child: Container(
              width: 300,
        height: 50,
            decoration: BoxDecoration(
              
               border: Border.all(color: GreyColour),
              borderRadius: BorderRadius.circular(6.0)
            ),
         child:   const Padding(padding: EdgeInsets.only(right: 10,left: 5),
         child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        
         Text('VISA',style: darkTextStyle16Bold,),
         Padding(padding: EdgeInsets.only(right: 10,left: 30,),
      child:   Text('Change',style: GreyTextStyle14,)),
              
    ])
    
    )
    )
    ),
    Padding(padding: const EdgeInsets.only(right: 10,left: 30),
  child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        const SizedBox(
          height: 10,
        ),
         const Text('Total',style: GreyTextStyle14,),

     Padding(padding: const EdgeInsets.only(right: 10,left: 20),
         child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        
         const Text('\$28.99',style: BlackTextStyle18Bold,),
         Padding(padding: const EdgeInsets.only(right: 5,left: 5,),
      child:   RoundedButtonWidget(
        height: 45,
        width: 120,
        onPressed: () {
          _showPaymentSuccessDialog(context);

          },
      text: 'Checkout',
      fontFamily: 'Inter',
      )),
              
    ]))]))]))));
  }
}
void _showPaymentSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
         
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color:dilogcircle ,
           
          ),
            child: const Icon(Icons.done, color: BlueColour, size: 48)),
              const SizedBox(height: 50),
              const Text("Payment Success", style: BlackTextStyle20Bold),
              const SizedBox(height: 10),
              const Text(
                "Your payment has been \nsuccessful, you can have a \nconsultation session with \nyour trusted doctor",
                style: fentBlackTextStyle16,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              RoundedButtonWidget(
                height: 50,
                width: 160,
                onPressed: () {
                  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
                },
                text: 'Back',
              ),
               const SizedBox(height: 30),
            ],
          ),
        ),
      );
    },
  );
}


