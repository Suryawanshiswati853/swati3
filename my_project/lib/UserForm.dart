//import 'package:demo_app/View/secondscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:my_project/camera_screen.dart';
//import 'package:multi_validator/multi_validator.dart';

import '../main.dart';



class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
    TextEditingController startDateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _age = 0;
DateTime? _birthDate;
    int _mobno=0;
    int _whatno=0;
    String _email='';
    String _lasteducation='';
    String _collegenameuniversity='';
    String _grade='';
    String? _gender='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Color.fromARGB(255, 3, 87, 156),

        title: const Text('User Details',style: TextStyle(color: Colors.white),),
          actions: [
    IconButton(
      icon: Icon(Icons.camera_outlined,color: Colors.white,),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CameraScreen()),
        );
      },
     ),
  ],

                leading: IconButton(
            icon: BackButtonIcon(),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    MyApp()))),
        
      ),
      body:  SingleChildScrollView(
       child:Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          
          key: _formKey,
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Text(
      'Personal Information',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    ),

                        TextFormField(


            textCapitalization: TextCapitalization.words,
             inputFormatters: [
              
              //  LengthLimitingTextInputFormatter(100),
              FilteringTextInputFormatter.allow(
                  RegExp("[ ',-/ a-z A-Z á-ú Á-Ú 0-9]")),
            ],
                            decoration: const InputDecoration(
             errorStyle: const TextStyle(fontSize: 10),
             border: OutlineInputBorder(),

                  labelText: 'Name',
                  hintText: 'Please enter the name'
                ),
              keyboardType: TextInputType.name,


            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Your name';
              }
              return null;
            },
            onSaved: (value) {
    _name = value!;
  },

          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
                        TextFormField(
             inputFormatters: [
              
              //  LengthLimitingTextInputFormatter(100),
              FilteringTextInputFormatter.allow(
                  RegExp("[ 0-9]")),
            ],

                decoration: const InputDecoration(
              errorStyle: const TextStyle(fontSize: 10),
                border: OutlineInputBorder(),

                  labelText: 'Age',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  // if (int.tryParse(value) == null) {
                  //   return 'Please enter a valid number';
                  // }
                  return null;
                },
                  onSaved: (value) {
          _age = int.parse(value!);
            },

                // onSaved: (value) {
                //   _age = int.parse(value!);
                // },
              ),
              Text(
  '  Gender ',
  style: TextStyle(
    fontSize: 16,
   // fontWeight: FontWeight.bold,
  ),
),
Row(
  children: [
    Radio<String>(
      value: 'Male',
      groupValue: _gender,
      onChanged: (value) {
        setState(() {
          _gender = value;
        });
      },
    ),
    Text('Male'),
    Radio<String>(
      value: 'Female',
      groupValue: _gender,
      onChanged: (value) {
        setState(() {
          _gender = value;
        });
      },
    ),
    Text('Female'),
    Radio<String>(
      value: 'Other',
      groupValue: _gender,
      onChanged: (value) {
        setState(() {
          _gender = value;
        });
      },
    ),
    Text('Other'),
  ],
),

                        SizedBox(
            height: 10,
            width: 10,
          ),
          TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  //FilteringTextInputFormatter.allow(RegExp("[- 0-9]")),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[- 0-9]")),
                    LengthLimitingTextInputFormatter(10)
                  ],
                 controller: startDateController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    errorStyle: const TextStyle(fontSize: 10),
                    prefixIcon: Icon(Icons.calendar_month),
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(fontSize: 15),
                    labelStyle: TextStyle(
                      fontSize: 15,
                    ),
                    labelText: 'Birth Date',
                    hintText: 'yyyy-MM-dd',
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          1991), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101),
                      // onConfirm:widget.onChanged,
                    ).then((pickedDate) {
                      if (pickedDate != null) {
                        // print(
                        // pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);

                        print(formattedDate);

                        setState(() {
                          _birthDate = pickedDate;
                          startDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);


                        //  startDateController.text = formattedDate;
                          //set output date to TextField value.
                        });
                       // print(startDateController.text);
                      } else {
                        print("Date is not selected");
                      }
                    });

                    // setState(() {
                    // });
                  },
                              validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Your birth date';
              }
              return null;
            },
  //                       onSaved: (value) {
  //   _birthDate = value!;
  // },


                 ),
                 SizedBox(
                  height: 10,
                  width:10
                 ),
                 Text(
      'Contact Details',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    ),

                                         TextFormField(

             inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10)
                  ],
              

              decoration: const InputDecoration(
             errorStyle: const TextStyle(fontSize: 10),
             border: OutlineInputBorder(),

                  labelText: 'Mobile Number',
                  prefixText: '+91'
                ),
              keyboardType: TextInputType.phone,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Mobile number';
              }else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Mobile number should be 10 digits long';
    }

              return null;
            },
                        onSaved: (value) {
    _mobno =  int.parse(value!);
  },
          ),
                           SizedBox(
                  height: 10,
                  width:10
                 ),
                                         TextFormField(
                                                            inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10)
                  ],


              decoration: const InputDecoration(
             errorStyle: const TextStyle(fontSize: 10),
             border: OutlineInputBorder(),

                  labelText: 'whatapp Number',
                 // hintText: 'Please enter the whatapp number',
                   prefixText: '+91',

                ),
              keyboardType: TextInputType.phone,


            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter whatapp number';
              }
              else if (!RegExp(r'^(\+91[\-\s]?)?[0]?(91)?[6789]\d{9}$').hasMatch(value)) {
      return 'Please enter a valid  mobile number';
              }else if (value.length != 10) {
      return 'Mobile number should be 10 digits long';
    }
              return null;
            },
                                    onSaved: (value) {
    _whatno =  int.parse(value!);
  },
          ), 
          SizedBox(
            height: 10,
            width: 10,
          ),
                                  TextFormField(


                      autofillHints: [AutofillHints.email],
             inputFormatters: [
              
              //  LengthLimitingTextInputFormatter(100),
              FilteringTextInputFormatter.allow(
                  RegExp("[ ', @ -/ a-z A-Z á-ú Á-Ú 0-9]")),
            ],
                            decoration: const InputDecoration(
             errorStyle: const TextStyle(fontSize: 10),
             border: OutlineInputBorder(),

                  labelText: 'email',
                  hintText: 'Please enter the email'
                ),
              keyboardType: TextInputType.emailAddress,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Your email';
              }
              return null;
            },
                                    onSaved: (value) {
    _email =  value!;
  },
          ),
            SizedBox(
                  height: 10,
                  width:10
                 ),
                 Text(
      'Education Details',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),

                                            TextFormField(


            textCapitalization: TextCapitalization.words,
             inputFormatters: [
              
               LengthLimitingTextInputFormatter(50),
              FilteringTextInputFormatter.allow(
                  RegExp("[ ',-/ a-z A-Z á-ú Á-Ú]")),
            ],
                            decoration: const InputDecoration(
             errorStyle: const TextStyle(fontSize: 10),
             border: OutlineInputBorder(),

                  labelText: 'Your Last education',
                  hintText: 'Please enter the education'
                ),
              keyboardType: TextInputType.name,


            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Your education';
              }
              return null;
            },
                                    onSaved: (value) {
    _lasteducation =  value!;
  },
          ),
                                     SizedBox(
                  height: 10,
                  width:10
                 ),
                                  TextFormField(


            textCapitalization: TextCapitalization.words,
             inputFormatters: [
              
               LengthLimitingTextInputFormatter(50),
              FilteringTextInputFormatter.allow(
                  RegExp("[ ',-/ a-z A-Z á-ú Á-Ú 0-9]")),
            ],
                            decoration: const InputDecoration(
             errorStyle: const TextStyle(fontSize: 10),
             border: OutlineInputBorder(),

                  labelText: 'Your college/University',
                  hintText: 'Please enter the college name'
                ),
              keyboardType: TextInputType.name,


            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Your college name';
              }
              return null;
            },
                                    onSaved: (value) {
    _collegenameuniversity =  value!;
  },
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
              TextFormField(
             inputFormatters: [
                LengthLimitingTextInputFormatter(50),
              FilteringTextInputFormatter.allow(
                  RegExp("[ ',-/ a-z A-Z á-ú Á-Ú 0-9]" )),
            ],
              decoration: const InputDecoration(
             errorStyle: const TextStyle(fontSize: 10),
             border: OutlineInputBorder(),

                  labelText: 'Grade',
                  hintText: 'Please enter the your grade'
                ),
              keyboardType: TextInputType.name,


            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Your grade';
              }
              return null;
            },
                                    onSaved: (value) {
    _grade =  value!;
  },
          ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                                    child: Center(
                child: ElevatedButton(
                  onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                   _formKey.currentState!.save();
                        print('Name: $_name');
                      print('Age: $_age');
                              print('Birth date: $_birthDate');

                        print('Entered mobile: $_mobno');

                        print('Entered whatapp no: $_whatno');

                        print('Entered collegenameuniversity: $_collegenameuniversity');
                           print('Entered email: $_email');

                        print('Entered grade: $_grade');


                        print('Entered lasteducation: $_lasteducation');
                                                Text('Entered Name: $_name');

                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                    
                  );
              //                   Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DisplayDataScreen(
              //       name: _name,
              //       age: _age.toString(),
              //       birthDate: _birthDate.toString(),
              //       mobile: _mobno.toString(),
              //       whatsappNo: _whatno.toString(),
              //       collegenameuniversity: _collegenameuniversity,
              //       email: _email,
              //       grade: _grade,
              //       lastEducation: _lasteducation,
              //     ),
              //   ),
              // );






                }
              },

                  child: const Text('Submit'),
                ),
                
              ),
        )]),
          ),
     ) ));
      
    
  }
}
