// import 'dart:async';

// import 'package:AtDocHUB/Controller/DocumentController.dart';
// import 'package:AtDocHUB/Model/Appointment.dart';
// import 'package:AtDocHUB/View/AppointmentPageFE.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:intl/intl.dart';
// import 'package:AtDocHUB/Controller/AppointmentController.dart';
// import '../../Controller/LoginController.dart';
// import '../../Model/Document.dart';
// import '../../Model/User.dart';

// DateTime now = DateTime.now();
// String formattedDate = DateFormat("yyyy-MM-dd").format(now);

// class AddAppointment extends StatefulWidget {
//   @override
//   _AddAppointmentState createState() => _AddAppointmentState();
// }

// class _AddAppointmentState extends State<AddAppointment> {
//   //   selectedItem = item1[0];
//   // }

//   Future<Appointment>? _futureAppointment;

//   var paymentMode = ["Online", "Cash", "Cheque"];
//   String? selectedMode;
//   var item1 = ["Open", "Closed", "Cancel"];
//   String? selectedItem;
//   //late String items = '';

//   late final String date1;
//   DateTime? selectedDateTime;

//   late String datainput;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final TextEditingController docIdController = TextEditingController();
//   // final TextEditingController aptIdController = TextEditingController();
//   final TextEditingController staffIdController = TextEditingController();

//   final TextEditingController docTitleController = TextEditingController();
//   final TextEditingController tokenNocontroller = TextEditingController();
//   final TextEditingController partyNameController = TextEditingController();
//   final TextEditingController partyTypeController = TextEditingController();
//   final TextEditingController aptplaceController = TextEditingController();

//   final TextEditingController cityController = TextEditingController();

//   final TextEditingController aptDateController = TextEditingController();
//   final TextEditingController aptTimeController = TextEditingController();
//   final TextEditingController feesCollectedController = TextEditingController();

//   final TextEditingController totalFeesController = TextEditingController();
//   final TextEditingController paymentModeController = TextEditingController();
//   final TextEditingController aptExecutiveController = TextEditingController();
//   final TextEditingController aptStatusController = TextEditingController();
//   final TextEditingController contactNoController = TextEditingController();
//   final TextEditingController commentsController = TextEditingController();
//   final List<String> items = [
//     "Owner",
//     "Tenant",
//     "Agent",
//     "Both",
//   ];

//   String? selectedValue;

//   late final int dID;
//   late final int staff_Id;
//   late int Uid;
//   //late int ExId;
//   final apID = null;

//   late String executiveName;

//   List<UserLogin> allUsers = [];

//   @override
//   void dispose() {
//     aptStatusController.dispose();
//     partyTypeController.dispose();
//     paymentModeController.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     init();
//   }

//   Future init() async {
//     final allUsrs = await LoginController.users();
//     setState(() {
//       this.allUsers = allUsrs;
//       // print('users ++,$allUsrs');
//       // // for (int i = 0; i <= allUsrs.length; i++) {
//       // //   this.staff_Id == allUsrs[i];
//       // //   print(this.staff_Id);
//       // // }

//       // for (int i = 0; i <= allUsers.length; i++) {
//       //   this.staff_Id == allUsers[i].userId;
//       //   int Uid = this.staff_Id;
//       //   this.executiveName == allUsers[i].userName;

//       //   if (aptExecutiveController.text == allUsers[i].userName) {
//       //     setState(() {
//       //       this.ExId == Uid;
//       //     });
//       //   }
//       // }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         //  title: 'Add new Document',
//         theme: ThemeData(
//             //  backgroundColor: Color.fromARGB(255, 3, 87, 156),
//             // primarySwatch: Color.fromARGB(255, 3, 87, 156),
//             ),
//         home: Scaffold(
//             appBar: AppBar(
//               backgroundColor: Color.fromARGB(255, 3, 87, 156),
//               title: const Text('Add new Appointment'),
//               leading: IconButton(
//                   icon: BackButtonIcon(),
//                   onPressed: () => Navigator.of(context).push(MaterialPageRoute(
//                       builder: (BuildContext context) => AppointmentPageFE()))),
//             ),
//             body:
//                 // Expanded(
//                 //  child: SingleChildScrollView(
//                 SafeArea(
//               child: SingleChildScrollView(
//                 child: Container(
//                   //  key: _formKey,
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.all(8.0),

//                   child: (_futureAppointment == null)
//                       ? buildColumn()
//                       : buildFutureBuilder(),
//                 ),
//               ),
//             )));

//     // )
//   }

//   Form buildColumn() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           // typeFieldWidget(),
//           // typeFieldWidget1(),
//           SizedBox(
//             height: 10,
//           ),
//           // TextFormField(
//           //   autovalidateMode: AutovalidateMode.onUserInteraction,
//           //   inputFormatters: [
//           //     FilteringTextInputFormatter.digitsOnly,
//           //     LengthLimitingTextInputFormatter(5)
//           //   ],
//           //   controller: docIdController,
//           //   keyboardType: TextInputType.number,
//           //   decoration: const InputDecoration(
//           //       border: OutlineInputBorder(),
//           //       labelText: 'Document ID',
//           //       hintText: 'Enter the DocId'),
//           //   validator:
//           //       MultiValidator([RequiredValidator(errorText: 'Required*')]),
//           // ),
//           // SizedBox(
//           //   height: 20,
//           // ),
//           // SizedBox(
//           //   height: MediaQuery.of(context).size.height * 0.06,
//           //   width: MediaQuery.of(context).size.width * 0.9,
//           //   child: TextFormField(
//           //     // autovalidateMode: AutovalidateMode.onUserInteraction,
//           //     inputFormatters: [
//           //       FilteringTextInputFormatter.digitsOnly,
//           //       LengthLimitingTextInputFormatter(5)
//           //     ],
//           //     style: TextStyle(fontSize: 12),
//           //     controller: staffIdController,
//           //     keyboardType: TextInputType.number,
//           //     decoration: const InputDecoration(
//           //         border: OutlineInputBorder(),
//           //         labelText: 'Staff ID',
//           //         hintText: 'Enter the Staff ID'),
//           //     validator:
//           //         MultiValidator([RequiredValidator(errorText: 'Required*')]),
//           //   ),
//           // ),
//           // SizedBox(
//           //   height: 15,
//           // ),

//           //  width: MediaQuery.of(context).size.width,
//           //  height: MediaQuery.of(context).size.height * 0.5,
//           // width: 10,
//           // padding: EdgeInsets.all(16),
//           SizedBox(
//             width: MediaQuery.of(context).size.width * 0.9,
//             height: MediaQuery.of(context).size.height * 0.06,
//             child: TypeAheadField<Document>(
//               hideSuggestionsOnKeyboardHide: true,
//               textFieldConfiguration: TextFieldConfiguration(
//                 decoration: InputDecoration(
//                   errorStyle: const TextStyle(fontSize: 0.05),

//                   fillColor: Color.fromARGB(255, 233, 246, 252),
//                   //  prefixIcon: Icon(Icons.search),
//                   suffixIcon: GestureDetector(
//                     child: Icon(
//                       Icons.close,
//                       color: Color.fromARGB(137, 221, 221, 221),
//                       size: 20,
//                     ),
//                     onTap: () {
//                       docTitleController.clear();
//                       FocusScope.of(context).requestFocus(FocusNode());
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                       // borderRadius: BorderRadius.circular(10.0),
//                       ),
//                   hintText: 'Document Title ',
//                   hintStyle: TextStyle(fontSize: 12),
//                 ),
//                 controller: this.docTitleController,
//               ),
//               suggestionsCallback: DocumentController.getdocs,
//               itemBuilder: (context, Document suggestion) {
//                 final user = suggestion;

//                 return ListTile(
//                   title: Text(user.docTitle),
//                 );
//               },
//               noItemsFoundBuilder: (context) => Container(
//                 height: 50,
//                 child: Center(
//                   child: Text(
//                     'No Documents Found.',
//                     style: TextStyle(fontSize: 12),
//                   ),
//                 ),
//               ),
//               onSuggestionSelected: (Document? suggestion) {
//                 final doc = suggestion!;
//                 this.docTitleController.text = doc.docTitle;

//                 this.tokenNocontroller.text = doc.tokenNo.toString();

//                 this.partyNameController.text = doc.partyName;
//                 setState(() {
//                   this.dID = doc.docId;
//                 });

//                 // Navigator.of(context).push(MaterialPageRoute(
//                 //     builder: (context) =>
//                 //         DocumentStatusReport(user.docId)));
//               },
//             ),
//           ),

//           // TextFormField(
//           //   autovalidateMode: AutovalidateMode.onUserInteraction,
//           //   inputFormatters: [
//           //     LengthLimitingTextInputFormatter(100),
//           //     FilteringTextInputFormatter.allow(
//           //         RegExp("[,-/ a-z A-Z á-ú Á-Ú 0-9]")),
//           //   ],
//           //   style: TextStyle(fontSize: 12),
//           //   // inputFormatters: [LengthLimitingTextInputFormatter(100)],
//           //   //textCapitalization: TextCapitalization.characters,
//           //   controller: docTitleController,
//           //   keyboardType: TextInputType.name,
//           //   decoration: const InputDecoration(
//           //       border: OutlineInputBorder(),
//           //       labelText: 'Document Title',
//           //       hintText: 'Enter the docTitle'),
//           //   validator:
//           //       MultiValidator([RequiredValidator(errorText: 'Required*')]),
//           // ),
//           SizedBox(
//             height: 15,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.06,
//                 width: MediaQuery.of(context).size.width * 0.4,
//                 child: TextFormField(
//                   // autovalidateMode: AutovalidateMode.onUserInteraction,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     LengthLimitingTextInputFormatter(14)
//                   ],
//                   style: TextStyle(fontSize: 12),
//                   controller: tokenNocontroller,
//                   readOnly: true,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                       errorStyle: const TextStyle(fontSize: 0.05),
//                       border: OutlineInputBorder(),
//                       labelText: 'Token No',
//                       hintText: 'Enter the token No'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter Token No';
//                     } else if (value.length < 14) {
//                       return 'Please enter 14 digits number';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               SizedBox(
//                 width: 7,
//               ),

