import 'package:flutter/material.dart';
import '../res/components/round_button.dart';
import 'package:healthcare_app/screens/home_screen.dart';
import 'package:healthcare_app/res/components/app_bar.dart';
import 'package:healthcare_app/res/components/constants.dart';
import 'package:healthcare_app/res/components/animation_widget.dart';




class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
    TextEditingController searchController=TextEditingController();
    
    @override
    
  Widget build(BuildContext context) {
     final newheight2=MediaQuery.of(context).size.height*0.03;
          final newheight3=MediaQuery.of(context).size.height*0.03;
      final newheight4=MediaQuery.of(context).size.height*0.01;


      final Buttonwidth=MediaQuery.of(context).size.width*0.7;
        final Buttonheight=MediaQuery.of(context).size.width*0.14;
    return Scaffold(
     body:  SingleChildScrollView(
       child:SlideInWidget(
          delay: 200,
    child:   Column(
   
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SizedBox(
          height: newheight3,
        ),
        
        Transform.translate(
          offset: const Offset(17.0, 8.0), 
          child: Image.asset('assets/Frame 2.png', fit: BoxFit.cover),
        ),
                 SizedBox(
          height: newheight4,
        ),
          SimpleAppBar(
          backgroundColor: whiteColour,
         leadingIcon: Icons.arrow_back_ios,
         leadingIconColor: blackColour,
         leadingIconOnPressed: (){
           Navigator.pop(context); 
         },
           
           title: 'Ambulance',
           ),
         
               Container(
                height: 580,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/location2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   SizedBox(height: newheight3),
                    Padding(padding:  const EdgeInsets.only(right: 15,left: 15),
   child:   Container(

             width: MediaQuery.of(context).size.width*0.9,

                      decoration: BoxDecoration(
                        color: const Color(0xFFFBFBFB),
                         
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color:const Color(0xFFE8F3F1) )
                      ),
  child:    TextFormField(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(right: 10,left: 10,top: 15,bottom: 10),
           hintText: 'Search location, ZIP code...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search_rounded,size: 30,color: newColour2,)

        ),
      )
          ),  
            
  ),
  Container(
               
                padding: const EdgeInsets.only(right: 80,left: 60,top: 50,),
                child: Column(
                  children: [
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF407CE2).withOpacity(0.7))
                      ),
                      child: const Icon(
                        Icons.location_on,
                        size: 25,
                        color: BlueColour,
                      ),
                    ),
                  ],
                ),
              ),
             
               Container(
    
                 height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child:  Image.asset('assets/Group 120.png',width: 60,height: 50,),
              ),
              
              SizedBox(
              width: 50, 
              height: 240,
   
                child:  Card(
                    margin: const EdgeInsets.all(10.0),
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Confirm your address',
                            style: BlackTextStyle16withBold
                          ),
                            const Padding(padding:EdgeInsets.only(right: 2,left: 0),
                                child:   Divider(),
       ),
                           const SizedBox(height: 8.0), 
                         const Row(children: [
                          Icon(Icons.location_on,color: Color(0xFFE14949),size: 30,),
                           Padding(padding:EdgeInsets.only(right: 20,left: 10),
                            child:   Text(
                            'Flat No. 50, Mahalaxmi Shop, \nUpkaar, 36, Barpokhar (E), \nSiwan, Bihar, Pincode-880212',
                            style: GreyTextStyle14,
                          ),
                         ),

                         ],),
                       
                           const SizedBox(height: 10.0),
                          Center(
        child:  RoundedButtonWidget(
             
               height: Buttonheight,
                width: Buttonwidth,
                color: BlueColour,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                 
              text: 'Confirm Location', onPressed: () { 
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

               },
               
            )
      ),
                        ],
                      ),
                    ),
                  ),
                

  )
  ]
     ))]))
  ));}
}
