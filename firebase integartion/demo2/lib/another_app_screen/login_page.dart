import 'package:demo2/another_app_screen/add_page.dart';
import 'package:demo2/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controller/user_controller.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 83, 86, 87),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Image.asset('assets/userlog.png', width: 200, height: 200),
            ),
            Container(
              height: 390,
              color: const Color.fromARGB(115, 45, 39, 39),
              child: Align(
                alignment: Alignment.topCenter,
                child: Form(
                  key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Login with your account",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 70,
                            width: 280,
                            child: TextFormField(
                              controller: emailController,
                              style: const TextStyle(
                                color: whiteColour,
                                fontSize: 15,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              decoration:  InputDecoration(
                                 fillColor: fillColour3,
                                     filled: true,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                hintText: "Email",
                                border: OutlineInputBorder(
                                 
                                  borderRadius: BorderRadius.circular(30.0)   
                                ),
                                hintStyle: const TextStyle(color: greyColour),
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: whiteColour,
                                ),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]')),
                                LengthLimitingTextInputFormatter(40),
                              ],
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
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding:  const EdgeInsets.only(right: 10, left: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding:  const EdgeInsets.symmetric(horizontal: 10),
                            height: 70,
                            width: 280,
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: _obscureText,
                              style:  const TextStyle(
                                color: whiteColour,
                                fontSize: 15,
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                 fillColor: fillColour3,
                               filled: true,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                hintText: "Password",
                                border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)                               ),
                                hintStyle: const TextStyle(color: greyColour),
                                prefixIcon: const Icon(
                                  Icons.lock_outlined,
                                  color: whiteColour,
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
                                LengthLimitingTextInputFormatter(20),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value.length < 8 || value.length > 15) {
                                  return 'Password must be at least 8 or 15 characters long';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                                    Padding(
                padding: const EdgeInsets.only(right: 50,left: 50),

      child:   ElevatedButton(
  onPressed: () async {
     if (_formKey.currentState!.validate()) {
                    await _userController.loginUser(
                      context,
                     emailController .text.trim(),
                      passwordController.text.trim(),
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
      Text("Login",
      textAlign: TextAlign.center,
                        style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    
                  ),),
  ],
  ),
),
              ),
              const SizedBox(
  height: 20,
),
Padding(
  padding: const EdgeInsets.only(right: 25,left: 25),
child:  ElevatedButton(
  onPressed: () {
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    minimumSize:  const Size(150, 48),
  ),
  child:  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Don't have account?",
                        style: TextStyle(
                    fontSize: 15,
                    color: whiteColour,
                  ),),
                   TextButton(
              onPressed: (){
                   Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => AddPage()),
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
  ),
),
                     
                   ) ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

             
       

                   