//               //   child: TextFormField(
//               //     onTap: () {
//               //       for (int i = 0; i <= allUsers.length; i++) {
//               //         final users = allUsers[i];
//               //         final int uId = allUsers[i].userId;
//               //         late final int userid;
//               //         if (aptExecutiveController.text == users.userName) {
//               //           setState(() {
//               //             userid = uId;
//               //           });
//               //           print('The user Id $uId');
//               //         }
//               //       }
//               //     },
//               //     //  autovalidateMode: AutovalidateMode.onUserInteraction,
//               //     controller: aptExecutiveController,
//               //     inputFormatters: [
//               //       FilteringTextInputFormatter.allow(RegExp("[a-z A-Z ]")),
//               //       //   FilteringTextInputFormatter.digitsOnly,
//               //       LengthLimitingTextInputFormatter(50)
//               //     ],
//               //     style: TextStyle(fontSize: 12),
//               //     //textCapitalization: TextCapitalization.words,
//               //     keyboardType: TextInputType.name,
//               //     decoration: const InputDecoration(
//               //         errorStyle: const TextStyle(fontSize: 0.05),
//               //         border: OutlineInputBorder(),
//               //         labelText: 'Appointment Executive',
//               //         hintText: 'Enter the aptExecutive'),
//               //     validator: MultiValidator(
//               //         [RequiredValidator(errorText: 'Required*')]),
//               //   ),
//               // ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.06,
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 child: TypeAheadField<UserLogin>(
//                   hideSuggestionsOnKeyboardHide: true,
//                   textFieldConfiguration: TextFieldConfiguration(
//                     decoration: InputDecoration(
//                       errorStyle: const TextStyle(fontSize: 0.05),

//                       fillColor: Color.fromARGB(255, 233, 246, 252),
//                       //  prefixIcon: Icon(Icons.search),
//                       suffixIcon: GestureDetector(
//                         child: Icon(
//                           Icons.close,
//                           color: Color.fromARGB(137, 221, 221, 221),
//                           size: 20,
//                         ),
//                         onTap: () {
//                           aptExecutiveController.clear();
//                           FocusScope.of(context).requestFocus(FocusNode());
//                         },
//                       ),
//                       border: OutlineInputBorder(
//                           // borderRadius: BorderRadius.circular(10.0),
//                           ),
//                       hintText: 'Appointment Executive ',
//                       hintStyle: TextStyle(fontSize: 12),
//                     ),
//                     controller: this.aptExecutiveController,
//                   ),
//                   suggestionsCallback: (pattern) async {
//                     return await LoginController.users();
//                   },
//                   itemBuilder: (context, UserLogin allUsers) {
//                     final user = allUsers;

//                     return ListTile(
//                       title: Text(user.userName),
//                     );
//                   },
//                   noItemsFoundBuilder: (context) => Container(
//                     height: 50,
//                     child: Center(
//                       child: Text(
//                         'No Staff Found.',
//                         style: TextStyle(fontSize: 12),
//                       ),
//                     ),
//                   ),
//                   onSuggestionSelected: (UserLogin? AllUsers) {
//                     final user = AllUsers!;
//                     this.aptExecutiveController.text = user.userName;

//                     //this.tokenNocontroller.text = user.tokenNo;

//                     // this.partyNameController.text = user.partyName;
//                     setState(() {
//                       this.staff_Id = user.userId;
//                     });

//                     // Navigator.of(context).push(MaterialPageRoute(
//                     //     builder: (context) =>
//                     //         DocumentStatusReport(user.docId)));
//                   },
//                 ),
//               ),
//             ],
//           ),

//           SizedBox(
//             height: 15,
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.06,
//             width: MediaQuery.of(context).size.width * 0.9,
//             child: TextFormField(
//               //  autovalidateMode: AutovalidateMode.onUserInteraction,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(50),
//                 FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
//               ],
//               style: TextStyle(fontSize: 12),
//               //textCapitalization: TextCapitalization.characters,
//               //inputFormatters: [LengthLimitingTextInputFormatter(50)],
//               controller: partyNameController,
//               keyboardType: TextInputType.name,
//               decoration: const InputDecoration(
//                   errorStyle: const TextStyle(fontSize: 0.05),
//                   border: OutlineInputBorder(),
//                   labelText: 'Party Name',
//                   hintText: 'Enter the party Name'),
//               validator:
//                   MultiValidator([RequiredValidator(errorText: 'Required*')]),
//             ),
//           ),
//           SizedBox(
//             height: 20.0,
//           ),
//           // Container(
//           //   // child: Row(
//           //   child: Column(
//           //     children: <Widget>[
//           //       const Align(
//           //           alignment: Alignment.center,
//           //           child: SizedBox(
//           //             width: 50,
//           //           )),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.07,
//                 width: MediaQuery.of(context).size.width * 0.4,
//                 // child: InputDecorator(
//                 //   decoration: InputDecoration(
//                 //     errorStyle: const TextStyle(fontSize: 0.05),
//                 //     border: OutlineInputBorder(
//                 //         borderSide:
//                 //             BorderSide(color: Colors.black, width: 0.1)),
//                 //   ),

//                 child: DropdownButtonFormField(
//                   decoration: InputDecoration(
//                     labelText: "select Party Type",
//                     labelStyle: TextStyle(fontSize: 12),
//                     errorStyle: const TextStyle(fontSize: 0.05),
//                     border: OutlineInputBorder(
//                         borderSide:
//                             BorderSide(color: Colors.black, width: 0.1)),
//                   ),

//                   // hint: Text(
//                   //   'Select Party Type',
//                   //   style: TextStyle(
//                   //     fontSize: 12,
//                   //     color: Theme.of(context).hintColor,
//                   //   ),
//                   // ),
//                   items: items
//                       .map((item) => DropdownMenuItem<String>(
//                             value: item,
//                             child: Text(
//                               item,
//                               style: const TextStyle(
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ))
//                       .toList(),
//                   value: selectedValue,
//                   onChanged: (value) {
//                     setState(() {
//                       selectedValue = value as String;
//                     });
//                   },
//                   //     buttonHeight: 30,
//                   //     buttonWidth: 200,
//                   //     itemHeight: 40,
//                   //     dropdownWidth: 200,
//                   //   ),
//                   // ),
//                   validator: MultiValidator([
//                     RequiredValidator(errorText: 'Please Enter party type')
//                   ]),
//                 ),
//               ),
//               SizedBox(
//                 width: 7,
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.07,
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 child: TextFormField(
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     //   FilteringTextInputFormatter.digitsOnly,
//                     LengthLimitingTextInputFormatter(10)
//                   ],
//                   style: TextStyle(fontSize: 12),
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   controller: contactNoController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                       errorStyle: const TextStyle(fontSize: 0.05),
//                       border: OutlineInputBorder(),
//                       labelText: 'Contact No',
//                       hintText: 'Enter the Contact No'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter contact No';
//                     } else if (value.length < 10) {
//                       return 'Please enter 10 digits number';
//                     }
//                     return null;
//                   },
//                   // ),
//                 ),
//               ),
//             ],
//           ),

//           SizedBox(
//             height: 15,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.06,
//                 width: MediaQuery.of(context).size.width * 0.4,
//                 child: TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   inputFormatters: [
//                     LengthLimitingTextInputFormatter(100),
//                     FilteringTextInputFormatter.allow(
//                         RegExp("[,-/: a-z A-Z á-ú Á-Ú 0-9]")),

//                     //   FilteringTextInputFormatter.digitsOnly,
//                   ],
//                   style: TextStyle(fontSize: 12),
//                   //textCapitalization: TextCapitalization.words,
//                   controller: aptplaceController,
//                   keyboardType: TextInputType.name,
//                   decoration: const InputDecoration(
//                       errorStyle: const TextStyle(fontSize: 0.05),
//                       border: OutlineInputBorder(),
//                       labelText: 'Appointment Place',
//                       hintText: 'Enter the apt place'),
//                   validator: MultiValidator(
//                       [RequiredValidator(errorText: 'Required*')]),
//                 ),
//               ),
//               SizedBox(
//                 width: 7,
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.06,
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 child: TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   inputFormatters: [
//                     LengthLimitingTextInputFormatter(50),
//                     FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9]")),
//                   ],
//                   style: TextStyle(fontSize: 12),
//                   // textCapitalization: TextCapitalization.words,
//                   controller: cityController,
//                   keyboardType: TextInputType.name,
//                   decoration: const InputDecoration(
//                       errorStyle: const TextStyle(fontSize: 0.05),
//                       border: OutlineInputBorder(),
//                       labelText: 'City',
//                       hintText: 'Enter the City'),
//                   validator: MultiValidator(
//                       [RequiredValidator(errorText: 'Required*')]),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.06,
//                 width: MediaQuery.of(context).size.width * 0.4,
//                 child: TextFormField(
//                   // maxLength: 10,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.allow(RegExp("[- 0-9]")),
//                     LengthLimitingTextInputFormatter(10)
//                   ],
//                   style: TextStyle(fontSize: 12),
//                   //   inputFormatters: [
//                   //   //   FilteringTextInputFormatter.digitsOnly,
//                   //   LengthLimitingTextInputFormatter(50)
//                   // ],
//                   controller: aptDateController,
//                   keyboardType: TextInputType.datetime,
//                   decoration: const InputDecoration(
//                       errorStyle: const TextStyle(fontSize: 0.05),
//                       prefixIcon: Icon(Icons.calendar_month),
//                       border: OutlineInputBorder(),
//                       labelText: 'Appointment Date',
//                       hintText: 'yyyy-MM-dd'),
//                   onTap: () async {
//                     DateTime? pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: selectedDateTime ?? DateTime.now(),
//                       firstDate: DateTime(
//                           1991), //DateTime.now() - not to allow to choose before today.
//                       lastDate: DateTime(2101),
//                       // onConfirm:widget.onChanged,
//                     ).then((pickedDate) {
//                       if (pickedDate != null) {
//                         // print(
//                         //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//                         String formattedDate =
//                             DateFormat('yyyy-MM-dd').format(pickedDate);

//                         print(formattedDate);

//                         setState(() {
//                           aptDateController.text = formattedDate;
//                           selectedDateTime = pickedDate;

//                           //set output date to TextField value.
//                         });
//                         print(aptDateController.text);
//                         //formatted date output using intl package =>  2021-03-16
//                         //you can implement different kind of Date Format here according to your requirement
//                         // DateFormat df = new DateFormat("yyyy-MM-dd");
//                         // String stDate = df.format(pickedDate);
//                         // print(stDate);

//                       } else {
//                         print("Date is not selected");
//                       }
//                     });

//                     // final docs = await DocumentController.checkDate(stDate);

//                     // setState(() => this.docs = docs);
//                   },
//                   validator: MultiValidator(
//                       [RequiredValidator(errorText: 'Required*')]),
//                 ),
//               ),
//               SizedBox(
//                 width: 7,
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.06,
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 child: TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.allow(RegExp("[: 0-9]")),
//                   ],
//                   style: TextStyle(fontSize: 12),
//                   controller: aptTimeController,
//                   keyboardType: TextInputType.datetime,
//                   decoration: const InputDecoration(
//                       errorStyle: const TextStyle(fontSize: 0.05),
//                       prefixIcon: Icon(Icons.timer),
//                       border: OutlineInputBorder(),
//                       labelText: 'Appointment Time',
//                       hintText: 'HH:mm:ss'),
//                   onTap: () async {
//                     TimeOfDay? pickedTime = await showTimePicker(
//                       initialTime: TimeOfDay.now(),
//                       context: context,
//                     );

//                     if (pickedTime != null) {
//                       print(pickedTime.format(context)); //output 10:51 PM
//                       DateTime parsedTime = DateFormat.Hm()
//                           .parse(pickedTime.format(context).toString());
//                       //converting to DateTime so that we can further format on different pattern.
//                       print(parsedTime); //output 1970-01-01 22:53:00.000
//                       String formattedTime =
//                           DateFormat('HH:mm:ss').format(parsedTime);
//                       print(formattedTime); //output 14:59:00
//                       //DateFormat() is from intl package, you can format the time on any pattern you need.

//                       setState(() {
//                         aptTimeController.text =
//                             formattedTime; //set the value of text field.
//                       });
//                     } else {
//                       print("Time is not selected");
//                     }
//                   },
//                   validator: MultiValidator(
//                       [RequiredValidator(errorText: 'Required*')]),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 15,
//           ),

//           // Container(
//           //     child: Column(children: <Widget>[
//           //   const Align(
//           //       alignment: Alignment.center,
//           //       child: SizedBox(
//           //         width: 100,
//           //       )),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.07,
//                 width: MediaQuery.of(context).size.width * 0.4,
//                 // child: InputDecorator(
//                 //   decoration: InputDecoration(
//                 //     errorStyle: const TextStyle(fontSize: 0.05),

//                 //     //  fillColor: Colors.grey[10],
//                 //     border: OutlineInputBorder(
//                 //         borderSide: BorderSide(color: Colors.black, width: 10)),
//                 //   ),
//                 // child: DropdownButtonHideUnderline(
//                 child: DropdownButtonFormField(
//                   decoration: InputDecoration(
//                     errorStyle: const TextStyle(fontSize: 0.05),
//                     labelText: 'Payment Mode',
//                     labelStyle: TextStyle(fontSize: 12),
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.black, width: 10)),
//                   ),
//                   items: paymentMode
//                       .map((item) => DropdownMenuItem<String>(
//                             value: item,
//                             child: Text(
//                               item,
//                               style: const TextStyle(
//                                 fontSize: 12,
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ))
//                       .toList(),
//                   value: selectedMode,
//                   onChanged: (val) {
//                     setState(() {
//                       selectedMode = val as String;
//                     });
//                   },
//                   // isExpanded: true,
//                   // buttonHeight: 30,
//                   // buttonWidth: 200,
//                   // itemHeight: 40,
//                   // dropdownWidth: 200,
//                 ),
//               ),
//               SizedBox(
//                 width: 7,
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.07,
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 // child: InputDecorator(
//                 //   decoration: InputDecoration(
//                 // errorStyle: const TextStyle(fontSize: 0.05),
//                 //  fillColor: Colors.grey[10],

