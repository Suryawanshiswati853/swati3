import 'package:flutter/material.dart';
import 'package:project/Screens/OTPverificationScreen.dart';
import 'package:project/components/Animation_Screen.dart/animation_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}


class _SignInScreenState extends State<SignInScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      backgroundColor: const Color.fromARGB(255, 83, 86, 87),
      body:SingleChildScrollView(
      child: Column(
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
            //   InkWell(
            // onTap: () {
            //   Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => OTPVerificationScreen(),
            //   ));
            // },
            
            // child: const Icon(Icons.arrow_forward_ios, color: Colors.orange,),
            // ),
            ],
            ),
         ),
          Column(
            children: [
             
           
               Image.asset('assets/png/Rectangle 248 (1).png'
              ), 
        ]),
        SizedBox(
          height: 10,
        ),
                          const Row(
            children:[
              Padding(padding: EdgeInsets.only(right: 25,left: 25),
         child: Text("Enjoy Over 100,000 Movies and Series Only On One Place.",
          style: TextStyle(
            fontSize: 10,
            color: Colors.white
          ),)
                          )],
      ),
      const SizedBox(
        height: 30,
      ),
      Container(
            width: 320, 
            height: 250, // Adjust the height as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color.fromARGB(115, 63, 60, 60), // Change the color as needed
            ),
            child: Stack(
              children: [
                 Positioned(
                  top: 10, // Adjust the top position as needed
                  left: 10, // Adjust the left position as needed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                       Padding(padding: EdgeInsets.only(right: 15,left: 15),
                   child:    Text(
                        "         Sign-in and Enjoy thousands of Movies\n                 and Series from our library.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                       ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(padding: EdgeInsets.only(right: 10,left: 10),
                  child:     Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 40, 
                    width: 280,
                    child: TextFormField(   
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15
                      ),
                    keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          hintText: "Mobile Number",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                      ),
                     
                    ),
                    
                    
                    
                    
                  ),
                  
                  
                ),
                
                      
                    
                  ),
                  
                  ],
                  ),
                  
                  
                ),
                  Align(
                  alignment: Alignment.center,
                 
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 130,
                    ),
                     ElevatedButton(
                          onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> SlideInAnimatedContainer(child: OTPVerificationScreen())));
                          },
                          style: ElevatedButton.styleFrom(
                //  padding: const EdgeInsets.all(8.0),
                  backgroundColor: Colors.orange,
                    minimumSize: const Size(240, 48), 
                ),
                                 child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                   
                       
                           Text("Continue",  textAlign: TextAlign.center,
                                               style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white
                    ),),
                      ]),
                        ),
                    
                        SizedBox(
                          height: 10,
                        ),
                         const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(thickness: 1,height: 1,indent: 10,endIndent: 3,)),
        Padding(
          padding: EdgeInsets.only(right: 8,left: 10),
          child: Text(
            'New User?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15
            )
          ),
        ),
        Expanded(child: Divider(thickness: 1,height: 1,indent: 3,endIndent: 10,)),
      ],
    ),
                
                  //  Text(
                  //   "____________ New User ? ___________",
                  //   style: TextStyle(
                  //     fontSize: 15,
                  //     color: Colors.white,
                  //   ),
                  // ),
               // ),
              
            //)
            ],
              
            ),
           
           
            
            
      )
                // Align(
                //   alignment: Alignment.center,
                //   child: Container(
                //     padding: const EdgeInsets.symmetric(horizontal: 10),
                //     height: 40, 
                //     width: 280,
                //     child: TextFormField(
                      
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 14
                //       ),
                //     keyboardType: TextInputType.phone,
                //       decoration: const InputDecoration(
                //         contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        
                //        // fillColor: Colors.black,
                //         hintText: "Mobile Number",
                //         border: OutlineInputBorder(),
                //         hintStyle: TextStyle(
                //           color: Colors.grey,
                //         ),
                //         prefixIcon: Icon(
                //           Icons.phone,
                //           color: Colors.white,
                //         ),
                //       ),
                     
                //     ),
                    
                    
                    
                    
                //   ),
                  
                  
                // ),
                
                
                 
                
      //           
      ])),
          

        // const SizedBox(
        //   height:126,
        // ),

          
        //   Container(
        //     color: const Color.fromARGB(255,235,205,235),
        //               height: MediaQuery.of(context).size.height * 0.08,

        //     child: const Center(

        //     ),
        //   ),

    ])));
  }
}
