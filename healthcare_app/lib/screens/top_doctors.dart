


import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/animation_widget.dart';
import 'package:healthcare_app/res/components/constants.dart';

import '../model/Doctor.dart';
import '../res/components/Doctor_card.dart';
import '../res/components/app_bar.dart';


class TopDoctorsScreen extends StatefulWidget {
  @override
  _TopDoctorsScreenState createState() => _TopDoctorsScreenState();
}

class _TopDoctorsScreenState extends State<TopDoctorsScreen> {
  
    final List<Doctor> doctorList = [
      
    Doctor(
      name: 'Dr. Rishi',
      specialization: 'Chardiologist',
      rating: 4.7,
      distance: '800m away',
      imagePath:'assets/Image.png'
    ),
     Doctor(
      name: 'Dr. Vaamana',
      specialization: 'Dentist',
      rating: 4.7,
      distance: '800m away',
      imagePath:'assets/newImage.png'
    ),
   
    Doctor(
      name: 'Dr. Nallarasi',
      specialization: 'Orthopaedic',
      rating: 4.7,
      distance: '800m away',
      imagePath:'assets/Image2.png'
    ),
    Doctor(
      name: 'Dr. Nihal',
      specialization: 'Cardiologist',
      rating: 4.7,
      distance: '800m away',
      imagePath:'assets/Image3.png'
    ),
    Doctor(
      name: 'Dr. Rishita',
      specialization: 'Cardiologist',
      rating: 4.7,
      distance: '800m away',
      imagePath:'assets/Image4.png'
    ),
  ];


  

  
  @override
  Widget build(BuildContext context) {
            final newheight2=MediaQuery.of(context).size.height*0.03;

    return  Scaffold(
      body:SlideInWidget( 
    child:  Column(
   
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
                height: newheight2,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 14,left: 10),
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
           
           title: 'Top Doctors',
           ),
         
           Expanded(
      child: ListView.builder(
        itemCount: doctorList.length,        
        itemBuilder: (context, index) {
          
          final doctor = doctorList[index];
          return DoctorCard(
            name: doctor.name,
            specialization: doctor.specialization,
            rating: doctor.rating,
            distance: doctor.distance,
             imagePath: doctor.imagePath,
          );
        },
      ),
   
    )])));
  }
}