//                 // child: DropdownButtonHideUnderline(
//                 child: DropdownButtonFormField(
//                   decoration: InputDecoration(
//                     errorStyle: const TextStyle(fontSize: 0.05),
//                     labelText: 'Appointment Status',
//                     labelStyle: TextStyle(fontSize: 12),
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.black, width: 10)),
//                   ),
//                   validator: MultiValidator(
//                       [RequiredValidator(errorText: 'Please Enter comments')]),
//                   // ),

//                   // disabledHint: Text("Can't select"),
//                   // hint: Text(
//                   //   'Appointment Status ',
//                   //   style: TextStyle(
//                   //     fontSize: 12,
//                   //   ),
//                   //   overflow: TextOverflow.ellipsis,
//                   // ),
//                   items: item1
//                       .map((item) => DropdownMenuItem<String>(
//                             value: item,
//                             child: Text(
//                               item,
//                               style: const TextStyle(
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ))
//                       .toList(),
//                   value: selectedItem,
//                   onChanged: (val) {
//                     setState(() {
//                       selectedItem = val as String;
//                     });
//                   },
//                   //buttonHeight: 20,
//                   //  buttonWidth: 200,
//                   //itemHeight: 40,
//                   //dropdownWidth: 200,
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 15,
//           ),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.06,
//                 width: MediaQuery.of(context).size.width * 0.4,
//                 child: TextFormField(
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     //   FilteringTextInputFormatter.digitsOnly,
//                     LengthLimitingTextInputFormatter(50)
//                   ],
//                   style: TextStyle(fontSize: 12),
//                   // autovalidateMode: AutovalidateMode.onUserInteraction,
//                   controller: totalFeesController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                       errorStyle: const TextStyle(fontSize: 0.05),
//                       border: OutlineInputBorder(),
//                       labelText: 'Fees',
//                       hintText: 'Enter the Fees'),
//                   validator: MultiValidator(
//                       [RequiredValidator(errorText: 'Required*')]),
//                 ),
//               ),
//               SizedBox(
//                 width: 7,
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.06,
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 child: TextFormField(
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,

//                     //   FilteringTextInputFormatter.digitsOnly,
//                     LengthLimitingTextInputFormatter(50)
//                   ],
//                   style: TextStyle(fontSize: 12),
//                   //  autovalidateMode: AutovalidateMode.onUserInteraction,
//                   controller: feesCollectedController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                       errorStyle: const TextStyle(fontSize: 0.05),
//                       border: OutlineInputBorder(),
//                       labelText: 'Fees Collected',
//                       hintText: 'Enter the Fees Collected'),
//                   // validator: MultiValidator(
//                   //     [RequiredValidator(errorText: 'Required*')]),
//                 ),
//               ),
//             ],
//           ),

//           // TextFormField(
//           //   autovalidateMode: AutovalidateMode.onUserInteraction,
//           //   inputFormatters: [
//           //     FilteringTextInputFormatter.allow(RegExp("[a-z A-Z ]")),
//           //     //   FilteringTextInputFormatter.digitsOnly,
//           //     LengthLimitingTextInputFormatter(50)
//           //   ],
//           //   // textCapitalization: TextCapitalization.characters,
//           //   controller: paymentModeController,
//           //   keyboardType: TextInputType.name,
//           //   decoration: InputDecoration(
//           //       suffixIcon: PopupMenuButton<String>(
//           //         // SizedBox(
//           //         icon: Icon(Icons.arrow_drop_down),
//           //         onSelected: (String value) {
//           //           //   height: 10,

//           //           // );
//           //           paymentModeController.text = value;
//           //         },
//           //         itemBuilder: (BuildContext context) {
//           //           return paymentMode
//           //               .map<PopupMenuItem<String>>((String value) {
//           //             return new PopupMenuItem(
//           //                 height: 60,
//           //                 padding: EdgeInsets.symmetric(
//           //                   horizontal: 50,
//           //                   vertical: 5,
//           //                 ),
//           //                 textStyle:
//           //                     TextStyle(color: Colors.black, fontSize: 14),
//           //                 child: new Text(value),
//           //                 value: value);
//           //           }).toList();
//           //         },
//           //       ),
//           //       border: OutlineInputBorder(),
//           //       labelText: 'Payment Mode',
//           //       hintText: 'Enter the payment Mode'),
//           //   validator:
//           //       MultiValidator([RequiredValidator(errorText: 'Required*')]),
//           // ),

//           SizedBox(
//             height: 15,
//           ),

//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.06,
//             width: MediaQuery.of(context).size.width * 0.9,
//             child: TextFormField(
//               inputFormatters: [
//                 FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9]")),
//                 //   FilteringTextInputFormatter.digitsOnly,
//                 LengthLimitingTextInputFormatter(100)
//               ],
//               style: TextStyle(fontSize: 12),
//               // textCapitalization: TextCapitalization.characters,

//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               controller: commentsController,
//               keyboardType: TextInputType.name,
//               decoration: const InputDecoration(
//                   errorStyle: const TextStyle(fontSize: 0.05),
//                   border: OutlineInputBorder(),
//                   labelText: 'Comments',
//                   hintText: 'Enter the Comments'),
//               // validator: MultiValidator(
//               //     [RequiredValidator(errorText: 'Please Enter comments')]),
//               // ),
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Container(

//               //alignment: Alignment.center,
//               height: 35,
//               width: 200,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Color.fromARGB(255, 3, 89, 168),
//               ),
//               child: ElevatedButton(
//                 // style: ElevatedButton.styleFrom(
//                 //   backgroundColor: Colors.transparent,
//                 //   shadowColor: Colors.transparent,
//                 //   // shape: RoundedRectangleBorder(borderRadius: borderRadius),
//                 // ),
//                 onPressed: () {
//                   //_formKey.currentState?.validate();
//                   // final isValidForm = _formKey.currentState!.validate();
//                   // if (isValidForm) {
//                   final int? aptId = apID;
//                   print('apt id add $aptId');

//                   final int docId = dID;
//                   //int.parse(docIdController.text).toInt();
//                   print('doc id add $dID');
//                   final int staffId = staff_Id;
//                   print('add staff id $staffId');
//                   // print(staffId);

//                   // final int staffId = int.parse(staffIdController.text).toInt();

//                   // final String docTitle = docTitleController.text;

//                   //  final String tokenNo = tokenNocontroller.text;

//                   final String partyName = partyNameController.text;
//                   final String partyType = selectedValue.toString();
//                   final String aptStatus = selectedItem.toString();
//                   final String? paymentMode = selectedMode.toString();

//                   final String aptplace = aptplaceController.text;

//                   final String city = cityController.text;

//                   final String aptDate = aptDateController.text;

//                   final String aptTime = aptTimeController.text;

//                   final int? feesCollected =
//                       int.parse(feesCollectedController.text).toInt();

//                   final int totalFees =
//                       int.parse(totalFeesController.text).toInt();

//                   //  final String paymentMode = paymentModeController.text;

//                   // final String aptExecutive = aptExecutiveController.text;

//                   // final String aptStatus = aptStatusController.text;

//                   final String contactNo = contactNoController.text;

//                   final String? comments = commentsController.text;

//                   // if (Response != true) {
//                   //   Fluttertoast.showToast(
//                   //       msg: "Data Saved Sucessfully",
//                   //       toastLength: Toast.LENGTH_LONG,
//                   //       gravity: ToastGravity.CENTER,
//                   //       timeInSecForIosWeb: 1,
//                   //       backgroundColor: Color.fromARGB(255, 3, 87, 156),
//                   //       textColor: Colors.white,
//                   //       fontSize: 12.0);
//                   // } else {
//                   //   Fluttertoast.showToast(
//                   //       msg: "Data Not Saved Sucessfully",
//                   //       toastLength: Toast.LENGTH_LONG,
//                   //       gravity: ToastGravity.CENTER,
//                   //       timeInSecForIosWeb: 1,
//                   //       backgroundColor: Color.fromARGB(255, 3, 87, 156),
//                   //       textColor: Colors.white,
//                   //       fontSize: 12.0);
//                   // }

//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (BuildContext context) => AppointmentPageFE()));

//                   setState(() {
//                     _futureAppointment = createAppointment(
//                       aptId!,
//                       docId,
//                       staffId,
// //   docTitle,
//                       //  tokenNo,
//                       partyName,
//                       contactNo,
//                       partyType,
//                       aptplace,
//                       city,
//                       feesCollected!,
//                       totalFees,
//                       paymentMode!,
//                       aptDate,
//                       aptTime,
//                       // aptExecutive,
//                       aptStatus,
//                       comments!,
//                     );
//                   });
//                   // }
//                   // }
//                 },
//                 child: const Text("Save"),
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                         Color.fromARGB(255, 3, 89, 168))),
//               ))
//         ],
//       ),
//     );
//   }

