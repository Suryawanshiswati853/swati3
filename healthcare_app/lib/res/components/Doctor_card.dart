import 'package:flutter/material.dart';
import 'package:healthcare_app/res/components/constants.dart';
import 'package:healthcare_app/screens/doctor_details.dart';



class DoctorCard extends StatelessWidget {
  final String name;
  final String specialization;
  final double rating;
  final String distance;
  final String imagePath; 

  const DoctorCard({
    Key? key,
    required this.name,
    required this.specialization,
    required this.rating,
    required this.distance,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Padding(padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 15),
   child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder( 
        borderRadius: BorderRadius.circular(15), 
        side: const BorderSide( 
          color: BorderColour, 
          width: 1,
        ),
      ),
      child: SizedBox( 
    height: MediaQuery.of(context).size.height*0.18, 
    width: MediaQuery.of(context).size.width*0.006, 

      child: ListTile(

        leading: Image.asset(
          imagePath, 
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        
        title:  Text(name,style: BlackTextStyle16withBold,textAlign: TextAlign.start,),
        subtitle: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(specialization,style: GreyTextStyle13,textAlign: TextAlign.center,),
            const SizedBox(
              height: 5,
            ),
               Container(
                    width: 60,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 196, 215, 247),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    
          child:  Row(
              children: [
                const Icon(Icons.star, color: BlueColour, size: 16),
                const SizedBox(width: 4),
                Text(rating.toString(),style: const TextStyle(color: BlueColour), textAlign: TextAlign.center,),
              ],
            ),
               ),
             const SizedBox(
              height: 5,
            ),
              Row(
              children: [
                const Icon(Icons.location_on, color: greyColour, size: 16),
                const SizedBox(width: 4),
                Text(distance.toString(),style: GreyTextStyle13,textAlign: TextAlign.center,),
              ],
            ),
          ],
        ),
        onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorDetails()));
        },
      ),
    )));
  }
}
