import 'package:flutter/material.dart';


class EightScreen extends StatefulWidget {
  @override
  _EightScreenState createState() => _EightScreenState();
}


class _EightScreenState extends State<EightScreen> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black,
      
        body: SingleChildScrollView(
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                                      const SizedBox(
                width:5 ,
              ),
                                                    InkWell(
            onTap: () {
            Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.orange,),
          ),
            // SizedBox(
            //     width:200,
            //   ),
                                           
          
            ]),

           
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                                            const SizedBox(
                          height: 120,
                        ),
                   

                        const Text(
                          "Choose Payment Methods",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.white
                          ),
                         ),         
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                       children: <Widget>[
                        SizedBox(
                          
                          height: 80,
                          // width: 350,
                child: Image.asset('assets/png/Groupimages.png'),
             ),
            
             Image.asset('assets/png/Group 144 (2).png'),
           
            
           
                  ]),
                  const SizedBox(
                    height: 60,
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                        
                          width: 150,
                          height: 50,
                     child:   ElevatedButton(
                          onPressed: () {
              
                          },
                          style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  backgroundColor:Colors.black,
                   side: BorderSide(color: Colors.white, width: 1),
                ),
                                 child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                 
                       
                           Text("Cancel",
                                               style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      
                      
                    ),),
                      ]),
                        ),
                        ),
                        const SizedBox(width: 10.0),
                         SizedBox(
                        
                          width: 150,
                          height: 50,
                    child:     ElevatedButton(
                          onPressed: () {
                          },
                          
                          style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  backgroundColor: Colors.orange
                ),
                 child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                            Text("Continue",
                                                style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      
                    ),),
                      ]),
              )
                    )],
                    ),
            
            
                   ]),
                 
                  

        
            
              ),
                 




          ]),
                  
                  
                  

                  ));
                  
               
                  
  }
  
}                        