//   FutureBuilder<Appointment> buildFutureBuilder() {
//     return FutureBuilder<Appointment>(
//       future: _futureAppointment,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         }

//         return const CircularProgressIndicator();
//       },
//     );
//   }
// }

// // import 'package:AtDocHUB/Controller/DocumentController.dart';
// // import 'package:AtDocHUB/Model/Appointment.dart';
// // import 'package:AtDocHUB/View/AppointmentPageFE.dart';
// // import 'package:auto_size_text/auto_size_text.dart';
// // import 'package:dropdown_button2/dropdown_button2.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:flutter_typeahead/flutter_typeahead.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// // import 'package:form_field_validator/form_field_validator.dart';
// // import 'package:get/get.dart';
// // import 'package:intl/intl.dart';
// // import 'package:AtDocHUB/Controller/AppointmentController.dart';

// // import '../../Model/Document.dart';

// // DateTime now = DateTime.now();
// // String formattedDate = DateFormat("yyyy-MM-dd").format(now);

// // class AddAppointment extends StatefulWidget {
// //   @override
// //   _AddAppointmentState createState() {
// //     return _AddAppointmentState();
// //   }
// // }

// // class _AddAppointmentState extends State<AddAppointment> {
// //   var paymentMode = ["Online", "Cash", "Cheque"];
// //   String? selectedMode;
// //   var item1 = ["Open", "Closed", "Cancel"];
// //   String? selectedItem;
// //   //late String items = '';

// //   late final String date1;
// //   DateTime? selectedDateTime;
// //   final int apID = 0;

// //   late String datainput;
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// //   final TextEditingController docIdController = TextEditingController();
// //   // final TextEditingController aptIdController = TextEditingController();
// //   final TextEditingController staffIdController = TextEditingController();

// //   final TextEditingController docTitleController = TextEditingController();
// //   final TextEditingController tokenNocontroller = TextEditingController();
// //   final TextEditingController partyNameController = TextEditingController();
// //   final TextEditingController partyTypeController = TextEditingController();
// //   final TextEditingController aptplaceController = TextEditingController();

// //   final TextEditingController cityController = TextEditingController();

// //   final TextEditingController aptDateController = TextEditingController();
// //   final TextEditingController aptTimeController = TextEditingController();
// //   final TextEditingController feesCollectedController = TextEditingController();

// //   final TextEditingController totalFeesController = TextEditingController();
// //   final TextEditingController paymentModeController = TextEditingController();
// //   final TextEditingController aptExecutiveController = TextEditingController();
// //   final TextEditingController aptStatusController = TextEditingController();
// //   final TextEditingController contactNoController = TextEditingController();
// //   final TextEditingController commentsController = TextEditingController();
// //   final List<String> items = [
// //     "Owner",
// //     "Tenant",
// //     "Agent",
// //     "Both",
// //   ];
// //   String? selectedValue;

// //   late final int dID;

// //   List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
// //     List<DropdownMenuItem<String>> _menuItems = [];
// //     for (var item in items) {
// //       _menuItems.addAll(
// //         [
// //           DropdownMenuItem<String>(
// //             value: item,
// //             child: Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 8.0),
// //               child: Text(
// //                 item,
// //                 style: const TextStyle(
// //                   fontSize: 14,
// //                 ),
// //               ),
// //             ),
// //           ),
// //           //If it's last item, we will not add Divider after it.
// //           if (item != items.last)
// //             const DropdownMenuItem<String>(
// //               enabled: false,
// //               child: Divider(),
// //             ),
// //         ],
// //       );
// //     }
// //     return _menuItems;
// //   }

// //   List<int> _getDividersIndexes() {
// //     List<int> _dividersIndexes = [];
// //     for (var i = 0; i < (items.length * 2) - 1; i++) {
// //       //Dividers indexes will be the odd indexes
// //       if (i.isOdd) {
// //         _dividersIndexes.add(i);
// //       }
// //     }
// //     return _dividersIndexes;
// //   }

// //   @override
// //   void dispose() {
// //     aptStatusController.dispose();
// //     partyTypeController.dispose();
// //     paymentModeController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Future<Appointment>? _futureAppointment;

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       //  title: 'Add new Document',
// //       theme: ThemeData(
// //           //  backgroundColor: Color.fromARGB(255, 3, 87, 156),
// //           // primarySwatch: Color.fromARGB(255, 3, 87, 156),
// //           ),
// //       home: Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Color.fromARGB(255, 3, 87, 156),
// //           title: const Text('Add new Appointment'),
// //           leading: IconButton(
// //               icon: BackButtonIcon(),
// //               onPressed: () => Navigator.of(context).push(MaterialPageRoute(
// //                   builder: (BuildContext context) => AppointmentPageFE()))),
// //         ),
// //         body:
// //             // Expanded(
// //             //  child: SingleChildScrollView(
// //             SafeArea(
// //           child: SingleChildScrollView(
// //             child: Container(
// //               //  key: _formKey,
// //               alignment: Alignment.center,
// //               padding: const EdgeInsets.all(8.0),

// //               child: (_futureAppointment == null)
// //                   ? buildColumn()
// //                   : buildFutureBuilder(),
// //             ),
// //           ),
// //         ),
// //       ),

// //       // )
// //     );
// //   }

