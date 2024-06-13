import 'package:demo2/another_app_screen/login_page.dart';
import 'package:demo2/components/constants.dart';
import 'package:demo2/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
    final UserController _userController = UserController();
     @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobilenoController.dispose();
    addressController.dispose();
    super.dispose();
  }

  
   bool _obscureText = false;
    final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

  final TextEditingController addressController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
    final TextEditingController mobilenoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
            final newheight2=MediaQuery.of(context).size.height*0.02;
        final newheight3=MediaQuery.of(context).size.height*0.1;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 83, 86, 87),
      appBar:AppBar(  systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 250, 250, 250),
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor:  const Color.fromARGB(255, 83, 86, 87),
        elevation: 0,
        automaticallyImplyLeading: false,
         leading: Padding(padding: const EdgeInsets.all(10),
       child:  IconButton(
    icon: const Icon(Icons.arrow_back_ios,color: orangeColour,),
    onPressed: () {
     Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    },
    

      
         )
         ),
           title:  const Text('Add Your Details',style: TextStyle(color: whiteColour,fontSize: 20,fontWeight: FontWeight.w500)),
           centerTitle: true,
           
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
           Padding(padding: const EdgeInsets.only(right: 20,left: 20),
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
     fillColor: fillColour3,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide:const BorderSide(color: whiteColour),

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
          Padding(padding: const EdgeInsets.only(right: 20,left: 20),
        child:    TextFormField(
            style: const TextStyle(
              fontSize: 15,
              color: whiteColour
            ),
  decoration: InputDecoration(
     fillColor: fillColour3,
    filled: true,
    
  
    hintText: 'Enter your email',
    hintStyle: const TextStyle(
      color: greyColour,
      fontFamily: 'Poppins',
      fontSize: 15,
    ),
    
     contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
                 borderSide:const BorderSide(color: whiteColour),
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
            Padding(padding: const EdgeInsets.only(right: 20,left: 20),
          child:  TextFormField(
            
              
            style: const TextStyle(
              fontSize: 15,
              color: whiteColour
            ),
  decoration: InputDecoration(
     fillColor: fillColour3,
    filled: true,
    hintText: 'Enter your password',
    hintStyle: const TextStyle(
      color: greyColour,
      fontFamily: 'Poppins',
      fontSize: 15,
    ),
     contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
           borderSide:const BorderSide(color: whiteColour),

    ),
    suffixIcon: IconButton(
      icon: Icon(
        _obscureText ? Icons.visibility : Icons.visibility_off,
        color: whiteColour,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    ),
  ),
  inputFormatters: [
                
                LengthLimitingTextInputFormatter(15),
              ],
  controller: passwordController,
  keyboardType: TextInputType.text,
  obscureText: _obscureText,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8||value.length>15) {
      return 'Password must be at least 8 or 15 characters long';
    }
    return null;
  },
),

                      
            ),
             SizedBox(
            height: newheight2,
           ),

             Padding(padding: const EdgeInsets.only(right: 20,left: 20),
             child: TextFormField(
            style: const TextStyle(
              fontSize: 15,
              color: whiteColour
            ),
  decoration: InputDecoration(
     fillColor: fillColour3,
    filled: true,
   
    hintText: 'Enter your address',
    hintStyle: const TextStyle(
      color: greyColour,
      fontFamily: 'Poppins',
      fontSize: 15,
    ),
  
     contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),

    
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide:const BorderSide(color: whiteColour),
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
            Padding(padding: const EdgeInsets.only(right: 20,left: 20),
          child:   TextFormField(
            style: const TextStyle(
              fontSize: 15,
              color: whiteColour
            ),
  decoration: InputDecoration(
     fillColor: fillColour3,
    filled: true,
   
    hintText: 'Enter your mobile no',
    hintStyle: const TextStyle(
      color: greyColour,
      fontFamily: 'Poppins',
      fontSize: 15,
    ),
    
     contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: whiteColour),
    ),
    
  ),
  inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
  controller: mobilenoController,
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
              Padding(
                padding: const EdgeInsets.only(right: 50,left: 50),

      child:   ElevatedButton(
  onPressed: () async {
                   if (_formKey.currentState!.validate()) {
                  await _userController.addUser(context, 
                    nameController.text.trim(),
                    emailController.text.trim(),
                    mobilenoController.text.trim(),
                    addressController.text.trim(),
                    passwordController.text.trim()
                  );
  
  }
   
                
    
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange, 
    minimumSize: const Size(240, 48), 
  ),
  child:  const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Add",
      textAlign: TextAlign.center,
                        style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    
                  ),),
  ],
  ),
),
              ),
 
        ],
      ),
    )),
    );
  }
}
