import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/Screens/EleventhScreen.dart';
import 'package:project/Screens/mainPage.dart';


class TwelveScreen extends StatefulWidget {
  @override
  _TwelveScreenState createState() => _TwelveScreenState();
}


class _TwelveScreenState extends State<TwelveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 83, 86, 87),
      body: Column(
        children: [
         const SizedBox(
            height: 10,
          ),
      
                   Padding(padding: const EdgeInsets.all(20),
                         child:      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children:[
                                    InkWell(
            onTap: () {
             Navigator.pop(context);
            
            },
            
            child: const Icon(Icons.arrow_back_ios, color: Colors.orange,),
            ),
          
            ],
            ),
         ),
          Column(
            children: [
               Image.asset('assets/png/Rectangle 248 (1).png'
              ), 
        ]),
         const SizedBox(
        height: 20,
      ),
                          const Row(
            children:[
              Padding(padding: EdgeInsets.all(20.0),
         child: Text("    Watch the latest Movies, Tv shows,and award-Winining Demo",
          style: TextStyle(
            fontSize: 9,
            color: Colors.white
          ),)
                          )],
      ),
      const SizedBox(
        height: 30,
      ),
      Container(
         height: 45,
          width: 300,
           
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 222, 222, 49),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child:Center( child:Text(" Join Demo \$1499/year",
                style: TextStyle(
        fontSize: 12,
        color: Color.fromARGB(255, 8, 80, 205),
      ),),
  
            )),
            SizedBox(
              height: 30,
            ),
              Container(
         height: 45,
          width: 300,
           
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 222, 222, 49),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child:Center( child:Text("Demo Video Mobile Edition at \$599 /Year",
                style: TextStyle(
        fontSize: 12,
        color: Color.fromARGB(255, 8, 80, 205),
      ),),
  
            )),
             SizedBox(
              height: 30,
            ),
               Container(
         height: 45,
          width: 300,
           
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 222, 222, 49),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child:Center( child:Text("View All Plans",
                style: TextStyle(
        fontSize: 12,
        color: Color.fromARGB(255, 8, 80, 205),
      ),),
  
            )),
      
                  
                  
                   
      // SizedBox(
      //   height: 162,
      // ),
          

     

          
      //     Container(
      //       color: const Color.fromARGB(255,235,205,235),
      //       height: MediaQuery.of(context).size.height * 0.08,
      //       child: const Center(

      //       ),
         // ),

    ]));
  }
}
