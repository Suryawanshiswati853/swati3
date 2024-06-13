import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/Screens/mainPage.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:project/components/Animation_Screen.dart/animation_screen.dart';



class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}


class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      backgroundColor: const Color.fromARGB(255, 83, 86, 87),
      body:SingleChildScrollView(
      child:  Column(
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
        height: 20,
      ),
     
      Container(
            height: 390,
            color: const Color.fromARGB(115, 45, 39, 39),
             child: Align(
              alignment: Alignment.topCenter,
                        child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: const EdgeInsets.only(right: 10,left: 10),
              child:   Column( 
              children: [
                 const Row(
                  children: [
                   
                    SizedBox(width: 30),
                Text(
                  "OTP Verification",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                 )]),
                const Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                Text(
                  "         This Verification is essential for 2-Step Verification",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "      making your account secure in any case of loss.",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                
              ],
              
                )),
                const SizedBox(
                  height: 10,
                ),
                Padding(padding: const EdgeInsets.only(right: 10,left: 20),
     child:   PinCodeTextField(
  autofocus: true,
  pinTextStyle: const TextStyle(fontSize: 15,color: Colors.white),
  highlight: true,
  highlightColor: Colors.grey,
  defaultBorderColor: Colors.grey,
  hasTextBorderColor: Colors.grey,
  maxLength: 4,
  onDone: (String otp) {
  },
  wrapAlignment: WrapAlignment.spaceAround,
  pinBoxHeight: 40,
  pinBoxWidth: 40,
  pinBoxDecoration: (borderColor, backgroundColor, {borderWidth=0, radius = 8}) {
    return BoxDecoration(
      border: Border.all(color:  Colors.grey,),
      borderRadius: BorderRadius.circular(6),
      color: const Color.fromARGB(115, 45, 39, 39),
      
    );
  },
),
        ),
      
        const SizedBox(
          height: 15,
        ),
                        const Text(
                  "Resend OTP",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.orange,
                  ),
                ),
                                Column( 
              children: [
                
                const SizedBox(height: 10), 
                const Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                Text(
                  "         The OTP has been sent to your personal number ending",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "      with XXXX please Do not share it with others.",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ])),
              const SizedBox(height: 20), 
              Padding(
                padding: const EdgeInsets.only(right: 50,left: 50),

      child:   ElevatedButton(
  onPressed: () {
     Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  SlideInAnimatedContainer(child: MainScreen()),
              ));
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange, 
    minimumSize: const Size(240, 48), 
  ),
  child: const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Complete",
      textAlign: TextAlign.center,
                        style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    
                  ),),
      Icon(Icons.check),
    ],
  ),
),
              ),
const SizedBox(
  height: 10,
),
Center(
child:  ElevatedButton(
  onPressed: () {
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    minimumSize: const Size(200, 48),
  ),
  child: const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Having Issue? Change Number!",
                        style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),),
    ],
  ),
),

  
                                )],

              )],
         
             ))] ),
          
            
             
       

                   
                  )),
          //         SizedBox(
          //           height: 16,
          //         ),
          
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.08,
          //   color: const Color.fromARGB(255,235,205,235),
          //   child: const Center(

          //   ),
          // ),

    ])
    ));
  }
  Widget buildOTPTextField() {
  return Container(
    width: 40,
    height: 40, 
    child: TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.black,
        
        labelText: "",
        border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}

}
