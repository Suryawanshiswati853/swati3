import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/BottomNavigationbar.dart';
import 'package:healthcare_app/res/components/animation_widget.dart';
import 'package:healthcare_app/res/components/constants.dart';
import 'package:healthcare_app/screens/Reports.dart';
import 'package:healthcare_app/screens/locationScreen.dart';
import 'package:healthcare_app/screens/notification.dart';
import 'package:healthcare_app/screens/pharmancy.dart';
import 'package:healthcare_app/screens/profile_screen.dart';
import 'package:healthcare_app/screens/top_doctors.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    TextEditingController searchController=TextEditingController();
      int _currentIndex = 0;
 
 @override
 void dispose(){
  super.dispose();
  searchController;
 }
  

  @override
  Widget build(BuildContext context) {
     final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
     final imagewidth=screenWidth * 160 / 414;
    final Imageheight=screenHeight * 239 / 896;
      
      final imagewidth2=screenWidth * 132 / 414;
    final Imageheight2=screenHeight * 132 / 896;


    return Scaffold(
      body: SingleChildScrollView(
        child:SlideInWidget(
          delay: 200,
        child: Column(
    children: [
        Container(

          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 183, 207, 227),
          
            ),
          child:   Column(
            children: [
            const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10,),
                child: Transform.translate(
                  offset: const Offset(14.0, 6.0),
                  child: Image.asset('assets/Frame 2.png',
                      fit: BoxFit.cover),
                ),
              ),
               const SizedBox(
                height: 20,
              ),
              Container(
                 width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height*0.26,
              
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                         CircleAvatar(
                          radius: 24,
                           child: Image.asset('assets/Ellipse 78.png', fit: BoxFit.cover),
                          
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Welcome ! ',
                          style: blackTextStyle16withBold,
                        ),
                        Text(
                          'Ruchita ',
                          style: blackTextStyle16,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'How is it going today ?',
                          style: fentBlackTextStyle13,
                        ),
                       
                      ],
                    ),
           
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.090,
                    ),
                    Image.asset(
                      'assets/female2.png',
                      height: Imageheight,
                      width: imagewidth,
                    ),
                    
                  ],
                ),
                
              ),
                 Container(
                    height:500 ,
                     
                decoration:  const BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.only(
                  
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
                ),
     width: MediaQuery.of(context).size.width*1.0,          
  child:  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
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
           hintText: 'Search doctor, drugs, articles...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search_rounded,size: 30,color: newColour2,)

        ),
      )
          ),  
            
  ),
   Row(
             mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    InkWell(
                      onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>TopDoctorsScreen()));

                      },
                      child:Image.asset('assets/Group 168.png',height: Imageheight2,width: imagewidth2,)),
                    InkWell(
                       onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>PharmancyScreen()));

                      },
                         child: Image.asset('assets/Group 169.png',height: Imageheight2,width: imagewidth2,)),
                     InkWell(
                       onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen()));

                      },
                      child: Image.asset('assets/Group 170.png',height: Imageheight2,width: imagewidth2,)),
                            ],
                            
              ),
                const Padding(padding:  EdgeInsets.only(right: 25,left: 25),
  child:  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
           Text(
        'Health article',
        style: BlackTextStyle16withBold,
      ),
         Text(
        'see all',
        style: BlueTextStyle12,
      ),

      ],
    )
         ),
          Padding(padding:  const EdgeInsets.only(right: 25,left: 25),
           child:   Container(
                  width:MediaQuery.of(context).size.width*0.9,
                       height:90,
                  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: whiteColour,
    border: Border.all(color: GreyColour),
  ),
                child: Padding(padding: const EdgeInsets.only(right: 10,left: 10),
             child:   Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      Image.asset(
                      'assets/Rectangle 460.png',
                      height: MediaQuery.of(context).size.height*0.2,
                      width: MediaQuery.of(context).size.width*0.2,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                   
                    const Column(
                      children:[
                         SizedBox(
                          height: 20,
                        ),
                          Padding(padding: EdgeInsets.only(right: 1,left: 5),
                  child:  Text('The 25 Healthiest Fruits You Can \nEat, According to a Nutritionist',style: TextStyle(
                      fontFamily: 'Poppins',fontSize: 10,fontWeight: FontWeight.bold,color: Color(0xFF565656)
                    ),)),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(padding: EdgeInsets.only(right: 10,left: 2),
                  child:   Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [          
                Text('Jun 10, 20223 ',style:newBlackTextStyle8),
                 SizedBox(
                  width: 10,
                ),
                  Text('5min read ',style:newBlackTextStyle8)

              ],
             )

                    ),
                    
                   ] ),
              const Icon(Icons.bookmark,color: BlueColour,size: 25,),
            
             ],
                ),
                
                
                
              ),
              
           ),
           
           

    ),
    const SizedBox(
      height: 10,
    ),
    Padding(padding:  const EdgeInsets.only(right: 25,left: 25),
           child:   Container(
                  width:MediaQuery.of(context).size.width*0.9,
                       height:90,
                  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: whiteColour,
    border: Border.all(color: GreyColour),
  ),
                child: Padding(padding: const EdgeInsets.only(right: 10,left: 10),
             child:   Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      Image.asset(
                      'assets/Rectangle 954.png',
                      height: MediaQuery.of(context).size.height*0.2,
                      width: MediaQuery.of(context).size.width*0.2,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Column(
                      children:[
                        SizedBox(
                          height: 20,
                        ),
                          Padding(padding: EdgeInsets.only(right: 1,left: 5),
                  child:  Text('The Impact of COVID-19 on \nHealthcare Systems',style: TextStyle(
                      fontFamily: 'Poppins',fontSize: 10,fontWeight: FontWeight.bold,color: Color(0xFF565656)
                    ),)),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(padding: EdgeInsets.only(right: 10,left: 0),
                  child:   Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               
                Text('Jun 10, 20223 ',style:newBlackTextStyle8),
                 SizedBox(
                  width: 10,
                ),
                  Text('5min read ',style:newBlackTextStyle8)

              ],
             )

                    )]
                   ),
                    SizedBox(
                    width: MediaQuery.of(context).size.width*0.070,
                   ),
                     const Icon(Icons.bookmark_border,color: BlueColour,size: 25,),

            
             ],
            
                ),
                
                
                
              ),
              
           ),
    ),
    const SizedBox(
      height: 10,
    ),
     Padding(padding:  const EdgeInsets.only(right: 25,left: 25),
           child:   Container(
                  width:MediaQuery.of(context).size.width*0.9,
                       height:90,
                  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: whiteColour,
    border: Border.all(color: GreyColour),
  ),
                child: Padding(padding: const EdgeInsets.only(right: 10,left: 10),
             child:   Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      Image.asset(
                      'assets/Rectangle 954.png',
                      height: MediaQuery.of(context).size.height*0.2,
                      width: MediaQuery.of(context).size.width*0.2,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      children:[
                        SizedBox(
                          height: 20,
                        ),
                          Padding(padding: EdgeInsets.only(right: 1,left: 5),
                  child:  Text('The Impact of COVID-19 on \nHealthcare Systems',style: TextStyle(
                      fontFamily: 'Poppins',fontSize: 10,fontWeight: FontWeight.bold,color: Color(0xFF565656)
                    ),)),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(padding: EdgeInsets.only(right: 10,left: 2),
                  child:   Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              
                Text('Jun 10, 20223 ',style:newBlackTextStyle8),
                 SizedBox(
                  width: 10,
                ),
                  Text('5min read ',style:newBlackTextStyle8)

              ],
             )

                    )]
              ),
               SizedBox(
                    width: MediaQuery.of(context).size.width*0.050,
                   ),
                     const Icon(Icons.bookmark_border,color: BlueColour,size: 25,),

            
             ],
            
                ),    
              ),
              
           ),
    ),
  ]
  )
  
          ),
           ]
       
       ),
       
           ),
         ]
    )
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
  })
    );
  }
}
