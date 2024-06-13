import 'package:demo2/components/button.dart';
import 'package:demo2/controller/user_controller.dart';
import 'package:demo2/screens/userlist/userlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/constants.dart';

class EditUser extends StatefulWidget {
 
   final String userId;
  final String initialName;
  final String initialEmail;
  final String initialMobile;
  final String initialAddress;

  EditUser({
    required this.userId,
    required this.initialName,
    required this.initialEmail,
    required this.initialMobile,
    required this.initialAddress,
  });

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
       final UserController _userController = UserController();

    final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.initialName);
    emailController = TextEditingController(text: widget.initialEmail);
    mobileController = TextEditingController(text: widget.initialMobile);
    addressController = TextEditingController(text: widget.initialAddress);
  
  }
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final newheight2=MediaQuery.of(context).size.height*0.03;
        final newheight3=MediaQuery.of(context).size.height*0.1;
    return Scaffold(
      appBar:  AppBar(  systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 250, 250, 250),
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: orangeColour,
        elevation: 0,
        automaticallyImplyLeading: false,
         leading: Padding(padding: const EdgeInsets.all(10),
       child:  IconButton(
    icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
    onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>UserListScreen()));

    },
    

      
         )
         ),
           title:  const Text(' Update Your Details',style: TextStyle(color: whiteColour,fontSize: 20,fontWeight: FontWeight.w500)),
           centerTitle: true,
            actions: [ ]
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode:AutovalidateMode.onUserInteraction,

    child:   Column(
        children: [
         
          const SizedBox(
            height: 10,
          ),
          
          Padding(padding: const EdgeInsets.only(right: 10,left: 10),
        child:     TextFormField(
           style: const TextStyle(
              fontSize: 15,
              color: whiteColour
            ),
  decoration: InputDecoration(
    hintText: 'Enter your name',
    hintStyle: const TextStyle(
      color: greyColour,
      fontFamily: 'Poppins',
      fontSize: 15,
    ),
    filled: true,
    fillColor: fillColour2,
    contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
       borderSide: BorderSide.none,
    ),
   
  ),
   inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                LengthLimitingTextInputFormatter(30),
              ],
  controller: nameController,
  keyboardType: TextInputType.name,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Please enter a valid name';
    }
    return null;
  },
),

          ),
           SizedBox(
            height: newheight2,
           ),
          Padding(padding: const EdgeInsets.only(right: 10,left: 10),
        child:    TextFormField(
            style: const TextStyle(
              fontSize: 15,
              color: whiteColour
            ),
  decoration: InputDecoration(
    
  
    hintText: 'Enter your email',
    hintStyle: const TextStyle(
      color: greyColour,
      fontFamily: 'Poppins',
      fontSize: 15,
    ),
    filled: true,
    fillColor: fillColour2,
     contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide.none,
    ), 
  ),
  
            inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]')),
                LengthLimitingTextInputFormatter(40),
              ],
        controller: emailController,
    keyboardType: TextInputType.emailAddress,
      validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-\.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  },
),
          ),
           SizedBox(
            height: newheight2,
           ),
          
             Padding(padding: const EdgeInsets.only(right: 10,left: 10),
             child: TextFormField(
            style: const TextStyle(
              fontSize: 15,
              color: whiteColour
            ),
  decoration: InputDecoration(
   
    hintText: 'Enter your address',
    hintStyle: const TextStyle(
      color: greyColour,
      fontFamily: 'Poppins',
      fontSize: 15,
    ),
    filled: true,
    fillColor: fillColour2,
     contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide.none,
    ),
    
  ),
  inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s,.-]')),
                LengthLimitingTextInputFormatter(40),
              ],
  controller: addressController,
  keyboardType: TextInputType.streetAddress,
 
        
            validator: (value){
               if (value == null || value.isEmpty) {
      return 'Please enter your address';
               }
               else if (!RegExp(r'^[a-zA-Z0-9\s\.,#\-]+$').hasMatch(value)) {
      return 'Please enter a valid address';
   }
      return null;


            },
            
                      ),
                      
            ),
             SizedBox(
            height: newheight2,
           ),
            Padding(padding: const EdgeInsets.only(right: 10,left: 10),
          child:   TextFormField(
            style: const TextStyle(
              fontSize: 15,
              color: whiteColour
            ),
  decoration: InputDecoration(
   
    hintText: 'Enter your mobile no',
    hintStyle: const TextStyle(
      color: greyColour,
      fontFamily: 'Poppins',
      fontSize: 15,
    ),
    filled: true,
    fillColor: fillColour2,
     contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide.none,
    ),
    
  ),
  inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
  controller: mobileController,
  keyboardType: TextInputType.phone,
            validator: (value){
               if (value == null || value.isEmpty) {
      return 'Please enter your mobile no';
               }else if(value.length<5||value.length<10){
                return 'please enter 10 digit mobile no';
               }
    else if(!RegExp(r'^[0-9]+$').hasMatch(value)){
       return 'Please enter a valid Indian mobile number';

    }
      return null;


            },
            
                      ),
                      
            ),
          
           SizedBox(
            height: newheight3,
           ),
                       Center(
        child:  RoundedButtonWidget(
             
               height: MediaQuery.of(context).size.height*0.090,
                width: 250,
                color: orangeColour,
                
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
              
                
              text: 'Update', onPressed: ()  async{ 
                  _formKey.currentState?.validate();
                          if(_formKey.currentState!.validate()){
                              await _userController.editUser(
                                context,
                                        widget.userId,
                                 nameController.text,
                                 emailController.text,
                                mobileController.text,
                                 addressController.text,
                                      );
                           
                            
                          }
                          {
                      
  }},)
      ),
      const SizedBox(
        height: 10,
      ),
            
        ],
      ),
    )));
  }
}


