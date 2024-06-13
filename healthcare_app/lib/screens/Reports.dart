
import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/animation_widget.dart';
import 'package:healthcare_app/res/components/constants.dart';
import 'package:healthcare_app/screens/home_screen.dart';
import 'package:healthcare_app/screens/notification.dart';

import '../res/components/BottomNavigationbar.dart';
import 'profile_screen.dart';

class ReportsScreen extends StatefulWidget {
  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  int _currentIndex = 1;

  
  @override
  Widget build(BuildContext context) {
           final newheight2=MediaQuery.of(context).size.height*0.03;
             final newheight1=MediaQuery.of(context).size.height*0.01;
          final newheight4=MediaQuery.of(context).size.height*0.02;
            final newwidth=MediaQuery.of(context).size.height*0.1;
            final newheight3=MediaQuery.of(context).size.height*0.05;
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
        SizedBox(
          height: newheight3,
        ),
         Padding(padding:  const EdgeInsets.only(right: 25,left: 25),
           child:   Container(
                  width:MediaQuery.of(context).size.width*0.9,
                       height:MediaQuery.of(context).size.height*0.2,
                  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: const Color.fromRGBO(64, 124, 226, 0.19),
    border: Border.all(color: GreyColour),
  ),
                child: Padding(padding: const EdgeInsets.only(right: 10,left: 10),
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
        'Heart rate ',
        style: BlackTextStyle16withBold,
      ),
     ] ),
        
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.050,
                    ),
                    Image.asset(
                      'assets/Vector 13.png',
                      height: MediaQuery.of(context).size.height*0.9,
                      width: MediaQuery.of(context).size.width*0.4,
                    ),
                  ],
                ),
              ),
           ),
           

    ),
    SizedBox(
      height: newheight2,
    ),
     Padding(padding:  const EdgeInsets.only(right: 15,left: 15),
  child:  Row(
      children:[
     Padding(padding:  const EdgeInsets.only(right: 10,left: 10),
           child:   Container(
              width: 145,
                  height: 165,
                  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color:  const Color.fromARGB(255, 198, 182, 227),
   
    border: Border.all(color: GreyColour),
  ),
                child: Padding(padding: const EdgeInsets.only(right: 15,left: 15),
                child:    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          SizedBox(
          height: newheight2,
        ),
          Image.asset(
                      'assets/Vector14.png',
                      height: MediaQuery.of(context).size.height*0.060,
                      width: MediaQuery.of(context).size.width*0.1,
                    ),
         SizedBox(
          height: newheight1,
        ),
                     
                        const Text(
        'Blood Group ',
        style: BlackTextStyle14semiBold,
      ),
        SizedBox(
          height: newheight1,
        ),
                     
                        const Text(
        'A+',
        style: TextStyle(color: blackColour,fontFamily: 'Poppins',fontSize: 30,fontWeight: FontWeight.bold),
      ),
                   ] )))),

              
     Padding(padding:  const EdgeInsets.only(right: 0,left: 10),
           child:   Container(
            width: 145,
                  height: 165,
                  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: const Color.fromARGB(107, 235, 173, 196),
  
    border: Border.all(color: GreyColour),
  ),
                child: Padding(padding: const EdgeInsets.only(right: 15,left: 15),
                child:    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          SizedBox(
          height: newheight2,
        ),
         Image.asset(
                      'assets/Vector15.png',
                      height: MediaQuery.of(context).size.height*0.065,
                      width: MediaQuery.of(context).size.width*0.1,
                    ),
         SizedBox(
          height: newheight1,
        ),
                     
                        const Text(
        'Weight',
        style: BlackTextStyle14semiBold,
      ),
        SizedBox(
          height: newheight1,
        ),
                     
                        const Text(
        '103lbs',
        style: TextStyle(color: blackColour,fontFamily: 'Poppins',fontSize: 30,fontWeight: FontWeight.bold),
      ),
                   ] )))
                   ),

    ]),
       ),
                SizedBox(
                  height: newheight2,
                ),
                
                const Padding(padding: EdgeInsets.only(right: 25,left: 30),
                child: Text('Latest report',style: BlackTextStyle16withBold,)),
                 SizedBox(
                  height: newheight2,
                ),
                     Padding(padding:  const EdgeInsets.only(right: 20,left: 24),
           child:   Container(
             decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
           border: Border.all(color: GreyColour),
               ),
               width: 312,
            height:MediaQuery.of(context).size.height*0.1,
             child:  Padding(padding: const EdgeInsets.only(left: 0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      Image.asset(
                      'assets/Group 249.png',
                      height: MediaQuery.of(context).size.height*0.080,
                      width: MediaQuery.of(context).size.width*0.2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        SizedBox(
                          height: newheight4,
                        ),
                         const Text(
                      'General  report',
                      style: BlackTextStyle14Bold,
                    ),
                    
                         const Text(
                      'Jul 10, 2023 ',
                      style: BlackTextStyle11withBold,
                    ),
                    


                      ]
                     


                ),
                  SizedBox(
                  width: newwidth,
                ),
                 const Icon(Icons.more_horiz,size: 30,color: blackColour,),
                
                ],
                )
                
                
    ))),
    SizedBox(
      height: newheight2,
    ),
     Padding(padding:  const EdgeInsets.only(right: 20,left: 24),
           child:   Container(
             decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
           border: Border.all(color: GreyColour),
               ),
               width: 312,
            height:MediaQuery.of(context).size.height*0.1,
             child:  Padding(padding: const EdgeInsets.only(left: 0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      Image.asset(
                      'assets/Group 249.png',
                      height: MediaQuery.of(context).size.height*0.080,
                      width: MediaQuery.of(context).size.width*0.2,
                    ),
                   
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        SizedBox(
                          height: newheight4,
                        ),
                         const Text(
                      'General  report',
                      style: BlackTextStyle14Bold,
                    ),
                    
                         const Text(
                      'Jul 5, 2023 ',
                      style: BlackTextStyle11withBold,
                    ),
                    


                      ]
                     


                ),
                SizedBox(
                  width: newwidth,
                ),
                 const Icon(Icons.more_horiz,size: 30,color: blackColour,),
                ],
                
              
                )
                
                
    )))])
                )),
                bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }else if(index==1){
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportsScreen()),
              );

            }else if(index==2){
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notifications()),
              );
            }else if(index==3){
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            }
          });
  }));
         
  }
}

