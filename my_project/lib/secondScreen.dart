import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:my_project/camera_screen.dart';


import 'UserForm.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
    TextEditingController startDateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      // backgroundColor: const Color.fromARGB(255, 3, 87, 156),
        title: const Text('User Details',style: TextStyle(color: Colors.white),),
                  actions: [
    IconButton(
      icon: const Icon(Icons.camera_outlined,color: Colors.white,),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CameraScreen()),
        );
     },
     ),
  ],

                leading: IconButton(
                  color: Colors.white,
            icon: const BackButtonIcon(),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    const MyForm()))),
        

 
        
        
      ),
      body: 
      SingleChildScrollView(
       child:Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextFormField(
                minLines: 1,
                maxLines: 3,
                textCapitalization: TextCapitalization.words,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp("[ ',-/ a-z A-Z á-ú Á-Ú 0-9]")),
                ],
                style: const TextStyle(fontSize: 12),
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  errorStyle: const TextStyle(fontSize: 10),
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(fontSize: 12),
                  labelStyle: TextStyle(
                    fontSize: 12,
                  ),
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextFormField(
                style: const TextStyle(fontSize: 12),
                minLines: 1,
                maxLines: 2,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3)
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  errorStyle: const TextStyle(fontSize: 10),
                  counterText: "",
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(fontSize: 12),
                  labelStyle: TextStyle(
                    fontSize: 12,
                  ),
                  labelText: 'Age',
                  hintText: 'Age required'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter age';
                  }
                   
                  return null;
                },
              ),
            ),
        
          ],
        ),
                            const SizedBox(height: 20,
                            width: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child:          TextFormField(

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
                      fontSize: 12,
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
                          startDateController.text = formattedDate;
                          //set output date to TextField value.
                        });
                       // print(startDateController.text);
                      } else {
                        print("Date is not selected");
                      }
                    });
                   setState(() {
                    //  endDateController.text = s.toString();
                    });
                  },
                    validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Your birth date';
              }
              return null;
            },
                 ),
             ),
            //  SizedBox(
            //   height: 20,
            //   width: 20,
            //  ),


            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child:                                         TextFormField(
                                style: const TextStyle(fontSize: 12),

                                          // maxLength: 10,

             inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    //   FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10)
                  ],
              
              //  LengthLimitingTextInputFormatter(100),
            //   FilteringTextInputFormatter.allow(
            //       RegExp("[0-9]")),
            // ],
              decoration: const InputDecoration(
             errorStyle: const TextStyle(fontSize: 10),
             border: OutlineInputBorder(),

                  labelText: 'Mobile Number',
                  prefixText: '+91'
               //   hintText: 'Please enter the mobile number'
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
          ),
                //            SizedBox(
                //   height: 10,
                //   width:10
                //  ),
        )],
        ),
        const SizedBox(
          height: 20,
          width: 20,
        ),
                Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
                                                    child:   TextFormField(
                                                                      style: const TextStyle(fontSize: 12),

                                                            inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    //   FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10)
                  ],

            //  inputFormatters: [
              
            //   //  LengthLimitingTextInputFormatter(100),
            //   FilteringTextInputFormatter.allow(
            //       RegExp("[0-9]")),
            // ],
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
          ), 
             ),
          // SizedBox(
          //   height: 10,
          //   width: 10,
          //  ),
                      SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child:   
                                  TextFormField(
                                                    style: const TextStyle(fontSize: 12),



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
          ),

             )],),


        const SizedBox(
          height: 20,
          width: 20,
        ),
                        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
                                                    child:   TextFormField(
                                                                      style: const TextStyle(fontSize: 12),

                                                                  textCapitalization: TextCapitalization.words,
             inputFormatters: [
              
              //  LengthLimitingTextInputFormatter(100),
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

                                                    )
                                                    
                                                    ),
                //                                                                          SizedBox(
                //   height: 10,
                //   width:10
                //  ),
                              SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
                                                    child:   TextFormField(
                                                                      style: const TextStyle(fontSize: 12),

                                                                  textCapitalization: TextCapitalization.words,
             inputFormatters: [
              
              //  LengthLimitingTextInputFormatter(100),
              FilteringTextInputFormatter.allow(
                  RegExp("[ ',-/ a-z A-Z á-ú Á-Ú]")),
            ],
                            decoration: const InputDecoration(
             errorStyle: const TextStyle(fontSize: 10),
             border: OutlineInputBorder(),

                  labelText: 'Your Last collegename/univercity',
                  hintText: 'Please enter the collegename'
                ),
              keyboardType: TextInputType.name,


            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Your collegename';
              }
              return null;
            },
                                                    ))
                                                    ],),
                                                    const SizedBox(
                                                      height: 20,
                                                      width:20
                                                    ),
                                                                    Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
                                                    child:   TextFormField(
                                                                                                                           
                                                 style: const TextStyle(fontSize: 12),

                                                      inputFormatters: [
              
              //  LengthLimitingTextInputFormatter(100),
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
                                         

                                                    ))]),

                                                    const SizedBox(
                                                      height: 20,
                                                      width:20
                                                    ),
        Center(

   child:  ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
                        //               Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) => MapScreen(),
                        //   ),
                        // );
            }
          },
          child: const Text('Submit'),
        ),
        ),


          //   children: [
            
          //               TextFormField(


          //   textCapitalization: TextCapitalization.words,
          //    inputFormatters: [
              
          //     //  LengthLimitingTextInputFormatter(100),
          //     FilteringTextInputFormatter.allow(
          //         RegExp("[ ',-/ a-z A-Z á-ú Á-Ú 0-9]")),
          //   ],
          //                   decoration: const InputDecoration(
          //    errorStyle: const TextStyle(fontSize: 10),
          //    border: OutlineInputBorder(),

          //         labelText: 'Name',
          //         hintText: 'Please enter the name'
          //       ),
          //     keyboardType: TextInputType.name,


          //   // The validator receives the text that the user has entered.
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return 'Please enter Your name';
          //     }
          //     return null;
          //   },
          // ),
  ])))));}}