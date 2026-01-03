import 'dart:async';

import 'package:AtDocHUB/Controller/AppointmentController.dart';
import 'package:AtDocHUB/Model/Appointment.dart';
import 'package:AtDocHUB/View/Appointment/AppointmentDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentDetailsEditPage extends StatefulWidget {
  late final int aptId;
  late final int dID;
  late final int staff_Id;
  final String doctitle;
  final String docToken;
  final String aptExecutive;

  AppointmentDetailsEditPage(this.aptId, this.dID, this.staff_Id, this.doctitle,
      this.docToken, this.aptExecutive);

  @override
  _AppointmentDetailsEditPageState createState() =>
      _AppointmentDetailsEditPageState(this.aptId, this.dID, this.staff_Id,
          this.doctitle, this.docToken, this.aptExecutive);
}

class _AppointmentDetailsEditPageState
    extends State<AppointmentDetailsEditPage> {
  var paymentMode = ["Online", "Cash", "Cheque"];

  String? selectedMode;
  var items = [
    "Owner",
    "Tenant",
  ];
  String? selectedexecutive;
  var Executive = [
    "Satish",
    "Rohan",
  ];
  late final int dID;

  var status = ["Open", "Closed", "Cancel"];
  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 6.0);

  AppointmentController appointmentController =
      Get.put(AppointmentController());

  late Future<Appointment> futureAppointments;
  late final int aptId;
  List<Appointment> aptmnt = [];
  late final int dId;
  late final int staff_Id;
  final String doctitle;
  final String docToken;
  final String aptExecutive;

  _AppointmentDetailsEditPageState(this.aptId, this.dID, this.staff_Id,
      this.doctitle, this.docToken, this.aptExecutive);

  @override
  void initState() {
    super.initState();
    futureAppointments =
        AppointmentController.fetchAppointmentsById(this.aptId);
    // for (int i = 0; i <= aptmnt.length; i++) {
    //   this.dId = aptmnt[i].docId;
    //   if (this.aptId == aptmnt[i].aptId) {
    //     setState(() {
    //       final int DID = this.dId;
    //     });
    //   }
    // }
    init();
  }

  Future init() async {
    print('staff ID $staff_Id');
    print('doc ID $dID');
    print('apt ID $aptId');

    final aptmnt = await AppointmentController.fetchAppointments;
    setState(() {
      this.aptmnt = aptmnt as List<Appointment>;
    });
  }

  late TextEditingController aptIdController = new TextEditingController();
  late TextEditingController staffIdController = new TextEditingController();

  late TextEditingController docTitleController = new TextEditingController();
  late TextEditingController aptDateController = new TextEditingController();

  late TextEditingController aptPlaceController = new TextEditingController();
  late TextEditingController aptTimeController = new TextEditingController();
  late TextEditingController cityController = new TextEditingController();
  late TextEditingController commentsController = new TextEditingController();
  late TextEditingController docIdController = new TextEditingController();
  late TextEditingController feesCollectedController =
      new TextEditingController();
  late TextEditingController partyNameController = new TextEditingController();
  late TextEditingController paymentModeController =
      new TextEditingController();
  late TextEditingController totalFeesController = new TextEditingController();
  late TextEditingController partyTypeController = new TextEditingController();
  late TextEditingController tokenNoController = new TextEditingController();
  late TextEditingController aptExecutiveController =
      new TextEditingController();
  late TextEditingController aptStatusController = new TextEditingController();
  late TextEditingController contactNoController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 87, 156),
        title: Text('Edit Appointment'),
        // flexibleSpace: LogOut(),
        leading: IconButton(
            icon: BackButtonIcon(),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => AppointmentDetails(
                    aptId, dID, staff_Id, doctitle, docToken, aptExecutive)))),
      ),
      body:
          //SafeArea(
          Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: FutureBuilder<Appointment>(
                future: futureAppointments,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Form(
                        key: _formKey,
                        child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     SizedBox(
                                  //       width:
                                  //           MediaQuery.of(context).size.width *
                                  //               0.9,
                                  //       child: TextFormField(
                                  //         minLines: 1,
                                  //         readOnly: true,
                                  //         enabled: true,
                                  //         // autovalidateMode: AutovalidateMode
                                  //         //     .onUserInteraction,
                                  //         keyboardType: TextInputType.number,
                                  //         inputFormatters: [
                                  //           FilteringTextInputFormatter
                                  //               .digitsOnly,
                                  //           LengthLimitingTextInputFormatter(5)
                                  //         ],
                                  //         style: TextStyle(fontSize: 12),
                                  //         controller: aptIdController =
                                  //             TextEditingController(
                                  //                 text:
                                  //                     '${snapshot.data!.aptId}'),
                                  //         decoration: const InputDecoration(
                                  //           errorStyle:
                                  //               const TextStyle(fontSize: 0.05),
                                  //           border: OutlineInputBorder(),
                                  //           labelText: 'Appointment Id',
                                  //           hintText: 'Enter the aptId',
                                  //         ),
                                  //         validator: MultiValidator([
                                  //           RequiredValidator(
                                  //               errorText: 'Required*')
                                  //         ]),
                                  //       ),
                                  //     ),
                                  // SizedBox(
                                  //   width: 9,
                                  // ),
                                  // SizedBox(
                                  //   // height: 80.0,
                                  //   width:
                                  //       MediaQuery.of(context).size.width *
                                  //           0.4,
                                  //   child: TextFormField(
                                  //     minLines: 1,

                                  //     // autovalidateMode: AutovalidateMode
                                  //     //     .onUserInteraction,
                                  //     inputFormatters: [
                                  //       FilteringTextInputFormatter
                                  //           .digitsOnly,
                                  //       LengthLimitingTextInputFormatter(5)
                                  //     ],
                                  //     style: TextStyle(fontSize: 12),
                                  //     keyboardType: TextInputType.number,
                                  //     controller: staffIdController =
                                  //         TextEditingController(
                                  //             text:
                                  //                 '${snapshot.data!.staffId}'),
                                  //     decoration: const InputDecoration(
                                  //       errorStyle:
                                  //           const TextStyle(fontSize: 0.05),
                                  //       border: OutlineInputBorder(),
                                  //       labelText: 'Staff Id',
                                  //       hintText: 'Enter the staffId',
                                  //     ),
                                  //     validator: MultiValidator([
                                  //       RequiredValidator(
                                  //           errorText:
                                  //               'Please Enter staffId')
                                  //     ]),
                                  //   ),
                                  // ),

                                  // SizedBox(
                                  //   height: 12,
                                  // ),
                                  // SizedBox(
                                  //   height: 80.0,
                                  //   child: TextFormField(
                                  //     autovalidateMode:
                                  //         AutovalidateMode.onUserInteraction,
                                  //     keyboardType: TextInputType.number,
                                  //     inputFormatters: [
                                  //       FilteringTextInputFormatter.digitsOnly,
                                  //       LengthLimitingTextInputFormatter(5)
                                  //     ],
                                  //     controller: docIdController =
                                  //         TextEditingController(
                                  //             text: '${snapshot.data!.docId}'),
                                  //     decoration: const InputDecoration(
                                  //       border: OutlineInputBorder(),
                                  //       labelText: 'Document Id',
                                  //       hintText: 'Enter the docId',
                                  //     ),
                                  //     validator: MultiValidator([
                                  //       RequiredValidator(
                                  //           errorText: 'Please Enter docId')
                                  //     ]),
                                  //   ),
                                  // ),

                                  SizedBox(
                                    //height: 80.0,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: TextFormField(
                                      minLines: 1,
                                      maxLines: 3,
                                      // autovalidateMode:
                                      //     AutovalidateMode.onUserInteraction,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(100),
                                        FilteringTextInputFormatter.allow(
                                            RegExp(
                                                "[,-/ a-z A-Z á-ú Á-Ú 0-9]")),
                                      ],
                                      style: TextStyle(fontSize: 12),
                                      keyboardType: TextInputType.name,
                                      controller: docTitleController =
                                          TextEditingController(
                                              text:
                                                  '${snapshot.data!.aptPlace}'),
                                      decoration: const InputDecoration(
                                        errorStyle:
                                            const TextStyle(fontSize: 0.05),
                                        border: OutlineInputBorder(),
                                        labelText: 'Document Title',
                                        hintText: 'Document Title required',
                                      ),
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText: 'Required*')
                                      ]),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),

                                  SizedBox(
                                    // height: 80.0,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: TextFormField(
                                      minLines: 1,
                                      readOnly: true,
                                      // enabled: true,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(15)
                                      ],

                                      style: TextStyle(fontSize: 12),
                                      keyboardType: TextInputType.number,
                                      controller: tokenNoController =
                                          TextEditingController(
                                              text:
                                                  '${snapshot.data!.contactNo}'),

                                      decoration: const InputDecoration(
                                        errorStyle:
                                            const TextStyle(fontSize: 0.05),
                                        border: OutlineInputBorder(),
                                        labelText: 'Token No',
                                        hintText: 'Token No required',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter token No';
                                        } else if (value.length < 14) {
                                          return 'Please enter 14 digits number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        //height: 80.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: TextFormField(
                                          minLines: 1,
                                          maxLines: 3,
                                          // autovalidateMode: AutovalidateMode
                                          //     .onUserInteraction,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp("[a-z A-Z]")),
                                            LengthLimitingTextInputFormatter(50)
                                          ],
                                          style: TextStyle(fontSize: 12),

                                          keyboardType: TextInputType.name,
                                          controller: partyNameController =
                                              TextEditingController(
                                                  text:
                                                      '${snapshot.data!.partyName}'),
                                          //  text: snapshot.data!.partyName),
                                          decoration: const InputDecoration(
                                            errorStyle:
                                                const TextStyle(fontSize: 0.05),
                                            border: OutlineInputBorder(),
                                            labelText: 'Party Name',
                                            hintText: 'Party Name required',
                                          ),
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: 'Required*')
                                          ]),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      SizedBox(
                                        //  height: 80.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: TextFormField(
                                          minLines: 1,

                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp("[a-z A-Z]")),
                                            // LengthLimitingTextInputFormatter(
                                            //     100)
                                          ],

                                          // autovalidateMode: AutovalidateMode
                                          //     .onUserInteraction,
                                          style: TextStyle(fontSize: 12),
                                          keyboardType: TextInputType.name,
                                          controller: partyTypeController =
                                              TextEditingController(
                                                  text:
                                                      '${snapshot.data!.partyType}'),
                                          decoration: InputDecoration(
                                            errorStyle:
                                                const TextStyle(fontSize: 0.05),
                                            suffixIcon: PopupMenuButton<String>(
                                              // SizedBox(
                                              icon: Icon(Icons.arrow_drop_down),
                                              onSelected: (String value) {
                                                partyTypeController.text =
                                                    value;
                                              },
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return items
                                                    .map<PopupMenuItem<String>>(
                                                        (String value) {
                                                  return new PopupMenuItem(
                                                      height: 60,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 50,
                                                        vertical: 5,
                                                      ),
                                                      textStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14),
                                                      child: new Text(value),
                                                      value: value);
                                                }).toList();
                                              },
                                            ),
                                            border: OutlineInputBorder(),
                                            labelText: 'Party Type',
                                            // hintText: 'Enter the partyType',
                                          ),
                                          // validator: MultiValidator([
                                          //   RequiredValidator(
                                          //       errorText: 'Please Enter partyType')
                                          // ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        //   height: 80.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: TextFormField(
                                          minLines: 1,
                                          // maxLines: 2,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp("[a-z A-Z ]")),
                                            //  LengthLimitingTextInputFormatter(50)
                                          ],
                                          style: TextStyle(fontSize: 12),
                                          // autovalidateMode: AutovalidateMode
                                          //     .onUserInteraction,
                                          keyboardType: TextInputType.name,
                                          controller: aptExecutiveController =
                                              TextEditingController(
                                                  text:
                                                      '${snapshot.data!.city}'),
                                          decoration: InputDecoration(
                                            errorStyle:
                                                const TextStyle(fontSize: 0.05),
                                            // suffixIcon: PopupMenuButton<String>(
                                            //   // SizedBox(
                                            //   icon: Icon(Icons.arrow_drop_down),
                                            //   onSelected: (String value) {
                                            //     aptExecutiveController.text = value;
                                            //   },
                                            //   itemBuilder: (BuildContext context) {
                                            //     return Executive.map<
                                            //             PopupMenuItem<String>>(
                                            //         (String value) {
                                            //       return new PopupMenuItem(
                                            //           height: 60,
                                            //           padding: EdgeInsets.symmetric(
                                            //             horizontal: 50,
                                            //             vertical: 5,
                                            //           ),
                                            //           textStyle: TextStyle(
                                            //               color: Colors.black,
                                            //               fontSize: 14),
                                            //           child: new Text(value),
                                            //           value: value);
                                            //     }).toList();
                                            //   },
                                            // ),
                                            border: OutlineInputBorder(),
                                            labelText: ' Appointment Executive',
                                            hintText: 'Apt Executive required',
                                          ),
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: 'Required*')
                                          ]),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      SizedBox(
                                        //   height: 80.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: TextFormField(
                                          minLines: 1,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(10)
                                          ],
                                          style: TextStyle(fontSize: 12),
                                          // autovalidateMode: AutovalidateMode
                                          //     .onUserInteraction,
                                          keyboardType: TextInputType.number,
                                          controller: contactNoController =
                                              TextEditingController(
                                                  text:
                                                      '${snapshot.data!.contactNo}'),
                                          decoration: const InputDecoration(
                                            errorStyle:
                                                const TextStyle(fontSize: 0.05),
                                            border: OutlineInputBorder(),
                                            labelText: 'Contact No',
                                            hintText: 'Contact No required',
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter contact No';
                                            } else if (value.length < 10) {
                                              return 'Please enter 10 digits number';
                                            }
                                            return null;
                                          },
                                          // validator: (value) {
                                          //   if (value == null ||
                                          //       value.isEmpty) {
                                          //     return 'Please enter Token No';
                                          //   } else if (value.length < 10) {
                                          //     return 'Please enter 10 digits number';
                                          //   }
                                          //   return null;
                                          // },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),

                                  SizedBox(
                                    //height: 80.0,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,

                                    child: TextFormField(
                                      minLines: 1,
                                      maxLines: 2,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(
                                                "[,-/: a-z A-Z á-ú Á-Ú 0-9]")),
                                        LengthLimitingTextInputFormatter(100)
                                      ],
                                      // autovalidateMode:
                                      //     AutovalidateMode.onUserInteraction,
                                      style: TextStyle(fontSize: 12),
                                      keyboardType: TextInputType.name,
                                      controller: aptPlaceController =
                                          TextEditingController(
                                              text:
                                                  '${snapshot.data!.aptPlace}'),
                                      decoration: const InputDecoration(
                                        errorStyle:
                                            const TextStyle(fontSize: 0.05),
                                        border: OutlineInputBorder(),
                                        labelText: 'Appointment Place',
                                        hintText: 'Appointment place required',
                                      ),
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText: 'Required*')
                                      ]),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    // height: 80.0,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: TextFormField(
                                      minLines: 1,
                                      //  maxLines: 2,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[a-z A-Z 0-9]")),
                                        // LengthLimitingTextInputFormatter(50)
                                      ],
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      style: TextStyle(fontSize: 12),
                                      keyboardType: TextInputType.name,
                                      controller: cityController =
                                          TextEditingController(
                                              text: '${snapshot.data!.city}'),
                                      decoration: const InputDecoration(
                                        errorStyle:
                                            const TextStyle(fontSize: 0.05),
                                        border: OutlineInputBorder(),
                                        hintStyle: TextStyle(fontSize: 10),
                                        labelText: ' City',
                                        hintText: 'City required',
                                      ),
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText: 'Required*')
                                      ]),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        //  height: 80.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: TextFormField(
                                          minLines: 1,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp("[- 0-9]")),
                                            // FilteringTextInputFormatter.allow(" - [0-9]"),
                                            LengthLimitingTextInputFormatter(10)
                                          ],
                                          readOnly: false,
                                          style: TextStyle(fontSize: 12),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          keyboardType: TextInputType.datetime,
                                          controller: aptDateController =
                                              TextEditingController(
                                                  //     text: snapshot.data!.aptDate),
                                                  text:
                                                      '${snapshot.data!.aptDate}'),
                                          decoration: const InputDecoration(
                                            errorStyle:
                                                const TextStyle(fontSize: 0.05),
                                            prefixIcon:
                                                Icon(Icons.calendar_month),
                                            border: OutlineInputBorder(),
                                            labelText: 'Appointment Date',
                                            hintText: 'Apt date required',
                                          ),
                                          onTap: () async {
                                            await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1980),
                                              lastDate: DateTime(2101),
                                            ).then((selectedDate) {
                                              if (selectedDate != null) {
                                                aptDateController.text =
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(selectedDate);
                                              }
                                            });
                                          },
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: 'Required*')
                                          ]),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      SizedBox(
                                        // height: 80.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: TextFormField(
                                          minLines: 1,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp("[: 0-9]")),
                                            LengthLimitingTextInputFormatter(10)
                                          ],
                                          style: TextStyle(fontSize: 12),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          keyboardType: TextInputType.datetime,
                                          controller: aptTimeController =
                                              TextEditingController(
                                                  text:
                                                      '${snapshot.data!.aptTime}'),
                                          decoration: const InputDecoration(
                                            errorStyle:
                                                const TextStyle(fontSize: 0.05),
                                            prefixIcon: Icon(Icons.timer),
                                            border: OutlineInputBorder(),
                                            labelText: 'Appointment Time',
                                            hintText: 'Apt time required',
                                          ),
                                          onTap: () async {
                                            TimeOfDay? pickedTime =
                                                await showTimePicker(
                                              initialTime: TimeOfDay.now(),
                                              context: context,
                                            );

                                            if (pickedTime != null) {
                                              // print(pickedTime
                                              //     .format(context)); //output 10:51 PM
                                              DateTime parsedTime =
                                                  DateFormat.Hm().parse(
                                                      pickedTime
                                                          .format(context)
                                                          .toString());
                                              //     //converting to DateTime so that we can further format on different pattern.
                                              // print(
                                              //     parsedTime);
                                              //     };//output 1970-01-01 22:53:00.000
                                              String formattedTime =
                                                  DateFormat('HH:mm:ss')
                                                      .format(parsedTime);
                                              print(
                                                  formattedTime); //output 14:59:00
                                              //     //DateFormat() is from intl package, you can format the time on any pattern you need.

                                              //     setState(() {
                                              aptTimeController.text =
                                                  formattedTime; //set the value of text field.
                                              //     });
                                              //   } else {
                                              //     print("Time is not selected");
                                            }
                                          },
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: 'Required*')
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        // height: 80.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: TextFormField(
                                          minLines: 1,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp("[a-z A-Z ]")),
                                            //  LengthLimitingTextInputFormatter(50)
                                          ],
                                          style: TextStyle(fontSize: 12),
                                          // autovalidateMode: AutovalidateMode
                                          //     .onUserInteraction,
                                          keyboardType: TextInputType.name,
                                          controller: aptStatusController =
                                              TextEditingController(
                                                  text:
                                                      '${snapshot.data!.aptStatus}'),
                                          decoration: InputDecoration(
                                            errorStyle:
                                                const TextStyle(fontSize: 0.05),
                                            suffixIcon: PopupMenuButton<String>(
                                              // padding: EdgeInsets.symmetric(
                                              //   horizontal: 140.0,
                                              // ),
                                              // SizedBox(
                                              icon: Icon(Icons.arrow_drop_down),
                                              // padding: EdgeInsets.symmetric(
                                              //   horizontal: 100,
                                              // ),
                                              onSelected: (String value) {
                                                aptStatusController.text =
                                                    value;
                                              },
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return status
                                                    .map<PopupMenuItem<String>>(
                                                        (String value) {
                                                  return new PopupMenuItem(
                                                      child: new Container(
                                                        // height: 17,
                                                        // margin: EdgeInsets.symmetric(
                                                        //   horizontal: 200.0,
                                                        // ),
                                                        //  width: 100,
                                                        child: new Text(value),
                                                      ),

                                                      // height: 60,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 50,
                                                        vertical: 5,
                                                      ),
                                                      textStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14),
                                                      value: value);
                                                }).toList();
                                              },
                                            ),
                                            border: OutlineInputBorder(),
                                            labelText: 'Appointment Status',
                                            //       hintText: 'Enter aptStatus',
                                            // ]),
                                            //   border: OutlineInputBorder(),
                                          ),
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText:
                                                    'Please Enter aptstatus')
                                          ]),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      SizedBox(
                                        //height: 80.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: TextFormField(
                                          minLines: 1,
                                          // autovalidateMode:
                                          //     AutovalidateMode.onUserInteraction,
                                          // style: TextStyle(fontSize: 14),
                                          // keyboardType: TextInputType.name,
                                          // inputFormatters: [
                                          //   FilteringTextInputFormatter.allow(
                                          //       RegExp("[a-z A-Z ]")),
                                          //   LengthLimitingTextInputFormatter(50)
                                          // ],
                                          controller: paymentModeController =
                                              TextEditingController(
                                                  text:
                                                      '${snapshot.data!.paymentMode}'),
                                          decoration: InputDecoration(
                                            suffixIcon: PopupMenuButton<String>(
                                              // SizedBox(
                                              icon: Icon(Icons.arrow_drop_down),
                                              onSelected: (String value) {
                                                paymentModeController.text =
                                                    value;
                                              },
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return paymentMode
                                                    .map<PopupMenuItem<String>>(
                                                        (String value) {
                                                  return new PopupMenuItem(
                                                      child: new Container(
                                                        // height: 17,
                                                        // width: 50,
                                                        child: new Text(value),
                                                      ),

                                                      // height: 60,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 50,
                                                        vertical: 5,
                                                      ),
                                                      textStyle: TextStyle(
                                                          color: Colors.black,
                                                          // fontWeight: FontWeight.bold,
                                                          fontSize: 14),
                                                      value: value);
                                                }).toList();
                                              },
                                            ),
                                            border: OutlineInputBorder(),
                                            labelStyle: TextStyle(fontSize: 10),
                                            labelText: 'Payment Mode',
                                            //hintText: 'Enter PaymentMode',
                                          ),
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText:
                                                    'Please Enter Payment Mode')
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        //   height: 80.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: TextFormField(
                                          minLines: 1,
                                          // maxLines: 2,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(50)
                                          ],
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          style: TextStyle(fontSize: 12),
                                          keyboardType: TextInputType.number,
                                          controller: totalFeesController =
                                              TextEditingController(
                                                  text:
                                                      '${snapshot.data!.totalFees}'),
                                          decoration: const InputDecoration(
                                            errorStyle:
                                                const TextStyle(fontSize: 0.05),
                                            border: OutlineInputBorder(),
                                            labelText: 'Fees',
                                            hintText: 'Fees required',
                                          ),
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText:
                                                    'Please Enter totalFees')
                                          ]),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      SizedBox(
                                        //  height: 80.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: TextFormField(
                                          minLines: 1,
                                          //  maxLines: 2,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(50)
                                          ],
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          style: TextStyle(fontSize: 12),
                                          keyboardType: TextInputType.number,
                                          controller: feesCollectedController =
                                              TextEditingController(
                                                  text:
                                                      '${snapshot.data!.feesCollected}'),
                                          decoration: const InputDecoration(
                                            errorStyle:
                                                const TextStyle(fontSize: 0.05),
                                            border: OutlineInputBorder(),
                                            labelText: 'Fees Collected',
                                            hintText: 'Fees collected required',
                                          ),
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText:
                                                    'Please Enter fees Collected')
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 12,
                                  ),

                                  SizedBox(
                                    //  height: 80.0,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: TextFormField(
                                      minLines: 1,
                                      maxLines: 3,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[a-z A-Z ]")),
                                        LengthLimitingTextInputFormatter(200)
                                      ],
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      style: TextStyle(fontSize: 12),
                                      keyboardType: TextInputType.name,
                                      controller: commentsController =
                                          TextEditingController(
                                              text:
                                                  '${snapshot.data!.comments}'),
                                      decoration: const InputDecoration(
                                        errorStyle:
                                            const TextStyle(fontSize: 0.05),
                                        border: OutlineInputBorder(),
                                        labelText: 'Comments',
                                        hintText: 'Comments required',
                                      ),
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText: 'Please Enter comments')
                                      ]),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),

                                  // SizedBox(
                                  //   height: 10,
                                  //   //  width: 100,
                                  // ),

                                  Container(

                                      //alignment: Alignment.center,
                                      height: 35,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color.fromARGB(255, 3, 89, 168),
                                      ),
                                      //  height: 50.0,
                                      child: ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //   primary: Color.fromARGB(255, 3, 89, 168),
                                        //   minimumSize: const Size(200, 70),
                                        //   maximumSize: const Size(200, 50),
                                        // ),
                                        onPressed: () {
                                          // final isValidForm =
                                          //     _formKey.currentState!.validate();
                                          // if (isValidForm) {
                                          final int docId = this.dID;
                                          //     int.parse(docIdController.text)
                                          //         .toInt();
                                          //final int docId = dID;

                                          final int aptId = this.aptId;
                                          // int.parse(aptIdController.text)
                                          //     .toInt();
                                          final int staffId = staff_Id;
                                          // int.parse(staffIdController.text)
                                          //     .toInt();

                                          // final String docTitle =
                                          //     docTitleController.text;
                                          // final String tokenNo =
                                          //     tokenNoController.text;
                                          final String partyName =
                                              partyNameController.text;
                                          final String partyType =
                                              partyTypeController.text;
                                          final String city =
                                              cityController.text;
                                          final String aptPlace =
                                              aptPlaceController.text;
                                          final int feesCollected = int.parse(
                                                  feesCollectedController.text)
                                              .toInt();
                                          final int totalFees = int.parse(
                                                  totalFeesController.text)
                                              .toInt();

                                          final String aptDate =
                                              aptDateController.text;
                                          final String aptTime =
                                              aptTimeController.text;

                                          final String paymentMode =
                                              paymentModeController.text;

                                          // final String aptExecutive =
                                          //     aptExecutiveController.text;
                                          final String aptStatus =
                                              aptStatusController.text;
                                          final String contactNo =
                                              contactNoController.text;
                                          final String comments =
                                              commentsController.text;
                                          // if (Response != true) {
                                          //   Fluttertoast.showToast(
                                          //       msg: "Data Updated Sucessfully",
                                          //       toastLength: Toast.LENGTH_LONG,
                                          //       gravity: ToastGravity.CENTER,
                                          //       timeInSecForIosWeb: 1,
                                          //       backgroundColor: Color.fromARGB(
                                          //           255, 3, 87, 156),
                                          //       textColor: Colors.white,
                                          //       fontSize: 12.0);
                                          // } else {
                                          //   Fluttertoast.showToast(
                                          //       msg:
                                          //           "Data Not Updated Sucessfully",
                                          //       toastLength: Toast.LENGTH_LONG,
                                          //       gravity: ToastGravity.CENTER,
                                          //       timeInSecForIosWeb: 1,
                                          //       backgroundColor: Color.fromARGB(
                                          //           255, 3, 87, 156),
                                          //       textColor: Colors.white,
                                          //       fontSize: 12.0);
                                          // }
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          AppointmentDetails(
                                                              aptId,
                                                              dID,
                                                              staff_Id,
                                                              doctitle,
                                                              docToken,
                                                              aptExecutive)));

                                          setState(() {
                                            futureAppointments =
                                                createAppointment(
                                              aptId,
                                              docId,
                                              staffId,
//   docTitle,
                                              //  tokenNo,
                                              partyName,
                                              contactNo,
                                              partyType,
                                              aptPlace,
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
                                          // Container(
                                          //   // padding: const EdgeInsets.symmetric(
                                          //   //     vertical: 10.0, horizontal: 10.0),
                                          //   //alignment: Alignment.center,
                                          //   //padding: const EdgeInsets.all(10),
                                          //   // height: 35,
                                          //   margin: EdgeInsets.symmetric(
                                          //     horizontal: 200.0,
                                          //   ),

                                          //   decoration: BoxDecoration(
                                          //     borderRadius: BorderRadius.circular(10),
                                          //     color: Color.fromARGB(255, 3, 89, 168),
                                          //   ),
                                          // );
                                          // }
                                        },

                                        child: const Text(
                                          "Save",
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                                CircleBorder()),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 3, 89, 168))),

                                        // style: ButtonStyle(
                                        //     // shape: MaterialStateProperty.all<
                                        //     //         RoundedRectangleBorder>(
                                        //     //     RoundedRectangleBorder(
                                        //     //         borderRadius:
                                        //     //             BorderRadius.circular(10))),
                                        //     // fixedSize:
                                        //     //     MaterialStateProperty.all(Size(100, 50)),
                                        //     // shape: MaterialStateProperty.all(
                                        //     //     RoundedRectangleBorder(
                                        //     //         borderRadius:
                                        //     //             BorderRadius.circular(50))),
                                        //     // //),
                                        //     // padding: MaterialStateProperty.all(
                                        //     //     const EdgeInsets.all(25)),
                                        //     // textStyle: MaterialStateProperty.all(
                                        //     //     const TextStyle(fontSize: 15)),
                                        //     //),
                                        //     backgroundColor:
                                        //         MaterialStateProperty.all(
                                        //             Color.fromARGB(
                                        //                 255, 3, 89, 168))),
                                      )
                                      // )
                                      //)
                                      )
                                ])
                            //  ],
                            ),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  //}

                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
