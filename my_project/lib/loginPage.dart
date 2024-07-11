

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_project/secondScreen.dart';
// import 'package:multi_validator/multi_validator.dart';

import 'UserForm.dart';

void main() => runApp(const LoginPage());

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Login page';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 3, 87, 156),

          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyCustomForm> {
  bool _obscureText = false;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: AutofillGroup(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  // Center(
                  //   child: SizedBox(
                  //     height: 155,
                  //     child: Image.asset(
                  //       "assets/image/download.jpg",
                  //       fit: BoxFit.contain,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 45,
                  ),
                  TextFormField(
                    autofillHints: [AutofillHints.email],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(
                          20.0, 15.0, 20.0, 15.0),
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  TextFormField(
                    obscureText: !_obscureText,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _toggle,
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(
                          20.0, 15.0, 20.0, 15.0),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 35.0),
                  Center(
                 child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => MyForm(),
                          ),
                        );
                        if (_formKey.currentState!.validate()) {
                          // Do something.
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ),
              )],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
