

import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/animation_widget.dart';
import 'package:healthcare_app/res/components/constants.dart';
import 'package:healthcare_app/screens/screen3.dart';


class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  

  @override
  Widget build(BuildContext context) {
        final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final height=MediaQuery.of(context).size.height*0.02;
    final newheight=MediaQuery.of(context).size.height*0.12;
        final newheight2=MediaQuery.of(context).size.height*0.03;


     final width=MediaQuery.of(context).size.width*0.6;
    final imagewidth=screenWidth * 296 / 414;
    final Imageheight=screenHeight * 467 / 896;

    return  Scaffold(
      body: SingleChildScrollView(
         child: SlideInWidget(
     child:  Column(
        
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            SizedBox(
                height: newheight2,
              ),              Padding(
                padding: const EdgeInsets.only(right: 10,left: 10),
                child: Transform.translate(
                  offset: const Offset(14.0, 6.0),
                  child: Image.asset('assets/Frame 2.png',
                      fit: BoxFit.cover),
                ),
              ),
        SizedBox(
          height: height,
        ),
                  const Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Skip',
                  style: TextStyle14
                ),
              ],
            ),
          ),
        SizedBox(
          height: height,
        ),
        Center(
      child:  Image.asset('assets/male_doctor.png',width: imagewidth,height: Imageheight,)),
        SizedBox(
          height: newheight2,
        ),
         const Padding(
            padding: EdgeInsets.only(right: 17,left:80 ),
          
             
              child:  Text(
                  'Get advice only from a \ndoctor you believe in.',
                  style: TextStyle22
                ),
              
            ),
            SizedBox(
              height: newheight,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                    Padding(
            padding: const EdgeInsets.only(left: 20,right: 18),
         child:  Row(
              children: [
                  _buildrectangular(color: greyColour),
                 const SizedBox(
                  width: 3,
                 ),
                _buildrectangular(color: BlueColour),
                SizedBox(
               
                  width: width,
                ),
                  FloatingActionButton(
        onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen3()));

        },
        child:  Icon(Icons.arrow_forward,color: whiteColour,),
        backgroundColor: BlueColour,
      ),

              ],
            ),
                    ),
           
      ])]
   ))));
  }
}
Widget _buildrectangular({Color? color}) {
  return Container(
    width: 15, 
    height: 7, 
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: color,
    ),
  );
}
