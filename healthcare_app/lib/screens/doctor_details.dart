import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/animation_widget.dart';
import 'package:healthcare_app/res/components/constants.dart';

import '../../model/Doctor.dart';
import '../../res/components/app_bar.dart';
import '../../res/components/round_button.dart';

class DoctorDetails extends StatefulWidget {
 
  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
   final List<Doctor> doctorList = [
      
    Doctor(
      name: 'Dr. Rishi',
      specialization: 'Chardiologist',
      rating: 4.7,
      distance: '800m away',
      imagePath:'assets/Image.png',
      

    ),
   ];
  @override
  Widget build(BuildContext context) {
            final newheight2=MediaQuery.of(context).size.height*0.03;
            final newheight3=MediaQuery.of(context).size.height*0.01;

            final newheight1=MediaQuery.of(context).size.height*0.10;
             final Buttonwidth=MediaQuery.of(context).size.width*0.9;
            final Buttonheight=MediaQuery.of(context).size.width*0.14;


    return  Scaffold(
      body: SingleChildScrollView(
     child:   SlideInWidget(
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
           
           title: 'Doctor Detail',
           ),
           Container(
            
        height: MediaQuery.of(context).size.height * 0.2,
         child:   ListView.builder(
          itemCount: doctorList.length,
          itemBuilder: (context, index) {
            return DoctorInfoWidget(doctor: doctorList[index]);
          },
        ),
           ),
           SizedBox(
            height: 30,
           ),
       
              const Padding(
        padding: EdgeInsets.only(right: 16,left: 19,),
        child: Text('About', style: BlackTextStyle16withBold),
      ),
      const SizedBox(
        height: 5,
      ),
      const Padding(padding: EdgeInsets.only(right: 16,left: 19),
      child: Text('Lorem ipsum dolor sit amet, consectetur adipi elit,\nsed do eiusmod tempor incididunt ut laore et \ndolore magna aliqua. Ut enim ad minim veniam... ',style: BlackTextStyle12,),
         ),
               const Padding(padding: EdgeInsets.only(right: 16,left: 19),
                child: Text('Read more',style: BlueTextStyle12,)

      ),
      SizedBox(
        height: newheight2,
      ),
      Padding(padding: const EdgeInsets.only(right: 16,left: 19),
        child: Container(
        height: newheight1, 
      
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            7,
             (index) {
          bool isWednesday = (index + 1) == 3;
            return Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                 color: isWednesday ? BlueColour : whiteColour,
                 
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: GreyColour)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _getDayOfWeek(index + 1), 
                    style: TextStyle(
                    color: isWednesday ? whiteColour : newColour2, 
                    fontSize: 10, 
                    fontFamily: 'Poppins'
                  ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${21 + index}',
                    style: TextStyle(
                    color: isWednesday ? whiteColour : blackColour, 
                    fontSize: 18, 
                    fontFamily: 'Poppins'
                  ), 
                  ),
                ],
              ),
            );
  }),
        ),
         ),
         
     
      ),
       SizedBox(
        height: newheight3,
       ),
       const Padding(padding:EdgeInsets.only(right: 16,left: 19),
    child:   Divider(),
       ),
       SizedBox(
        height: newheight3,
       ),
       Column(
        children: List.generate(
          3,
          (rowIndex) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    3,
                    (colIndex) {
                      String time;
                      if (rowIndex == 0) {
                        time = '${colIndex + 9}:00 AM';
                      } else if (rowIndex == 1) {
                        time = '${colIndex + 1}:00 PM';
                      } else {
                        time = '${colIndex + 4}:00 PM';
                      }

                      return Flexible(
                    child:   Padding(padding: const EdgeInsets.only(right: 16,left: 19),
                   child:   Container(
                        height:MediaQuery.of(context).size.height * 0.060 ,
                      width:  MediaQuery.of(context).size.width * 0.3,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: (rowIndex == 1 && colIndex == 1)
                              ? BlueColour 
                              : whiteColour,
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(color: GreyColour)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              time,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                               
                                color: _getTextColor(rowIndex * 3 + colIndex + 1),
                              ),
                            ),
            ])
                        )));
  }
  ),
  ))
  ])
  )),
  SizedBox(
    height: newheight2,
  ),
   Padding(padding:const EdgeInsets.only(right: 16,left: 19),
        child:  RoundedButtonWidget(
             
               height: Buttonheight,
                width: Buttonwidth,
                color: BlueColour,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,   
              text: 'Book Appointment', onPressed: () { 


               },
               
            )
      ),
  ]),
  )));
  }
}    
String _getDayOfWeek(int day) {
  switch (day) {
    case 1:
      return 'Mon';
    case 2:
      return 'Tue';
    case 3:
      return 'Wed';
    case 4:
      return 'Thu';
    case 5:
      return 'Fri';
    case 6:
      return 'Sat';
    case 7:
      return 'Sun';
    default:
      return '';
  }
}
Color _getTextColor(int index) {
  List<Color> colors = [
    const Color.fromRGBO(64, 124, 226, 0.39),
    const Color.fromRGBO(64, 124, 226, 0.28),
     blackColour,
    const Color.fromRGBO(64, 124, 226, 0.39),
    const Color.fromRGBO(64, 124, 226, 0.28),
    whiteColour,
    blackColour,
    blackColour,
    blackColour,
  ];

  return colors[index % colors.length];
}
class DoctorInfoWidget extends StatefulWidget {
  final Doctor doctor;

  DoctorInfoWidget({required this.doctor});

  @override
  _DoctorInfoWidgetState createState() => _DoctorInfoWidgetState();
}

class _DoctorInfoWidgetState extends State<DoctorInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16, left: 19, top: 15),
              child: Image.asset(
                widget.doctor.imagePath,
                width: 100,  // Set desired width
                height: 100, // Set desired height
              ),
            ),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.doctor.name,
                  style:BlackTextStyle16withBold,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.doctor.specialization,
                  style: BlackTextStyle12
                ),
                   SizedBox(
                  height: 5,
                ),
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 175, 208, 235),
                    borderRadius: BorderRadius.circular(5)
                    //shape: BoxShape.rectangle
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  color: BlueColour,
                ),
                   SizedBox(
                  width: 5,
                ),
                 
              
                Text(
                  widget.doctor.rating.toString(),
                  style: BlueTextStyle12
                ),
                 ],
            ),
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  color: newColour,
                ),
                   SizedBox(
                  width: 2,
                ),
                 
              
                Text(
                  widget.doctor.distance,
                  style: BlackTextStyle12
                ),
                 ],
            ),
            
            ],

            ),
            
            
            // Row(
            //   children: [
            //     Icon(
            //       Icons.location_on,
            //       color: Colors.grey,
            //     ),
            //     Text(
            //       widget.doctor.distance,
            //       style: TextStyle(
            //         fontSize: 14,
            //         color: Colors.black54,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
        
      ],
    );
    
  }
}


