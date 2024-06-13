import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/animation_widget.dart';
import 'package:healthcare_app/res/components/constants.dart';
import 'package:healthcare_app/screens/checkout.dart';

import '../../res/components/app_bar.dart';
import '../../res/components/round_button.dart';

class PharmancyScreen2 extends StatefulWidget {
  @override
  _PharmancyScreen2State createState() => _PharmancyScreen2State();
}

class _PharmancyScreen2State extends State<PharmancyScreen2> {
 
  @override
  Widget build(BuildContext context) {
            final newheight2=MediaQuery.of(context).size.height*0.03;
             final Buttonwidth=MediaQuery.of(context).size.width*0.9;
            final Buttonheight=MediaQuery.of(context).size.width*0.14;
           final newheight1=MediaQuery.of(context).size.height*0.0010;
             final newidth=MediaQuery.of(context).size.width*0.38;

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
           SizedBox(
            height: newheight2,
           ),
           Center(child: Image.asset('assets/newImage5.png', )),
            SizedBox(
            height: newheight2,
           ),
           Padding(padding: const EdgeInsets.only(right: 19,left: 30),
         child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                        
                        const Text(
                          'OBH Combi',
                          style: BlackTextStyle20Bold,
                        ),
                       
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          '75ml',
                          style: fentBlackTextStyle16,
                        ),
                          const SizedBox(
                          height: 2,
                        ),
                         buildRowWithStarIcon("4.0", 4),
                        
                       
                       
                      ],
                    ),
                    SizedBox(
                      width: newidth,
                    ),
                    IconButton(
                   icon: const Icon(Icons.favorite,color: Colors.red,),
                   onPressed: () {
                        },
                    ),
          
                  ],
                ),
                


    ),
    SizedBox(height: newheight1,),
     Padding(padding: const EdgeInsets.only(right: 10,left: 10),
  child:   Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                            const Padding(padding: EdgeInsets.only(right: 10,left: 10,top: 20,),

                       
                     child:  Icon(Icons.minimize,color: greyColour,)),
                       
                       
                        const Padding(padding: EdgeInsets.only(right: 10,left: 16,top: 25,),
                       child:   Text(
                          '1',
                          style: BlackTextStyle20Bold,
                        ),
                        ),
                        const SizedBox(
                          height: 10,  //$9.99
                        ),
                         Padding(padding: const EdgeInsets.only(right: 10,left: 16,top: 25,),
                     child:   Container(
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: BlueColour
            ),
                    
            
         
            child: const Icon(Icons.add,color: whiteColour,),
          ),
          
                        
                       
                       
  ),
  const SizedBox(
    width: 120,
  ),
    const Text(
                          '\$9.99',
                          style: BlackTextStyle26Bold,
                        ),
  ],
  
                    ),

    ),
    SizedBox(
      height: newheight2,
    ),
     const Padding(padding: EdgeInsets.only(right: 19,left: 30),
                       child:   Text(
                          'Description',
                          style: BlackTextStyle16withBold,
                        ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         Padding(padding: const EdgeInsets.only(right: 19,left: 30),
                     child:    RichText(
  text: const TextSpan(
     style: fentBlackTextStyle14, 
   
    children: [
      TextSpan(
        text: 'OBH COMBI is a cough medicine containing,\nParacetamol, Ephedrine HCl, and \nChlorphenamine maleate which is used to relieve\ncoughs accompanied by flu symptoms such as \nfever, headache, and sneezing...',
      ),
      TextSpan(
        text: 'Read more', 
        style:BlueTextStyle14,
      ),
    ],
  ),
)
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.070,
                        ),
                        Padding(padding:const EdgeInsets.only(right: 19,left: 30),
        child:  RoundedButtonWidget(
             
               height: Buttonheight,
                width: Buttonwidth,
                color: BlueColour,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,   
              text: 'Buy', onPressed: () { 
             Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOut()));


               },
               
            )
      ),
                        
    ]
    ))));
  }
}
  Widget buildRowWithStarIcon(String text, int starCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < starCount; i++)
          const Icon(
            Icons.star,
            color: BlueColour,
            size: 20,
          ),
                  const SizedBox(width: 8.0),

        Text(
          text,
          style: BlueTextStyle14,
        ),
        const SizedBox(width: 8.0),

      ],
    );
  }