// //   Form buildColumn() {
// //     return Form(
// //       key: _formKey,
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: <Widget>[
// //           // typeFieldWidget(),
// //           // typeFieldWidget1(),
// //           SizedBox(
// //             height: 10,
// //           ),
// //           // TextFormField(
// //           //   autovalidateMode: AutovalidateMode.onUserInteraction,
// //           //   inputFormatters: [
// //           //     FilteringTextInputFormatter.digitsOnly,
// //           //     LengthLimitingTextInputFormatter(5)
// //           //   ],
// //           //   controller: docIdController,
// //           //   keyboardType: TextInputType.number,
// //           //   decoration: const InputDecoration(
// //           //       border: OutlineInputBorder(),
// //           //       labelText: 'Document ID',
// //           //       hintText: 'Enter the DocId'),
// //           //   validator:
// //           //       MultiValidator([RequiredValidator(errorText: 'Required*')]),
// //           // ),
// //           // SizedBox(
// //           //   height: 20,
// //           // ),
// //           SizedBox(
// //             height: MediaQuery.of(context).size.height * 0.06,
// //             width: MediaQuery.of(context).size.width * 0.9,
// //             child: TextFormField(
// //               // autovalidateMode: AutovalidateMode.onUserInteraction,
// //               inputFormatters: [
// //                 FilteringTextInputFormatter.digitsOnly,
// //                 LengthLimitingTextInputFormatter(5)
// //               ],
// //               style: TextStyle(fontSize: 12),
// //               controller: staffIdController,
// //               keyboardType: TextInputType.number,
// //               decoration: const InputDecoration(
// //                   border: OutlineInputBorder(),
// //                   labelText: 'Staff ID',
// //                   hintText: 'Enter the Staff ID'),
// //               validator:
// //                   MultiValidator([RequiredValidator(errorText: 'Required*')]),
// //             ),
// //           ),
// //           SizedBox(
// //             height: 15,
// //           ),

// //           //  width: MediaQuery.of(context).size.width,
// //           //  height: MediaQuery.of(context).size.height * 0.5,
// //           // width: 10,
// //           // padding: EdgeInsets.all(16),
// //           SizedBox(
// //             width: MediaQuery.of(context).size.width * 0.9,
// //             height: MediaQuery.of(context).size.height * 0.06,
// //             child: TypeAheadField<Document>(
// //               hideSuggestionsOnKeyboardHide: true,
// //               textFieldConfiguration: TextFieldConfiguration(
// //                 decoration: InputDecoration(
// //                   errorStyle: const TextStyle(fontSize: 0.05),

// //                   fillColor: Color.fromARGB(255, 233, 246, 252),
// //                   //  prefixIcon: Icon(Icons.search),
// //                   suffixIcon: GestureDetector(
// //                     child: Icon(
// //                       Icons.close,
// //                       color: Color.fromARGB(137, 221, 221, 221),
// //                       size: 20,
// //                     ),
// //                     onTap: () {
// //                       docTitleController.clear();
// //                       FocusScope.of(context).requestFocus(FocusNode());
// //                     },
// //                   ),
// //                   border: OutlineInputBorder(
// //                       // borderRadius: BorderRadius.circular(10.0),
// //                       ),
// //                   hintText: 'Document Title ',
// //                   hintStyle: TextStyle(fontSize: 12),
// //                 ),
// //                 controller: this.docTitleController,
// //               ),
// //               suggestionsCallback: DocumentController.getdocs,
// //               itemBuilder: (context, Document suggestion) {
// //                 final user = suggestion;

// //                 return ListTile(
// //                   title: Text(user.docTitle),
// //                 );
// //               },
// //               noItemsFoundBuilder: (context) => Container(
// //                 height: 50,
// //                 child: Center(
// //                   child: Text(
// //                     'No Documents Found.',
// //                     style: TextStyle(fontSize: 12),
// //                   ),
// //                 ),
// //               ),
// //               onSuggestionSelected: (Document? suggestion) {
// //                 final user = suggestion!;
// //                 this.docTitleController.text = user.docTitle;

// //                 this.tokenNocontroller.text = user.tokenNo;

// //                 this.partyNameController.text = user.partyName;
// //                 setState(() {
// //                   this.dID = user.docId;
// //                 });

// //                 // Navigator.of(context).push(MaterialPageRoute(
// //                 //     builder: (context) =>
// //                 //         DocumentStatusReport(user.docId)));
// //               },
// //             ),
// //           ),

// //           // TextFormField(
// //           //   autovalidateMode: AutovalidateMode.onUserInteraction,
// //           //   inputFormatters: [
// //           //     LengthLimitingTextInputFormatter(100),
// //           //     FilteringTextInputFormatter.allow(
// //           //         RegExp("[,-/ a-z A-Z á-ú Á-Ú 0-9]")),
// //           //   ],
// //           //   style: TextStyle(fontSize: 12),
// //           //   // inputFormatters: [LengthLimitingTextInputFormatter(100)],
// //           //   //textCapitalization: TextCapitalization.characters,
// //           //   controller: docTitleController,
// //           //   keyboardType: TextInputType.name,
// //           //   decoration: const InputDecoration(
// //           //       border: OutlineInputBorder(),
// //           //       labelText: 'Document Title',
// //           //       hintText: 'Enter the docTitle'),
// //           //   validator:
// //           //       MultiValidator([RequiredValidator(errorText: 'Required*')]),
// //           // ),
// //           SizedBox(
// //             height: 15,
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.06,
// //                 width: MediaQuery.of(context).size.width * 0.4,
// //                 child: TextFormField(
// //                   // autovalidateMode: AutovalidateMode.onUserInteraction,
// //                   inputFormatters: [
// //                     FilteringTextInputFormatter.digitsOnly,
// //                     LengthLimitingTextInputFormatter(14)
// //                   ],
// //                   style: TextStyle(fontSize: 12),
// //                   controller: tokenNocontroller,
// //                   readOnly: true,
// //                   keyboardType: TextInputType.number,
// //                   decoration: const InputDecoration(
// //                       errorStyle: const TextStyle(fontSize: 0.05),
// //                       border: OutlineInputBorder(),
// //                       labelText: 'Token No',
// //                       hintText: 'Enter the token No'),
// //                   validator: (value) {
// //                     if (value == null || value.isEmpty) {
// //                       return 'Please enter Token No';
// //                     } else if (value.length < 14) {
// //                       return 'Please enter 14 digits number';
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //               ),
// //               SizedBox(
// //                 width: 7,
// //               ),
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.06,
// //                 width: MediaQuery.of(context).size.width * 0.5,
// //                 child: TextFormField(
// //                   //  autovalidateMode: AutovalidateMode.onUserInteraction,
// //                   controller: aptExecutiveController,
// //                   inputFormatters: [
// //                     FilteringTextInputFormatter.allow(RegExp("[a-z A-Z ]")),
// //                     //   FilteringTextInputFormatter.digitsOnly,
// //                     LengthLimitingTextInputFormatter(50)
// //                   ],
// //                   style: TextStyle(fontSize: 12),
// //                   //textCapitalization: TextCapitalization.words,
// //                   keyboardType: TextInputType.name,
// //                   decoration: const InputDecoration(
// //                       errorStyle: const TextStyle(fontSize: 0.05),
// //                       border: OutlineInputBorder(),
// //                       labelText: 'Appointment Executive',
// //                       hintText: 'Enter the aptExecutive'),
// //                   validator: MultiValidator(
// //                       [RequiredValidator(errorText: 'Required*')]),
// //                 ),
// //               ),
// //             ],
// //           ),

// //           SizedBox(
// //             height: 15,
// //           ),
// //           SizedBox(
// //             height: MediaQuery.of(context).size.height * 0.06,
// //             width: MediaQuery.of(context).size.width * 0.9,
// //             child: TextFormField(
// //               //  autovalidateMode: AutovalidateMode.onUserInteraction,
// //               inputFormatters: [
// //                 LengthLimitingTextInputFormatter(50),
// //                 FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
// //               ],
// //               style: TextStyle(fontSize: 12),
// //               //textCapitalization: TextCapitalization.characters,
// //               //inputFormatters: [LengthLimitingTextInputFormatter(50)],
// //               controller: partyNameController,
// //               keyboardType: TextInputType.name,
// //               decoration: const InputDecoration(
// //                   errorStyle: const TextStyle(fontSize: 0.05),
// //                   border: OutlineInputBorder(),
// //                   labelText: 'Party Name',
// //                   hintText: 'Enter the party Name'),
// //               validator:
// //                   MultiValidator([RequiredValidator(errorText: 'Required*')]),
// //             ),
// //           ),
// //           SizedBox(
// //             height: 20.0,
// //           ),
// //           // Container(
// //           //   // child: Row(
// //           //   child: Column(
// //           //     children: <Widget>[
// //           //       const Align(
// //           //           alignment: Alignment.center,
// //           //           child: SizedBox(
// //           //             width: 50,
// //           //           )),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.07,
// //                 width: MediaQuery.of(context).size.width * 0.4,
// //                 child: InputDecorator(
// //                   decoration: InputDecoration(
// //                     errorStyle: const TextStyle(fontSize: 0.05),
// //                     border: OutlineInputBorder(
// //                         borderSide:
// //                             BorderSide(color: Colors.black, width: 0.1)),
// //                   ),
// //                   child: DropdownButtonHideUnderline(
// //                     child: DropdownButton2(
// //                       underline: Container(
// //                         decoration: ShapeDecoration(
// //                           shape: RoundedRectangleBorder(
// //                             side: BorderSide(
// //                                 width: 1.0, style: BorderStyle.solid),
// //                             borderRadius:
// //                                 BorderRadius.all(Radius.circular(5.0)),
// //                           ),
// //                         ),
// //                       ),
// //                       hint: AutoSizeText(
// //                         'Party Type',
// //                         style: TextStyle(
// //                           fontSize: 12,
// //                           color: Theme.of(context).hintColor,
// //                         ),
// //                       ),
// //                       items: items
// //                           .map((item) => DropdownMenuItem<String>(
// //                                 value: item,
// //                                 child: Text(
// //                                   item,
// //                                   style: const TextStyle(
// //                                     fontSize: 12,
// //                                   ),
// //                                 ),
// //                               ))
// //                           .toList(),
// //                       value: selectedValue,
// //                       onChanged: (value) {
// //                         setState(() {
// //                           selectedValue = value as String;
// //                         });
// //                       },
// //                       buttonHeight: 30,
// //                       buttonWidth: 200,
// //                       itemHeight: 40,
// //                       dropdownWidth: 200,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(
// //                 width: 7,
// //               ),
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.07,
// //                 width: MediaQuery.of(context).size.width * 0.5,
// //                 child: TextFormField(
// //                   inputFormatters: [
// //                     FilteringTextInputFormatter.digitsOnly,
// //                     //   FilteringTextInputFormatter.digitsOnly,
// //                     LengthLimitingTextInputFormatter(10)
// //                   ],
// //                   style: TextStyle(fontSize: 12),
// //                   autovalidateMode: AutovalidateMode.onUserInteraction,
// //                   controller: contactNoController,
// //                   keyboardType: TextInputType.number,
// //                   decoration: const InputDecoration(
// //                       errorStyle: const TextStyle(fontSize: 0.05),
// //                       border: OutlineInputBorder(),
// //                       labelText: 'Contact No',
// //                       hintText: 'Enter the Contact No'),
// //                   validator: (value) {
// //                     if (value == null || value.isEmpty) {
// //                       return 'Please enter contact No';
// //                     } else if (value.length < 10) {
// //                       return 'Please enter 10 digits number';
// //                     }
// //                     return null;
// //                   },
// //                   // ),
// //                 ),
// //               ),
// //             ],
// //           ),

// //           // DropdownButtonHideUnderline(
// //           //   child: Container(
// //           //     height: 50.0,
// //           //     decoration: BoxDecoration(
// //           //         color: Colors.white,
// //           //         borderRadius: BorderRadius.circular(5),
// //           //         border:
// //           //             Border.all(color: Color.fromARGB(255, 128, 126, 126))),
// //           //     child: DropdownButton2(
// //           //       isExpanded: true,
// //           //       hint: Text(
// //           //         '   Select party Type',
// //           //         style: TextStyle(
// //           //           fontSize: 14,
// //           //           color: Color.fromARGB(255, 2, 2, 2),
// //           //         ),
// //           //       ),
// //           //       items: _addDividersAfterItems(items),
// //           //       customItemsIndexes: _getDividersIndexes(),
// //           //       customItemsHeight: 4,
// //           //       value: selectedValue,
// //           //       onChanged: (value) {
// //           //         partyTypeController.text;
// //           //         setState(() {
// //           //           selectedValue = value as String;
// //           //         });
// //           //       },
// //           //       buttonHeight: 40,
// //           //       buttonWidth: 500,
// //           //       itemHeight: 40,
// //           //       itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
// //           //     ),
// //           //   ),
// //           // ),

// //           SizedBox(
// //             height: 15,
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.06,
// //                 width: MediaQuery.of(context).size.width * 0.4,
// //                 child: TextFormField(
// //                   autovalidateMode: AutovalidateMode.onUserInteraction,
// //                   inputFormatters: [
// //                     LengthLimitingTextInputFormatter(100),
// //                     FilteringTextInputFormatter.allow(
// //                         RegExp("[,-/: a-z A-Z á-ú Á-Ú 0-9]")),

// //                     //   FilteringTextInputFormatter.digitsOnly,
// //                   ],
// //                   style: TextStyle(fontSize: 12),
// //                   //textCapitalization: TextCapitalization.words,
// //                   controller: aptplaceController,
// //                   keyboardType: TextInputType.name,
// //                   decoration: const InputDecoration(
// //                       errorStyle: const TextStyle(fontSize: 0.05),
// //                       border: OutlineInputBorder(),
// //                       labelText: 'Appointment Place',
// //                       hintText: 'Enter the apt place'),
// //                   validator: MultiValidator(
// //                       [RequiredValidator(errorText: 'Required*')]),
// //                 ),
// //               ),
// //               SizedBox(
// //                 width: 7,
// //               ),
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.06,
// //                 width: MediaQuery.of(context).size.width * 0.5,
// //                 child: TextFormField(
// //                   autovalidateMode: AutovalidateMode.onUserInteraction,
// //                   inputFormatters: [
// //                     LengthLimitingTextInputFormatter(50),
// //                     FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9]")),
// //                   ],
// //                   style: TextStyle(fontSize: 12),
// //                   // textCapitalization: TextCapitalization.words,
// //                   controller: cityController,
// //                   keyboardType: TextInputType.name,
// //                   decoration: const InputDecoration(
// //                       errorStyle: const TextStyle(fontSize: 0.05),
// //                       border: OutlineInputBorder(),
// //                       labelText: 'City',
// //                       hintText: 'Enter the City'),
// //                   validator: MultiValidator(
// //                       [RequiredValidator(errorText: 'Required*')]),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           SizedBox(
// //             height: 15,
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.06,
// //                 width: MediaQuery.of(context).size.width * 0.4,
// //                 child: TextFormField(
// //                   // maxLength: 10,
// //                   autovalidateMode: AutovalidateMode.onUserInteraction,
// //                   inputFormatters: [
// //                     FilteringTextInputFormatter.allow(RegExp("[- 0-9]")),
// //                     LengthLimitingTextInputFormatter(10)
// //                   ],
// //                   style: TextStyle(fontSize: 12),
// //                   //   inputFormatters: [
// //                   //   //   FilteringTextInputFormatter.digitsOnly,
// //                   //   LengthLimitingTextInputFormatter(50)
// //                   // ],
// //                   controller: aptDateController,
// //                   keyboardType: TextInputType.datetime,
// //                   decoration: const InputDecoration(
// //                       errorStyle: const TextStyle(fontSize: 0.05),
// //                       prefixIcon: Icon(Icons.calendar_month),
// //                       border: OutlineInputBorder(),
// //                       labelText: 'Appointment Date',
// //                       labelStyle: TextStyle(fontSize: 10),
// //                       hintText: 'yyyy-MM-dd'),
// //                   onTap: () async {
// //                     DateTime? pickedDate = await showDatePicker(
// //                       context: context,
// //                       initialDate: selectedDateTime ?? DateTime.now(),
// //                       firstDate: DateTime(
// //                           1991), //DateTime.now() - not to allow to choose before today.
// //                       lastDate: DateTime(2101),
// //                       // onConfirm:widget.onChanged,
// //                     ).then((pickedDate) {
// //                       if (pickedDate != null) {
// //                         // print(
// //                         //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
// //                         String formattedDate =
// //                             DateFormat('yyyy-MM-dd').format(pickedDate);

// //                         print(formattedDate);

// //                         setState(() {
// //                           aptDateController.text = formattedDate;
// //                           selectedDateTime = pickedDate;

// //                           //set output date to TextField value.
// //                         });
// //                         print(aptDateController.text);
// //                         //formatted date output using intl package =>  2021-03-16
// //                         //you can implement different kind of Date Format here according to your requirement
// //                         // DateFormat df = new DateFormat("yyyy-MM-dd");
// //                         // String stDate = df.format(pickedDate);
// //                         // print(stDate);

// //                       } else {
// //                         print("Date is not selected");
// //                       }
// //                     });

// //                     // final docs = await DocumentController.checkDate(stDate);

// //                     // setState(() => this.docs = docs);
// //                   },
// //                   validator: MultiValidator(
// //                       [RequiredValidator(errorText: 'Required*')]),
// //                 ),
// //               ),
// //               SizedBox(
// //                 width: 7,
// //               ),
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.06,
// //                 width: MediaQuery.of(context).size.width * 0.5,
// //                 child: TextFormField(
// //                   autovalidateMode: AutovalidateMode.onUserInteraction,
// //                   inputFormatters: [
// //                     FilteringTextInputFormatter.allow(RegExp("[: 0-9]")),
// //                   ],
// //                   style: TextStyle(fontSize: 12),
// //                   controller: aptTimeController,
// //                   keyboardType: TextInputType.datetime,
// //                   decoration: const InputDecoration(
// //                       errorStyle: const TextStyle(fontSize: 0.05),
// //                       prefixIcon: Icon(Icons.timer),
// //                       border: OutlineInputBorder(),
// //                       labelText: 'Appointment Time',
// //                       labelStyle: TextStyle(fontSize: 10),
// //                       hintText: 'HH:mm:ss'),
// //                   onTap: () async {
// //                     TimeOfDay? pickedTime = await showTimePicker(
// //                       initialTime: TimeOfDay.now(),
// //                       context: context,
// //                     );

// //                     if (pickedTime != null) {
// //                       print(pickedTime.format(context)); //output 10:51 PM
// //                       DateTime parsedTime = DateFormat.Hm()
// //                           .parse(pickedTime.format(context).toString());
// //                       //converting to DateTime so that we can further format on different pattern.
// //                       print(parsedTime); //output 1970-01-01 22:53:00.000
// //                       String formattedTime =
// //                           DateFormat('HH:mm:ss').format(parsedTime);
// //                       print(formattedTime); //output 14:59:00
// //                       //DateFormat() is from intl package, you can format the time on any pattern you need.

// //                       setState(() {
// //                         aptTimeController.text =
// //                             formattedTime; //set the value of text field.
// //                       });
// //                     } else {
// //                       print("Time is not selected");
// //                     }
// //                   },
// //                   validator: MultiValidator(
// //                       [RequiredValidator(errorText: 'Required*')]),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           SizedBox(
// //             height: 15,
// //           ),

// //           // Container(
// //           //     child: Column(children: <Widget>[
// //           //   const Align(
// //           //       alignment: Alignment.center,
// //           //       child: SizedBox(
// //           //         width: 100,
// //           //       )),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.07,
// //                 width: MediaQuery.of(context).size.width * 0.4,
// //                 child: InputDecorator(
// //                   decoration: InputDecoration(
// //                     errorStyle: const TextStyle(fontSize: 0.05),

// //                     //  fillColor: Colors.grey[10],
// //                     border: OutlineInputBorder(
// //                         borderSide: BorderSide(color: Colors.black, width: 10)),
// //                   ),
// //                   child: DropdownButtonHideUnderline(
// //                     child: DropdownButton2(
// //                       disabledHint: AutoSizeText("Can't select"),
// //                       hint: AutoSizeText(
// //                         'Payment Mode',
// //                         style: TextStyle(
// //                           fontSize: 10,
// //                         ),
// //                         overflow: TextOverflow.ellipsis,
// //                       ),
// //                       items: paymentMode
// //                           .map((item) => DropdownMenuItem<String>(
// //                                 value: item,
// //                                 child: Text(
// //                                   item,
// //                                   style: const TextStyle(
// //                                     fontSize: 12,
// //                                   ),
// //                                   overflow: TextOverflow.ellipsis,
// //                                 ),
// //                               ))
// //                           .toList(),
// //                       value: selectedMode,
// //                       onChanged: (value) {
// //                         setState(() {
// //                           selectedMode = value as String;
// //                         });
// //                       },
// //                       isExpanded: true,
// //                       buttonHeight: 30,
// //                       buttonWidth: 200,
// //                       itemHeight: 40,
// //                       dropdownWidth: 200,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(
// //                 width: 7,
// //               ),
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.07,
// //                 width: MediaQuery.of(context).size.width * 0.5,
// //                 child: InputDecorator(
// //                   decoration: InputDecoration(
// //                     errorStyle: const TextStyle(fontSize: 0.05),

// //                     //  fillColor: Colors.grey[10],
// //                     border: OutlineInputBorder(
// //                         borderSide: BorderSide(color: Colors.black, width: 10)),
// //                   ),
// //                   child: DropdownButtonHideUnderline(
// //                     child: DropdownButton2(
// //                       disabledHint: AutoSizeText("Can't select"),
// //                       hint: AutoSizeText(
// //                         'Appointment Status ',
// //                         style: TextStyle(
// //                           fontSize: 10,
// //                         ),
// //                         overflow: TextOverflow.ellipsis,
// //                       ),
// //                       items: item1
// //                           .map((item) => DropdownMenuItem<String>(
// //                                 value: item,
// //                                 child: Text(
// //                                   item,
// //                                   style: const TextStyle(
// //                                     fontSize: 12,
// //                                   ),
// //                                 ),
// //                               ))
// //                           .toList(),
// //                       value: selectedItem,
// //                       onChanged: (value) {
// //                         setState(() {
// //                           selectedItem = value as String;
// //                         });
// //                       },
// //                       buttonHeight: 20,
// //                       buttonWidth: 200,
// //                       itemHeight: 40,
// //                       dropdownWidth: 200,
// //                     ),
// //                   ),
// //                 ),
// //               )
// //             ],
// //           ),
// //           SizedBox(
// //             height: 15,
// //           ),

// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.06,
// //                 width: MediaQuery.of(context).size.width * 0.4,
// //                 child: TextFormField(
// //                   inputFormatters: [
// //                     FilteringTextInputFormatter.digitsOnly,
// //                     //   FilteringTextInputFormatter.digitsOnly,
// //                     LengthLimitingTextInputFormatter(50)
// //                   ],
// //                   style: TextStyle(fontSize: 12),
// //                   // autovalidateMode: AutovalidateMode.onUserInteraction,
// //                   controller: totalFeesController,
// //                   keyboardType: TextInputType.number,
// //                   decoration: const InputDecoration(
// //                       errorStyle: const TextStyle(fontSize: 0.05),
// //                       border: OutlineInputBorder(),
// //                       labelText: 'Fees',
// //                       hintText: 'Enter the Fees'),
// //                   validator: MultiValidator(
// //                       [RequiredValidator(errorText: 'Required*')]),
// //                 ),
// //               ),
// //               SizedBox(
// //                 width: 7,
// //               ),
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.06,
// //                 width: MediaQuery.of(context).size.width * 0.5,
// //                 child: TextFormField(
// //                   inputFormatters: [
// //                     FilteringTextInputFormatter.digitsOnly,

// //                     //   FilteringTextInputFormatter.digitsOnly,
// //                     LengthLimitingTextInputFormatter(50)
// //                   ],
// //                   style: TextStyle(fontSize: 12),
// //                   //  autovalidateMode: AutovalidateMode.onUserInteraction,
// //                   controller: feesCollectedController,
// //                   keyboardType: TextInputType.number,
// //                   decoration: const InputDecoration(
// //                       errorStyle: const TextStyle(fontSize: 0.05),
// //                       border: OutlineInputBorder(),
// //                       labelText: 'Fees Collected',
// //                       hintText: 'Enter the Fees Collected'),
// //                   validator: MultiValidator(
// //                       [RequiredValidator(errorText: 'Required*')]),
// //                 ),
// //               ),
// //             ],
// //           ),

// //           // TextFormField(
// //           //   autovalidateMode: AutovalidateMode.onUserInteraction,
// //           //   inputFormatters: [
// //           //     FilteringTextInputFormatter.allow(RegExp("[a-z A-Z ]")),
// //           //     //   FilteringTextInputFormatter.digitsOnly,
// //           //     LengthLimitingTextInputFormatter(50)
// //           //   ],
// //           //   // textCapitalization: TextCapitalization.characters,
// //           //   controller: paymentModeController,
// //           //   keyboardType: TextInputType.name,
// //           //   decoration: InputDecoration(
// //           //       suffixIcon: PopupMenuButton<String>(
// //           //         // SizedBox(
// //           //         icon: Icon(Icons.arrow_drop_down),
// //           //         onSelected: (String value) {
// //           //           //   height: 10,

// //           //           // );
// //           //           paymentModeController.text = value;
// //           //         },
// //           //         itemBuilder: (BuildContext context) {
// //           //           return paymentMode
// //           //               .map<PopupMenuItem<String>>((String value) {
// //           //             return new PopupMenuItem(
// //           //                 height: 60,
// //           //                 padding: EdgeInsets.symmetric(
// //           //                   horizontal: 50,
// //           //                   vertical: 5,
// //           //                 ),
// //           //                 textStyle:
// //           //                     TextStyle(color: Colors.black, fontSize: 14),
// //           //                 child: new Text(value),
// //           //                 value: value);
// //           //           }).toList();
// //           //         },
// //           //       ),
// //           //       border: OutlineInputBorder(),
// //           //       labelText: 'Payment Mode',
// //           //       hintText: 'Enter the payment Mode'),
// //           //   validator:
// //           //       MultiValidator([RequiredValidator(errorText: 'Required*')]),
// //           // ),

// //           SizedBox(
// //             height: 15,
// //           ),

// //           SizedBox(
// //             height: MediaQuery.of(context).size.height * 0.06,
// //             width: MediaQuery.of(context).size.width * 0.9,
// //             child: TextFormField(
// //               inputFormatters: [
// //                 FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9]")),
// //                 //   FilteringTextInputFormatter.digitsOnly,
// //                 LengthLimitingTextInputFormatter(100)
// //               ],
// //               style: TextStyle(fontSize: 12),
// //               // textCapitalization: TextCapitalization.characters,

// //               autovalidateMode: AutovalidateMode.onUserInteraction,
// //               controller: commentsController,
// //               keyboardType: TextInputType.name,
// //               decoration: const InputDecoration(
// //                   errorStyle: const TextStyle(fontSize: 0.05),
// //                   border: OutlineInputBorder(),
// //                   labelText: 'Comments',
// //                   hintText: 'Enter the Comments'),
// //               validator: MultiValidator(
// //                   [RequiredValidator(errorText: 'Please Enter comments')]),
// //               // ),
// //             ),
// //           ),
// //           SizedBox(
// //             height: 15,
// //           ),
// //           Container(

// //               //alignment: Alignment.center,
// //               height: 35,
// //               width: 200,
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(10),
// //                 color: Color.fromARGB(255, 3, 89, 168),
// //               ),
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   final isValidForm = _formKey.currentState!.validate();
// //                   if (isValidForm) {
// //                     final int aptId = apID;

// //                     final int docId = dID;
// //                     //int.parse(docIdController.text).toInt();
// //                     print(dID);
// //                     final int staffId =
// //                         int.parse(staffIdController.text).toInt();

// //                     // final String docTitle = docTitleController.text;

// //                     //final String tokenNo = tokenNocontroller.text;

// //                     final String partyName = partyNameController.text;
// //                     final String partyType = selectedValue.toString();
// //                     final String aptStatus = selectedItem.toString();
// //                     final String paymentMode = selectedMode.toString();

// //                     final String aptplace = aptplaceController.text;

// //                     final String city = cityController.text;

// //                     final String aptDate = aptDateController.text;

// //                     final String aptTime = aptTimeController.text;

// //                     final int feesCollected =
// //                         int.parse(feesCollectedController.text).toInt();

// //                     final int totalFees =
// //                         int.parse(totalFeesController.text).toInt();

// //                     //   final String paymentMode = paymentModeController.text;

// //                     // final String aptExecutive = aptExecutiveController.text;

// //                     // final String aptStatus = aptStatusController.text;

// //                     final String contactNo = contactNoController.text;

// //                     final String comments = commentsController.text;

// //                     // if (Response != true) {
// //                     //   Fluttertoast.showToast(
// //                     //       msg: "Data Saved Sucessfully",
// //                     //       toastLength: Toast.LENGTH_LONG,
// //                     //       gravity: ToastGravity.CENTER,
// //                     //       timeInSecForIosWeb: 1,
// //                     //       backgroundColor: Color.fromARGB(255, 3, 87, 156),
// //                     //       textColor: Colors.white,
// //                     //       fontSize: 12.0);
// //                     // } else {
// //                     //   Fluttertoast.showToast(
// //                     //       msg: "Data Not Saved Sucessfully",
// //                     //       toastLength: Toast.LENGTH_LONG,
// //                     //       gravity: ToastGravity.CENTER,
// //                     //       timeInSecForIosWeb: 1,
// //                     //       backgroundColor: Color.fromARGB(255, 3, 87, 156),
// //                     //       textColor: Colors.white,
// //                     //       fontSize: 12.0);
// //                     // }

// //                     Navigator.of(context).push(MaterialPageRoute(
// //                         builder: (BuildContext context) =>
// //                             AppointmentPageFE()));

// //                     setState(() {
// //                       _futureAppointment = createAppointment(
// //                         aptId,
// //                         docId,
// //                         staffId,
// //                         //String docTitle,
// //                         // String tokenNo,
// //                         partyName,
// //                         contactNo,
// //                         partyType,
// //                         aptplace,
// //                         city,
// //                         feesCollected,
// //                         totalFees,
// //                         paymentMode,
// //                         aptDate,
// //                         aptTime,
// //                         // String aptExecutive,
// //                         aptStatus,
// //                         comments,
// //                       );
// //                     });
// //                     // }
// //                   }
// //                 },
// //                 child: const Text("Save"),
// //                 style: ButtonStyle(
// //                     backgroundColor: MaterialStateProperty.all(
// //                         Color.fromARGB(255, 3, 89, 168))),
// //               ))
// //         ],
// //       ),
// //     );
// //   }

// //   FutureBuilder<Appointment> buildFutureBuilder() {
// //     return FutureBuilder<Appointment>(
// //       future: _futureAppointment,
// //       builder: (context, snapshot) {
// //         if (snapshot.hasData) {
// //         } else if (snapshot.hasError) {
// //           return Text('${snapshot.error}');
// //         }

// //         return const CircularProgressIndicator();
// //       },
// //     );
// //   }
// // }

import 'package:AtDocHUB/Controller/DocumentController.dart';
import 'package:AtDocHUB/Controller/LoginController.dart';
import 'package:AtDocHUB/Model/Appointment.dart';
import 'package:AtDocHUB/View/AppointmentPageFE.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:AtDocHUB/Controller/AppointmentController.dart';

import '../../Model/Document.dart';
import '../../Model/User.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat("yyyy-MM-dd").format(now);

class AddAppointment extends StatefulWidget {
  @override
  _AddAppointmentState createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  Future<Appointment>? _futureAppointment;

  var paymentMode = ["Online", "Cash", "Cheque"];
  String? selectedMode;
  var item1 = ["Open", "Closed", "Cancel"];
  String? selectedItem;
  //late String items = '';

  late final String date1;
  DateTime? selectedDateTime;

  late String datainput;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController docIdController = TextEditingController();
  // final TextEditingController aptIdController = TextEditingController();
  final TextEditingController staffIdController = TextEditingController();

  final TextEditingController docTitleController = TextEditingController();
  final TextEditingController tokenNocontroller = TextEditingController();
  final TextEditingController partyNameController = TextEditingController();
  final TextEditingController partyTypeController = TextEditingController();
  final TextEditingController aptplaceController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController aptDateController = TextEditingController();
  final TextEditingController aptTimeController = TextEditingController();
  final TextEditingController feesCollectedController = TextEditingController();

  final TextEditingController totalFeesController = TextEditingController();
  final TextEditingController paymentModeController = TextEditingController();
  final TextEditingController aptExecutiveController = TextEditingController();
  final TextEditingController aptStatusController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();
  final List<String> items = [
    "Owner",
    "Tenant",
    "Agent",
    "Both",
  ];

  String? selectedValue;
  //late int? feesCl;
  late final int dID;
  late final int staff_Id;
  //late int Uid;
  //late int ExId;
  late final apID = null;

  late String executiveName;

  List<UserLogin> allUsers = [];

  @override
  void dispose() {
    aptStatusController.dispose();
    partyTypeController.dispose();
    paymentModeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final allUsrs = await LoginController.users();
    // if (feesCollectedController.text.isEmpty) {
    //   print('If Block');
    //   setState(() {
    //     this.feesCl = 0;
    //   });
    // }
    // if (feesCollectedController.text != '' ||
    //     feesCollectedController.text.isNotEmpty) {
    //   print('Fees Cl else block');
    //   setState(() {
    //     this.feesCl = int.parse(feesCollectedController.text).toInt();
    //   });
    // }
    //this.feesCl = int.parse(feesCollectedController.text).toInt();

    setState(() {
      this.allUsers = allUsrs;
      // this.feesCl = int.parse(feesCollectedController.text).toInt();

      //this.FeesCollected == feesCollectedController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //  title: 'Add new Document',
        theme: ThemeData(
            //  backgroundColor: Color.fromARGB(255, 3, 87, 156),
            // primarySwatch: Color.fromARGB(255, 3, 87, 156),
            ),
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 3, 87, 156),
              title: const Text('Add new Appointment'),
              leading: IconButton(
                  icon: BackButtonIcon(),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AppointmentPageFE()))),
            ),
            body:
                // Expanded(
                //  child: SingleChildScrollView(
                SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  //  key: _formKey,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8.0),

                  child: (_futureAppointment == null)
                      ? buildColumn()
                      : buildFutureBuilder(),
                ),
              ),
            )));

    // )
  }

  Form buildColumn() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // typeFieldWidget(),
          // typeFieldWidget1(),
          SizedBox(
            height: 10,
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.06,
            child: TypeAheadField<Document>(
              hideSuggestionsOnKeyboardHide: true,
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(
                  errorStyle: const TextStyle(fontSize: 0.05),

                  fillColor: Color.fromARGB(255, 233, 246, 252),
                  //  prefixIcon: Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    child: Icon(
                      Icons.close,
                      color: Color.fromARGB(137, 221, 221, 221),
                      size: 20,
                    ),
                    onTap: () {
                      docTitleController.clear();
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
                  border: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(10.0),
                      ),
                  hintText: 'Document Title ',
                  hintStyle: TextStyle(fontSize: 12),
                ),
                controller: this.docTitleController,
              ),
              suggestionsCallback: DocumentController.getdocs,
              itemBuilder: (context, Document suggestion) {
                final user = suggestion;

                return ListTile(
                  title: Text(user.docTitle),
                );
              },
              noItemsFoundBuilder: (context) => Container(
                height: 50,
                child: Center(
                  child: Text(
                    'No Documents Found.',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              onSuggestionSelected: (Document? suggestion) {
                final doc = suggestion!;
                this.docTitleController.text = doc.docTitle;

                this.tokenNocontroller.text = doc.tokenNo.toString();

                this.partyNameController.text = doc.partyName;
                setState(() {
                  this.dID = doc.docId;
                });
              },
            ),
          ),

          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(14)
                  ],
                  style: TextStyle(fontSize: 12),
                  controller: tokenNocontroller,
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.05),
                      border: OutlineInputBorder(),
                      labelText: 'Token No',
                      hintText: 'Enter the token No'),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter Token No';
                  //   } else if (value.length < 14) {
                  //     return 'Please enter 14 digits number';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              SizedBox(
                width: 7,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.5,
                child: TypeAheadField<UserLogin>(
                  hideSuggestionsOnKeyboardHide: true,
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.05),

                      fillColor: Color.fromARGB(255, 233, 246, 252),
                      //  prefixIcon: Icon(Icons.search),
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.close,
                          color: Color.fromARGB(137, 221, 221, 221),
                          size: 20,
                        ),
                        onTap: () {
                          aptExecutiveController.clear();
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(10.0),
                          ),
                      hintText: 'Appointment Executive ',
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                    controller: this.aptExecutiveController,
                  ),
                  suggestionsCallback: (pattern) async {
                    return await LoginController.users();
                  },
                  itemBuilder: (context, UserLogin allUsers) {
                    final user = allUsers;

                    return ListTile(
                      title: Text(user.userName),
                    );
                  },
                  noItemsFoundBuilder: (context) => Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        'No Staff Found.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  onSuggestionSelected: (UserLogin? AllUsers) {
                    final user = AllUsers!;
                    this.aptExecutiveController.text = user.userName;
                    // String aptExecutive = aptExecutiveController.text;

                    setState(() {
                      this.staff_Id = user.userId;
                      // aptExecutive;
                    });
                  },
                ),
              ),
            ],
          ),

          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextFormField(
              //  autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: [
                LengthLimitingTextInputFormatter(50),
                FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
              ],
              style: TextStyle(fontSize: 12),
              //textCapitalization: TextCapitalization.characters,
              //inputFormatters: [LengthLimitingTextInputFormatter(50)],
              controller: partyNameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  errorStyle: const TextStyle(fontSize: 0.05),
                  border: OutlineInputBorder(),
                  labelText: 'Party Name',
                  hintText: 'Enter the party Name'),
              validator:
                  MultiValidator([RequiredValidator(errorText: 'Required*')]),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.4,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: "Party Type",
                    labelStyle: TextStyle(fontSize: 12),
                    errorStyle: const TextStyle(fontSize: 0.05),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 0.1)),
                  ),
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Please Enter party type')
                  ]),
                ),
              ),
              SizedBox(
                width: 7,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    //   FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10)
                  ],
                  style: TextStyle(fontSize: 12),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: contactNoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.05),
                      border: OutlineInputBorder(),
                      labelText: 'Contact No',
                      hintText: 'Enter the Contact No'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter contact No';
                    } else if (value.length < 10) {
                      return 'Please enter 10 digits number';
                    }
                    return null;
                  },
                  // ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                    FilteringTextInputFormatter.allow(
                        RegExp("[,-/: a-z A-Z á-ú Á-Ú 0-9]")),

                    //   FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: TextStyle(fontSize: 12),
                  //textCapitalization: TextCapitalization.words,
                  controller: aptplaceController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.05),
                      border: OutlineInputBorder(),
                      labelText: 'Appointment Place',
                      hintText: 'Enter the apt place'),
                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'Required*')]),
                ),
              ),
              SizedBox(
                width: 7,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                    FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9]")),
                  ],
                  style: TextStyle(fontSize: 12),
                  // textCapitalization: TextCapitalization.words,
                  controller: cityController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.05),
                      border: OutlineInputBorder(),
                      labelText: 'City',
                      hintText: 'Enter the City'),
                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'Required*')]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  // maxLength: 10,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[- 0-9]")),
                    LengthLimitingTextInputFormatter(10)
                  ],
                  style: TextStyle(fontSize: 12),

                  controller: aptDateController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.05),
                      prefixIcon: Icon(Icons.calendar_month),
                      border: OutlineInputBorder(),
                      labelText: 'Appointment Date',
                      hintText: 'yyyy-MM-dd'),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDateTime ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101),
                      // onConfirm:widget.onChanged,
                    ).then((pickedDate) {
                      if (pickedDate != null) {
                        // print(
                        //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);

                        print(formattedDate);

                        setState(() {
                          aptDateController.text = formattedDate;
                          selectedDateTime = pickedDate;

                          //set output date to TextField value.
                        });
                        print(aptDateController.text);
                      } else {
                        print("Date is not selected");
                      }
                    });

                    // final docs = await DocumentController.checkDate(stDate);

                    // setState(() => this.docs = docs);
                  },
                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'Required*')]),
                ),
              ),
              SizedBox(
                width: 7,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[: 0-9]")),
                  ],
                  style: TextStyle(fontSize: 12),
                  controller: aptTimeController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.05),
                      prefixIcon: Icon(Icons.timer),
                      border: OutlineInputBorder(),
                      labelText: 'Appointment Time',
                      hintText: 'HH:mm:ss'),
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );

                    if (pickedTime != null) {
                      print(pickedTime.format(context)); //output 10:51 PM
                      DateTime parsedTime = DateFormat.Hm()
                          .parse(pickedTime.format(context).toString());
                      //converting to DateTime so that we can further format on different pattern.
                      print(parsedTime); //output 1970-01-01 22:53:00.000
                      String formattedTime =
                          DateFormat('HH:mm:ss').format(parsedTime);
                      print(formattedTime); //output 14:59:00
                      //DateFormat() is from intl package, you can format the time on any pattern you need.

                      setState(() {
                        aptTimeController.text =
                            formattedTime; //set the value of text field.
                      });
                    } else {
                      print("Time is not selected");
                    }
                  },
                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'Required*')]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.4,
                // child: InputDecorator(
                //   decoration: InputDecoration(
                //     errorStyle: const TextStyle(fontSize: 0.05),

                //     //  fillColor: Colors.grey[10],
                //     border: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.black, width: 10)),
                //   ),
                // child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(fontSize: 0.05),
                    labelText: 'Payment Mode',
                    labelStyle: TextStyle(fontSize: 12),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 10)),
                  ),
                  items: paymentMode
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: selectedMode,
                  onChanged: (val) {
                    setState(() {
                      selectedMode = val as String;
                    });
                  },
                  // isExpanded: true,
                  // buttonHeight: 30,
                  // buttonWidth: 200,
                  // itemHeight: 40,
                  // dropdownWidth: 200,
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SizedBox(
              //       height: MediaQuery.of(context).size.height * 0.06,
              //       width: MediaQuery.of(context).size.width * 0.4,
              //       child: DropdownButtonFormField(
              //        // autovalidateMode: AutovalidateMode.onUserInteraction,

              //        // style: TextStyle(fontSize: 12),
              //         //textCapitalization: TextCapitalization.words,
              //       //  controller: paymentModeController,
              //       //  keyboardType: TextInputType.name,
              //         decoration: const InputDecoration(
              //             errorStyle: const TextStyle(fontSize: 0.05),
              //           labelText: 'Appointment Status',
              //           labelStyle: TextStyle(fontSize: 12),
              //           fillColor: Colors.white,
              //             errorStyle: const TextStyle(fontSize: 0.05),
              //             border: OutlineInputBorder(
              //                 borderSide: BorderSide(color: Colors.black, width: 10)),
              //             ),
              //             labelText: 'payment Mode',
              //             hintText: 'Enter the payment Mode'),
              //         // validator: MultiValidator(
              //         //     [RequiredValidator(errorText: 'Required*')]),
              //       ),
              //     ),
              SizedBox(
                width: 7,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.5,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(fontSize: 0.05),
                    labelText: 'Appointment Status',
                    labelStyle: TextStyle(fontSize: 12),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 10)),
                  ),
                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'Please select status')]),
                  items: item1
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedItem,
                  onChanged: (val) {
                    setState(() {
                      selectedItem = val as String;
                    });
                  },
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    //   FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(50)
                  ],
                  style: TextStyle(fontSize: 12),
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: totalFeesController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.05),
                      border: OutlineInputBorder(),
                      labelText: 'Fees',
                      hintText: 'Enter the Fees'),
                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'Required*')]),
                ),
              ),
              SizedBox(
                width: 7,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,

                    //   FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(50)
                  ],
                  style: TextStyle(fontSize: 12),
                  //  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: feesCollectedController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.05),
                      border: OutlineInputBorder(),
                      labelText: 'Fees Collected',
                      hintText: 'Enter the Fees Collected'),
                  // validator: MultiValidator(
                  //     [RequiredValidator(errorText: 'Required*')]),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 15,
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9]")),
                //   FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(100)
              ],
              style: TextStyle(fontSize: 12),
              // textCapitalization: TextCapitalization.characters,

              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: commentsController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  errorStyle: const TextStyle(fontSize: 0.05),
                  border: OutlineInputBorder(),
                  labelText: 'Comments',
                  hintText: 'Enter the Comments'),
              // validator: MultiValidator(
              //     [RequiredValidator(errorText: 'Please Enter comments')]),
              // ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(

              //alignment: Alignment.center,
              height: 35,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 3, 89, 168),
              ),
              child: ElevatedButton(
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Colors.transparent,
                //   shadowColor: Colors.transparent,
                //   // shape: RoundedRectangleBorder(borderRadius: borderRadius),
                // ),
                onPressed: () {
                  //  _formKey.currentState?.validate();
                  // final isValidForm = _formKey.currentState!.validate();
                  //  if (isValidForm) {
                  final aptId = apID;
                  print('apt id add $aptId');

                  final int docId = dID;

                  print('doc id add $dID');
                  final int staffId = staff_Id;
                  print('add staff id $staffId');

                  final String partyName = partyNameController.text;
                  final String partyType = selectedValue.toString();
                  final String aptStatus = selectedItem.toString();
                  final String paymentMode = selectedMode.toString();
                  //final String paymentMode = paymentModeController.text;
                  final String aptplace = aptplaceController.text;

                  final String city = cityController.text;

                  final String aptDate = aptDateController.text;

                  final String aptTime = aptTimeController.text;

                  int feesCollected;
                  //int.parse(feesCollectedController.text).toInt();
                  //FeesCollected;
                  // int.parse(feesCollectedController.text).toInt();
                  //if
                  //print('fees collected ${feesCollected}');

                  if (feesCollectedController.text.isNotEmpty) {
                    feesCollected =
                        int.parse(feesCollectedController.text).toInt();
                  } else {
                    feesCollected = 0;
                  }

                  final int totalFees =
                      int.parse(totalFeesController.text).toInt();

                  final String contactNo = contactNoController.text;

                  final String comments = commentsController.text;

                  setState(() {
                    _futureAppointment = createAppointment(
                      aptId,
                      docId,
                      staffId,

                      partyName,
                      contactNo,
                      partyType,
                      aptplace,
                      city,
                      feesCollected,
                      totalFees,
                      paymentMode,
                      aptDate,
                      aptTime,
                      // aptExecutive,
                      aptStatus,
                      comments,
                    );
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AppointmentPageFE()));
                  // }
                  // }
                },
                child: const Text("Save"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 3, 89, 168))),
              ))
        ],
      ),
    );
  }

  FutureBuilder<Appointment> buildFutureBuilder() {
    return FutureBuilder<Appointment>(
      future: _futureAppointment,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
