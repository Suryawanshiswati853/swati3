import 'package:demo2/components/button.dart';
import 'package:demo2/components/constants.dart';
import 'package:demo2/controller/user_controller.dart';
import 'package:demo2/screens/add_user/add_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

    final UserController _userController = UserController();
    


   bool _obscureText = false;
    final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
            final newheight2=MediaQuery.of(context).size.height*0.03;
        final newheight3=MediaQuery.of(context).size.height*0.1;


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 250, 250, 250),
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: orangeColour,
        elevation: 0,
        automaticallyImplyLeading: false,
  
        title:  const Text('Login',style: TextStyle(color: whiteColour,fontSize: 20,fontWeight: FontWeight.w500)),
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
          Image.asset("assets/login1.png",width: 400,height: 200,),
          const SizedBox(
            height: 10,
          ),
          Padding(padding: const EdgeInsets.only(right: 20,left: 20),
        child:  TextFormField(
            style: const TextStyle(
              fontSize: 15,
              color: whiteColour
            ),
  decoration: InputDecoration(
    prefixIcon:const Icon (Icons.email_outlined),
    prefixIconColor: whiteColour,
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
     focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide.none, 
      ),
      errorBorder: OutlineInputBorder(
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
            Padding(padding: const EdgeInsets.only(right: 20,left: 20),
            child: TextFormField(
              
            style: const TextStyle(
              fontSize: 15,
              color: whiteColour
            ),
  decoration: InputDecoration(
    hintText: 'Enter your password',
    prefixIcon: const Icon(Icons.lock_outline, color: whiteColour), 
    hintStyle: const TextStyle(
      color: greyColour,
      fontFamily: 'Poppins',
      fontSize: 15,
    ),
    filled: true,
    fillColor: fillColour2,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide.none,
    ),
         contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),

   
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
    } 
    else if (value.length < 8||value.length>15) {
      return 'Password must be at least 8 or 15 characters long';
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
              
                
              text: 'Login', onPressed: ()  async{ 
                  if (_formKey.currentState!.validate()) {
                    await _userController.loginUser(
                      context,
                     emailController .text.trim(),
                      passwordController.text.trim(),
                    );
                  }
                },
  )),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          const SizedBox(
            width: 50,
          ),
          const Text("Don't have account?",style: TextStyle(fontSize: 16,color: greyColour),),
           TextButton(
              onPressed: (){
                   Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => AddUser()),
    );
              },
              child: const Text(
                'Register',
                style: TextStyle(
                  color: orangeColour,
                  fontSize: 16
              
                ),
              ),
            ),

        ],
      )
    
        ],
      ),
    )));
  }
}
