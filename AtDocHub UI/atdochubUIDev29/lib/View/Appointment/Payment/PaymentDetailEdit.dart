import 'package:AtDocHUB/Controller/AppointmentController.dart';
import 'package:AtDocHUB/Controller/LoginController.dart';
import 'package:AtDocHUB/Model/Appointment.dart';
import 'package:AtDocHUB/Model/User.dart';
import 'package:AtDocHUB/View/AlwaysFocusDisableNode.dart';
//import 'package:AtDocHUB/View/Appointment/AppointmentsDetailsEditPage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:form_field_validator/form_field_validator.dart';

//import 'package:AtDocHUB/View/Payment/PaymentStatusDetailsPage.dart';
//import 'package:AtDocHUB/View/homePageAdmin.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'PaymentStatusDetails.dart';

class PaymentStatusDetailsEditPage extends StatefulWidget {
  final String userName;
  final int aptId;
  final int staff_Id;
  final int docID;

  final String dTitle;
  final int tNo;
  final String aptExecutive;
  String createdBY;

  PaymentStatusDetailsEditPage(
      this.userName,
      this.aptId,
      this.staff_Id,
      this.docID,
      this.dTitle,
      this.tNo,
      // this.doctitle,
      //  this.docToken,
      this.aptExecutive,
      this.createdBY);

  @override
  _PaymentStatusDetailsEditPageState createState() =>
      _PaymentStatusDetailsEditPageState(
          this.userName,
          this.aptId,
          this.staff_Id,
          this.docID,
          this.dTitle,
          this.tNo,
          this.aptExecutive,
          this.createdBY);
}

class _PaymentStatusDetailsEditPageState
    extends State<PaymentStatusDetailsEditPage> {
  var paymentMode = ["Online", "Cash", "Cheque"];

  String? selectedMode;
  var items = [
    "Owner",
    "Tenant",
  ];

  // late final int dID;

  var status = ["Open", "Closed", "Cancel"];
  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 6.0);

  AppointmentController appointmentController =
      Get.put(AppointmentController());

  late Future<Appointment> futureAppointments;
  final String userName;

  late final int aptId;
  late int staff_Id;
  late final int docID;

  late final String dTitle;
  late final int tNo;
  late final String aptExecutive;
  String createdBY;

  List<Appointment> aptmnt = [];

  _PaymentStatusDetailsEditPageState(this.userName, this.aptId, this.staff_Id,
      this.docID, this.dTitle, this.tNo, this.aptExecutive, this.createdBY);

  @override
  void initState() {
    super.initState();
    futureAppointments =
        AppointmentController.fetchAppointmentsById(this.aptId);

    init();
  }

  Future init() async {
    // print('staff ID $staff_Id');
    //  print('doc ID $dID');
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
        title: Text('Edit Payment Status'),
        // flexibleSpace: LogOut(),
        leading: IconButton(
            icon: BackButtonIcon(),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => PaymentStatusDetails(
                      this.userName,
                      aptId,
                      staff_Id,
                      docID,
                      dTitle,
                      tNo,
                      aptExecutive,
                    )))),
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
                                  SizedBox(
                                    //height: 80.0,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: TextFormField(
                                      minLines: 1,
                                      maxLines: 3,
                                      readOnly: true,
                                      enabled: true,
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
                                              text: '${this.dTitle}'),
                                      decoration: const InputDecoration(
                                        errorStyle:
                                            const TextStyle(fontSize: 0.05),
                                        border: OutlineInputBorder(),
                                        labelText: 'Document Title',
                                        hintText: 'Document Title required',
                                      ),
                                      // validator: MultiValidator([
                                      //   RequiredValidator(
                                      //       errorText: 'Required*')
                                      // ]),
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

                                      enabled: true,
                                      readOnly: true,
                                      // enabled: true,

                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(15)
                                      ],

                                      style: TextStyle(fontSize: 12),
                                      keyboardType: TextInputType.number,
                                      controller: tokenNoController =
                                          TextEditingController(
                                              text: '${this.tNo}'),

                                      decoration: const InputDecoration(
                                        errorStyle:
                                            const TextStyle(fontSize: 0.05),
                                        border: OutlineInputBorder(),
                                        labelText: 'Token No',
                                        hintText: 'Token No required',
                                      ),
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
                                          readOnly: true,
                                          enabled: true,
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
                                          focusNode: AlwaysDisabledFocusNode(),
                                          minLines: 1,
                                          readOnly: true,
                                          enabled: true,

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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: TextFormField(
                                          readOnly: true,
                                          enabled: true,
                                          style: TextStyle(fontSize: 12),
                                          // autovalidateMode:
                                          //     AutovalidateMode.onUserInteraction,
                                          keyboardType: TextInputType.name,
                                          controller: aptExecutiveController =
                                              TextEditingController(
                                                  //  text: snapshot.data!.aptExecutive),
                                                  text: '${this.aptExecutive}'),

                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: ' Appointment Executive',
                                            hintText:
                                                'appointment Executive required',
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
                                          readOnly: true,
                                          enabled: true,
                                          minLines: 1,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(10)
                                          ],
                                          style: TextStyle(fontSize: 12),
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
                                      readOnly: true,
                                      enabled: true,
                                      minLines: 1,
                                      maxLines: 2,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(
                                                "[,-/: a-z A-Z á-ú Á-Ú 0-9]")),
                                        LengthLimitingTextInputFormatter(100)
                                      ],
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
                                      readOnly: true,
                                      enabled: true,
                                      minLines: 1,
                                      //  maxLines: 2,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[a-z A-Z 0-9]")),
                                        // LengthLimitingTextInputFormatter(50)
                                      ],

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
                                          readOnly: true,
                                          enabled: true,
                                          minLines: 1,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp("[- 0-9]")),
                                            // FilteringTextInputFormatter.allow(" - [0-9]"),
                                            LengthLimitingTextInputFormatter(10)
                                          ],
                                          style: TextStyle(fontSize: 12),
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
                                          onTap: () async {},
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
                                          readOnly: true,
                                          enabled: true,
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
                                          onTap: () async {},
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
                                          readOnly: true,
                                          enabled: true,
                                          focusNode: AlwaysDisabledFocusNode(),
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
                                          focusNode: AlwaysDisabledFocusNode(),
                                          minLines: 1,
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
                                            hintText: 'Enter Payment Mode',
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
                                          // autovalidateMode: AutovalidateMode
                                          //     .onUserInteraction,
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
                                          // validator: MultiValidator([
                                          //   RequiredValidator(
                                          //       errorText:
                                          //           'Please Enter Fees')
                                          // ]),
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
                                          // autovalidateMode: AutovalidateMode
                                          //     .onUserInteraction,
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
                                          // validator: MultiValidator([
                                          //   RequiredValidator(
                                          //       errorText:
                                          //           'Please Enter fees Collected')
                                          // ]),
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
                                      // autovalidateMode:
                                      //     AutovalidateMode.onUserInteraction,
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
                                      // validator: MultiValidator([
                                      //   RequiredValidator(
                                      //       errorText: 'Please Enter comments')
                                      // ]),
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
                                          final int aptId = this.aptId;

                                          final int staffId = this.staff_Id;
                                          final int docId = this.docID;

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

                                          final String aptExe =
                                              aptExecutiveController.text;
                                          final String aptStatus =
                                              aptStatusController.text;
                                          final String contactNo =
                                              contactNoController.text;
                                          final String comments =
                                              commentsController.text;
                                          final createdBy = this.createdBY;

                                          print(
                                              'APT Details : ${this.createdBY}');
                                          final updatedBy = this.userName;

                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          PaymentStatusDetails(
                                                            this.userName,
                                                            aptId,
                                                            staffId,
                                                            docID,
                                                            dTitle,
                                                            tNo,
                                                            aptExe,
                                                          )));

                                          setState(() {
                                            futureAppointments =
                                                createAppointment(
                                                    aptId,
                                                    staffId,
                                                    docId,
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
                                                    createdBy,
                                                    updatedBy);
                                          });
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


// class PaymentDetailEditPage extends StatefulWidget {
//   final String userName;
//   final int aptId;
//   final int docID;
//   final int staffId;
//   final String dTitle;
//   final int tNo;
//   final String aptExecutive;
//   String createdBY;
//   // final int aptId;
//   // final String dTitle;
//   // final String tNo;
//   // final String userName;
//   // final String aptExecutive;
//   // String createdBY;

//   PaymentDetailEditPage(  this.userName,
//       this.aptId,
//       this.docID,
//       this.staffId,
//       this.dTitle,
//       this.tNo,
//       // this.doctitle,
//       //  this.docToken,
//       this.aptExecutive,
//       this.createdBY);
//   @override
//   _State createState() =>
//       _State(  this.userName,
//       this.aptId,
//       this.docID,
//       this.staffId,
//       this.dTitle,
//       this.tNo,
//       // this.doctitle,
//       //  this.docToken,
//       this.aptExecutive,
//       this.createdBY);
// }

// class _State extends State<PaymentDetailEditPage> {
//   var Mode = ["Online", "Cash", "Cheque", "Other"];
//   var status = ["Open", "Closed", "Pending", "Cancel"];

//   late TextEditingController aptIdController = TextEditingController();
//   late TextEditingController staffIdController = TextEditingController();

//   late TextEditingController docTitleController = TextEditingController();
//   late TextEditingController aptDateController = TextEditingController();

//   late TextEditingController aptPlaceController = TextEditingController();
//   late TextEditingController aptTimeController = TextEditingController();
//   late TextEditingController cityController = TextEditingController();
//   late TextEditingController commentsController = TextEditingController();
//   late TextEditingController docIdController = TextEditingController();
//   late TextEditingController feesCollectedController = TextEditingController();
//   late TextEditingController partyNameController = TextEditingController();
//   late TextEditingController paymentModeController = TextEditingController();
//   late TextEditingController totalFeesController = TextEditingController();
//   late TextEditingController partyTypeController = TextEditingController();
//   late TextEditingController tokenNoController = TextEditingController();
//   late TextEditingController aptExecutiveController = TextEditingController();
//   late TextEditingController aptStatusController = TextEditingController();
//   late TextEditingController contactNoController = TextEditingController();
//   final String userName;
//   String createdBY;
//   late final int aptId;
//   late final int docID;
//   late final int staffId;

//   late final String dTitle;
//   late final int tNo;
//   late final String aptExecutive;

// //  final String userName;
// //   final int aptId;
// //   final int docID;
// //   final int staffId;
// //   final String dTitle;
// //   final int tNo;
// //   final String aptExecutive;
 
//   _State(  this.userName,
//       this.aptId,
//       this.docID,
//       this.staffId,
//       this.dTitle,
//       this.tNo,
//       // this.doctitle,
//       //  this.docToken,
//       this.aptExecutive,
//       this.createdBY);

//   final _formKey = GlobalKey<FormState>();

//   AppointmentController appointmentcontroller =
//       Get.put(AppointmentController());

//   late Future<Appointment> futureAppointments;

//   @override
//   void initState() {
//     super.initState();
//     futureAppointments = AppointmentController.fetchAppointmentsById(this.aptId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Color.fromARGB(255, 3, 87, 156),
//       //   title: Text('Home Page'),
//       //   //flexibleSpace: LogOut(),
//       // ),
//       appBar: AppBar(
//         title: const AutoSizeText('Edit Payment Details'),
//         backgroundColor: Color.fromARGB(255, 3, 87, 156),
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//             icon: BackButtonIcon(),
//             onPressed: () => Navigator.of(context).push(MaterialPageRoute(
//                 builder: (BuildContext context) => PaymentStatusDetailsPage(
//                   this.userName,
//                       aptId,
//                       staffId,
//                       docID,
//                       dTitle,
//                       tNo,
//                       aptExecutive,)))),
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: FutureBuilder<Appointment>(
//             future: futureAppointments,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 if (snapshot.hasData) {
//                   return Center(
//                     child: SelectionArea(
//                       child: Form(
//                           key: _formKey,
//                           child: Padding(
//                             padding: const EdgeInsets.all(12),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: <Widget>[
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 // Row(
//                                 //   mainAxisAlignment: MainAxisAlignment.end,
//                                 //   children: [
//                                 //     SizedBox(
//                                 //       // height:
//                                 //       //     MediaQuery.of(context).size.height *
//                                 //       //         0.06,
//                                 //       width: MediaQuery.of(context).size.width *
//                                 //           0.4,
//                                 //       child: TextFormField(
//                                 //         minLines: 1,
//                                 //         readOnly: true,
//                                 //         enabled: true,
//                                 //         style: TextStyle(fontSize: 12),

//                                 //         keyboardType: TextInputType.number,
//                                 //         controller: aptIdController =
//                                 //             TextEditingController(
//                                 //                 text:
//                                 //                     '${snapshot.data!.aptId}'),
//                                 //         //  text: snapshot.data!.aptId.toString()),
//                                 //         decoration: const InputDecoration(
//                                 //           border: OutlineInputBorder(),
//                                 //           labelText: 'Appointment Id',
//                                 //           hintText: 'Enter the Appointment Id',
//                                 //         ),
//                                 //         //  validator: MultiValidator([
//                                 //         //    RequiredValidator(errorText: 'Required*')
//                                 //         //  ]),
//                                 //       ),
//                                 //     ),
//                                 //     SizedBox(
//                                 //       width: 7,
//                                 //     ),
//                                 //     SizedBox(
//                                 //         // height:
//                                 //         //     MediaQuery.of(context).size.height *
//                                 //         //         0.06,
//                                 //         width:
//                                 //             MediaQuery.of(context).size.width *
//                                 //                 0.5,
//                                 //         child: TextFormField(
//                                 //           minLines: 1,
//                                 //           readOnly: true,
//                                 //           enabled: true,
//                                 //           // autovalidateMode:
//                                 //           //     AutovalidateMode.onUserInteraction,

//                                 //           style: TextStyle(fontSize: 12),
//                                 //           keyboardType: TextInputType.number,
//                                 //           controller: staffIdController =
//                                 //               TextEditingController(
//                                 //                   //text:
//                                 //                   text:
//                                 //                       '${snapshot.data!.staffId}'),
//                                 //           // text: snapshot.data!.staffId
//                                 //           //   .toString()), //,
//                                 //           decoration: const InputDecoration(
//                                 //             border: OutlineInputBorder(),
//                                 //             labelText: 'Staff Id',
//                                 //             hintText: 'Enter the staff id',
//                                 //           ),
//                                 //           // validator: MultiValidator([
//                                 //           //    RequiredValidator(errorText: 'Required*')
//                                 //           // ]),
//                                 //         )),
//                                 //   ],
//                                 // ),
//                                 // SizedBox(
//                                 //   height: 12,
//                                 // ),
//                                 SizedBox(
//                                   // height:
//                                   //     MediaQuery.of(context).size.height * 0.06,
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.9,
//                                   child: TextFormField(
//                                     readOnly: true,
//                                     minLines: 1,
//                                     maxLines: 4,
//                                     inputFormatters: [
//                                       FilteringTextInputFormatter.allow(
//                                           RegExp("[a-z A-Z ]")),
//                                       // LengthLimitingTextInputFormatter(100)
//                                     ],

//                                     // autovalidateMode:
//                                     //     AutovalidateMode.onUserInteraction,
//                                     //  readOnly: true,
//                                     //  enabled: false,
//                                     style: TextStyle(fontSize: 12),
//                                     keyboardType: TextInputType.name,
//                                     controller: docTitleController =
//                                         TextEditingController(
//                                             text: '${this.dTitle}'),
//                                     // text: snapshot.data!.docTitle), //,
//                                     decoration: const InputDecoration(
//                                       border: OutlineInputBorder(),
//                                       labelText: 'Document Title',
//                                       hintText: 'Enter the document title',
//                                     ),
//                                     validator: MultiValidator([
//                                       RequiredValidator(errorText: 'Required*')
//                                     ]),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 12,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     SizedBox(
//                                       // height:
//                                       //     MediaQuery.of(context).size.height *
//                                       //         0.06,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.4,
//                                       child: TextFormField(
//                                         // autovalidateMode:
//                                         //     AutovalidateMode.onUserInteraction,
//                                         readOnly: true,
//                                         enabled: true,
//                                         style: TextStyle(fontSize: 12),
//                                         keyboardType: TextInputType.number,
//                                         controller: tokenNoController =
//                                             TextEditingController(
//                                                 text: '${this.tNo}'),
//                                         // text: snapshot.data!.tokenNo),
//                                         decoration: const InputDecoration(
//                                           border: OutlineInputBorder(),
//                                           labelText: 'Token No',
//                                           hintText: 'Enter the token no',
//                                         ),
//                                         // validator: MultiValidator([
//                                         //   RequiredValidator(
//                                         //       errorText: 'Required*')
//                                         // ]),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     SizedBox(
//                                       // height:
//                                       //     MediaQuery.of(context).size.height *
//                                       //         0.06,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.5,
//                                       child: TextFormField(
//                                         cursorHeight: 15,

//                                         readOnly: true,
//                                         enabled: true,
//                                         style: TextStyle(fontSize: 12),
//                                         // autovalidateMode:
//                                         //     AutovalidateMode.onUserInteraction,
//                                         keyboardType: TextInputType.number,
//                                         controller: contactNoController =
//                                             TextEditingController(
//                                                 //    text: snapshot.data!.contactNo),
//                                                 text:
//                                                     '${snapshot.data!.contactNo}'),
//                                         decoration: const InputDecoration(
//                                           errorStyle:
//                                               const TextStyle(fontSize: 0.05),
//                                           border: OutlineInputBorder(),
//                                           labelText: 'Contact No',
//                                           hintText: 'Enter the contact no',
//                                         ),
//                                         validator: (value) {
//                                           if (value == null || value.isEmpty) {
//                                             return 'Please enter contact no';
//                                           } else if (value.length < 6) {
//                                             return 'Please enter 10 digits number';
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 12,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     SizedBox(
//                                       // height:
//                                       //     MediaQuery.of(context).size.height *
//                                       //         0.06,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.4,
//                                       child: TextFormField(
//                                         readOnly: true,
//                                         inputFormatters: [
//                                           FilteringTextInputFormatter.allow(
//                                               RegExp("[a-z A-Z ]")),
//                                           LengthLimitingTextInputFormatter(100)
//                                         ],

//                                         style: TextStyle(fontSize: 12),

//                                         // autovalidateMode:
//                                         //     AutovalidateMode.onUserInteraction,
//                                         keyboardType: TextInputType.name,
//                                         controller: partyNameController =
//                                             TextEditingController(
//                                                 text:
//                                                     '${snapshot.data!.partyName}'),
//                                         //  text: snapshot.data!.partyName),
//                                         decoration: const InputDecoration(
//                                           errorStyle:
//                                               const TextStyle(fontSize: 0.05),
//                                           border: OutlineInputBorder(),
//                                           labelText: 'Party Name',
//                                           hintText: 'Enter the party name',
//                                         ),
//                                         validator: MultiValidator([
//                                           RequiredValidator(
//                                               errorText: 'Required*')
//                                         ]),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 7,
//                                     ),
//                                     SizedBox(
//                                       // height:
//                                       //     MediaQuery.of(context).size.height *
//                                       //         0.06,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.5,
//                                       child: TextFormField(
//                                         readOnly: true,
//                                         enabled: true,
//                                         //  autovalidateMode:
//                                         //    AutovalidateMode.onUserInteraction,
//                                         style: TextStyle(fontSize: 12),
//                                         keyboardType: TextInputType.name,
//                                         controller: partyTypeController =
//                                             TextEditingController(
//                                                 text:
//                                                     '${snapshot.data!.partyType}'),
//                                         // text: snapshot.data!.partyType),
//                                         decoration: const InputDecoration(
//                                           border: OutlineInputBorder(),
//                                           labelText: 'Party Type',
//                                           hintText: 'Enter the party type',
//                                         ),
//                                         validator: MultiValidator([
//                                           RequiredValidator(
//                                               errorText: 'Required*')
//                                         ]),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 12,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     SizedBox(
//                                       // height:
//                                       //     MediaQuery.of(context).size.height *
//                                       //         0.06,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.4,
//                                       child: TextFormField(
//                                         readOnly: true,
//                                         enabled: true,
//                                         style: TextStyle(fontSize: 12),
//                                         // autovalidateMode:
//                                         //    AutovalidateMode.onUserInteraction,
//                                         keyboardType: TextInputType.name,
//                                         controller: aptStatusController =
//                                             TextEditingController(
//                                                 //  text: snapshot.data!.aptStatus),
//                                                 text:
//                                                     '${snapshot.data!.aptStatus}'),
//                                         decoration: InputDecoration(
//                                           border: OutlineInputBorder(),
//                                           labelText: 'Appointment Status',
//                                           hintText:
//                                               'appointment Status required',
//                                         ),

//                                         validator: MultiValidator([
//                                           RequiredValidator(
//                                               errorText: 'Required*')
//                                         ]),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 7,
//                                     ),
//                                     SizedBox(
//                                       // height:
//                                       //     MediaQuery.of(context).size.height *
//                                       //         0.06,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.5,
//                                       child: TextFormField(
//                                         readOnly: true,
//                                         enabled: true,
//                                         style: TextStyle(fontSize: 12),
//                                         // autovalidateMode:
//                                         //     AutovalidateMode.onUserInteraction,
//                                         keyboardType: TextInputType.name,
//                                         controller: aptExecutiveController =
//                                             TextEditingController(
//                                                 //  text: snapshot.data!.aptExecutive),
//                                                 text: '${this.userName}'),

//                                         decoration: const InputDecoration(
//                                           border: OutlineInputBorder(),
//                                           labelText: ' Appointment Executive',
//                                           hintText:
//                                               'appointment Executive required',
//                                         ),
//                                         validator: MultiValidator([
//                                           RequiredValidator(
//                                               errorText: 'Required*')
//                                         ]),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 12,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     SizedBox(
//                                       // height:
//                                       //     MediaQuery.of(context).size.height *
//                                       //         0.06,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.4,
//                                       child: TextFormField(
//                                         readOnly: true,
//                                         enabled: true,
//                                         // autovalidateMode:
//                                         //  AutovalidateMode.onUserInteraction,
//                                         style: TextStyle(fontSize: 12),
//                                         keyboardType: TextInputType.name,
//                                         controller: aptPlaceController =
//                                             TextEditingController(
//                                                 text:
//                                                     '${snapshot.data!.aptPlace}'),
//                                         // text: snapshot.data!.aptPlace),
//                                         decoration: const InputDecoration(
//                                           border: OutlineInputBorder(),
//                                           labelText: ' Appointment Place',
//                                           hintText:
//                                               'appointment place required',
//                                         ),
//                                         validator: MultiValidator([
//                                           RequiredValidator(
//                                               errorText: 'Required*')
//                                         ]),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 7,
//                                     ),
//                                     SizedBox(
//                                       // height:
//                                       //     MediaQuery.of(context).size.height *
//                                       //         0.06,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.5,
//                                       child: TextFormField(
//                                         readOnly: true,
//                                         enabled: true,
//                                         // autovalidateMode:
//                                         //     AutovalidateMode.onUserInteraction,
//                                         style: TextStyle(fontSize: 12),
//                                         keyboardType: TextInputType.name,
//                                         controller: cityController =
//                                             TextEditingController(
//                                                 text: '${snapshot.data!.city}'),
//                                         // text: snapshot.data!.city),
//                                         decoration: const InputDecoration(
//                                           border: OutlineInputBorder(),
//                                           labelText: ' City',
//                                         ),
//                                         validator: MultiValidator([
//                                           RequiredValidator(
//                                               errorText: 'Required*')
//                                         ]),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 12,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     SizedBox(
//                                       // height:
//                                       //     MediaQuery.of(context).size.height *
//                                       //         0.06,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.4,
//                                       child: TextFormField(
//                                         readOnly: true,
//                                         enabled: true,
//                                         style: TextStyle(fontSize: 12),
//                                         // autovalidateMode:
//                                         //    AutovalidateMode.onUserInteraction,
//                                         keyboardType: TextInputType.datetime,
//                                         controller: aptDateController =
//                                             TextEditingController(
//                                                 //     text: snapshot.data!.aptDate),
//                                                 text:
//                                                     '${snapshot.data!.aptDate}'),
//                                         decoration: const InputDecoration(
//                                           // prefixIcon: Icon(Icons.calendar_month),
//                                           border: OutlineInputBorder(),
//                                           labelText: 'Appointment Date',
//                                           hintText: 'Appointment Date required',
//                                         ),

//                                         //  validator: MultiValidator([
//                                         //    RequiredValidator(errorText: 'Required*')
//                                         //  ]),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 7,
//                                     ),
//                                     SizedBox(
//                                       // height:
//                                       //     MediaQuery.of(context).size.height *
//                                       //         0.06,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.5,
//                                       child: TextFormField(
//                                         readOnly: true,
//                                         enabled: true,
//                                         style: TextStyle(fontSize: 12),
//                                         // autovalidateMode:
//                                         //     AutovalidateMode.onUserInteraction,
//                                         keyboardType: TextInputType.datetime,
//                                         controller: aptTimeController =
//                                             TextEditingController(
//                                                 text:
//                                                     '${snapshot.data!.aptTime}'),
//                                         decoration: const InputDecoration(
//                                           border: OutlineInputBorder(),
//                                           labelText: 'Appointment Time',
//                                           hintText: 'Appointment Time required',
//                                         ),
//                                         validator: MultiValidator([
//                                           RequiredValidator(
//                                               errorText: 'Required*')
//                                         ]),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 12,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     SizedBox(
//                                       // height:
//                                       //     MediaQuery.of(context).size.height *
//                                       //         0.06,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.4,
//                                       child: TextFormField(
//                                         cursorHeight: 15,

//                                         inputFormatters: [
//                                           FilteringTextInputFormatter
//                                               .digitsOnly,
//                                           LengthLimitingTextInputFormatter(50)
//                                         ],
//                                         // autovalidateMode:
//                                         //     AutovalidateMode.onUserInteraction,
//                                         style: TextStyle(fontSize: 12),
//                                         keyboardType: TextInputType.number,
//                                         controller: totalFeesController =
//                                             TextEditingController(
//                                                 //  text: snapshot.data!.totalFees
//                                                 //  .toString()),
//                                                 text:
//                                                     '${snapshot.data!.totalFees}'),
//                                         decoration: const InputDecoration(
//                                           errorStyle:
//                                               const TextStyle(fontSize: 0.05),
//                                           border: OutlineInputBorder(),
//                                           labelText: 'Fees',
//                                           hintText: 'fees required',
//                                         ),
//                                         validator: MultiValidator([
//                                           RequiredValidator(
//                                               errorText: 'Required*')
//                                         ]),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 7,
//                                     ),
//                                     SizedBox(
//                                       // height:
//                                       //     MediaQuery.of(context).size.height *
//                                       //         0.06,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.5,
//                                       child: TextFormField(
//                                         cursorHeight: 15,

//                                         inputFormatters: [
//                                           FilteringTextInputFormatter
//                                               .digitsOnly,
//                                           LengthLimitingTextInputFormatter(50)
//                                         ],
//                                         // autovalidateMode:
//                                         //     AutovalidateMode.onUserInteraction,
//                                         style: TextStyle(fontSize: 12),
//                                         keyboardType: TextInputType.number,
//                                         controller: feesCollectedController =
//                                             TextEditingController(
//                                                 // text: snapshot.data!.feesCollected
//                                                 //  .toString()),
//                                                 text:
//                                                     '${snapshot.data!.feesCollected}'),
//                                         decoration: const InputDecoration(
//                                           errorStyle:
//                                               const TextStyle(fontSize: 0.05),
//                                           border: OutlineInputBorder(),
//                                           labelText: 'Fees Collected',
//                                           hintText: 'fees Collected required',
//                                         ),
//                                         validator: MultiValidator([
//                                           RequiredValidator(
//                                               errorText: 'Required*')
//                                         ]),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 12,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     SizedBox(
//                                       // height:
//                                       //     MediaQuery.of(context).size.height *
//                                       //         0.06,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.4,
//                                       child: TextFormField(
//                                         focusNode: AlwaysDisabledFocusNode(),
//                                         inputFormatters: [
//                                           FilteringTextInputFormatter.allow(
//                                               RegExp("[a-z A-Z ]")),
//                                           LengthLimitingTextInputFormatter(50)
//                                         ],
//                                         autovalidateMode:
//                                             AutovalidateMode.onUserInteraction,
//                                         style: TextStyle(fontSize: 12),
//                                         keyboardType: TextInputType.name,
//                                         controller: paymentModeController =
//                                             TextEditingController(
//                                                 //   text: snapshot.data!.paymentMode),
//                                                 text:
//                                                     '${snapshot.data!.paymentMode}'),
//                                         decoration: InputDecoration(
//                                           errorStyle:
//                                               const TextStyle(fontSize: 0.05),
//                                           suffixIcon: PopupMenuButton<String>(
//                                             // SizedBox(
//                                             icon: Icon(Icons.arrow_drop_down),
//                                             onSelected: (String value) {
//                                               paymentModeController.text =
//                                                   value;
//                                             },
//                                             itemBuilder:
//                                                 (BuildContext context) {
//                                               return Mode.map<
//                                                       PopupMenuItem<String>>(
//                                                   (String value) {
//                                                 return new PopupMenuItem(
//                                                     child: new Container(
//                                                       // height: 17,
//                                                       // width: 100,
//                                                       child: new Text(value),
//                                                     ),

//                                                     // height: 60,
//                                                     padding:
//                                                         EdgeInsets.symmetric(
//                                                       horizontal: 50,
//                                                       vertical: 5,
//                                                     ),
//                                                     textStyle: TextStyle(
//                                                         color: Colors.black,
//                                                         fontSize: 14),
//                                                     value: value);
//                                               }).toList();
//                                             },
//                                           ),
//                                           border: OutlineInputBorder(),
//                                           labelText: 'Payment Mode',
//                                           hintText: 'Payment Mode required',
//                                         ),
//                                         validator: MultiValidator([
//                                           RequiredValidator(
//                                               errorText: 'Required*')
//                                         ]),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 7,
//                                     ),
//                                     SizedBox(
//                                       // height:
//                                       //     MediaQuery.of(context).size.height *
//                                       //         0.06,
//                                       width: MediaQuery.of(context).size.width *
//                                           0.5,
//                                       child: TextFormField(
//                                         minLines: 1,
//                                         maxLines: 4,
//                                         cursorHeight: 15,
//                                         //cursorWidth: 8,
//                                         //readOnly: true,
//                                         enabled: true,
//                                         //autovalidateMode:
//                                         //   AutovalidateMode.onUserInteraction,
//                                         style: TextStyle(fontSize: 12),
//                                         keyboardType: TextInputType.name,
//                                         controller: commentsController =
//                                             TextEditingController(
//                                                 text:
//                                                     '${snapshot.data!.comments}'),
//                                         // text: snapshot.data!.comments,
//                                         //),
//                                         decoration: const InputDecoration(
//                                           errorStyle:
//                                               const TextStyle(fontSize: 0.05),
//                                           border: OutlineInputBorder(),
//                                           labelText: 'Comments',
//                                           hintText: 'comments required',
//                                         ),
//                                         // validator: MultiValidator([
//                                         //   RequiredValidator(
//                                         //       errorText: 'Required*')
//                                         // ]),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 12,
//                                 ),
//                                 Container(

//                                     //alignment: Alignment.center,
//                                     height: 35,
//                                     width: 200,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: Color.fromARGB(255, 3, 89, 168),
//                                     ),

//                                     //),
//                                     child: ElevatedButton(
//                                       onPressed: () {
//                                         // final isValidForm =
//                                         //    _formKey.currentState!.validate();
//                                         // if (isValidForm) {
//                                         //  _formKey.currentState?.validate();

//                                         final int aptId =
//                                             int.parse(aptIdController.text)
//                                                 .toInt();
//                                         final int staffId =
//                                             int.parse(staffIdController.text)
//                                                 .toInt();

//                                         final String docTitle =
//                                             docTitleController.text;
//                                         final String tokenNo =
//                                             tokenNoController.text;
//                                         final String partyName =
//                                             partyNameController.text;
//                                         final String partyType =
//                                             partyTypeController.text;
//                                         final String city = cityController.text;
//                                         final String aptPlace =
//                                             aptPlaceController.text;
//                                         final int feesCollected = int.parse(
//                                                 feesCollectedController.text)
//                                             .toInt();
//                                         final int totalFees =
//                                             int.parse(totalFeesController.text)
//                                                 .toInt();

//                                         final String aptDate =
//                                             aptDateController.text;
//                                         final String aptTime =
//                                             aptTimeController.text;

//                                         final String paymentMode =
//                                             paymentModeController.text;

//                                         final String aptExecutive =
//                                             aptExecutiveController.text;
//                                         final String aptStatus =
//                                             aptStatusController.text;
//                                         final String contactNo =
//                                             contactNoController.text;
//                                         final String? comments =
//                                             commentsController.text;
//                                         // if (Response != true) {
//                                         //   Fluttertoast.showToast(
//                                         //       msg: "Data Updated Sucessfully",
//                                         //       toastLength: Toast.LENGTH_LONG,
//                                         //       gravity: ToastGravity.CENTER,
//                                         //       timeInSecForIosWeb: 1,
//                                         //       backgroundColor: Color.fromARGB(
//                                         //           255, 3, 87, 156),
//                                         //       textColor: Colors.white,
//                                         //       fontSize: 12.0);
//                                         // } else {
//                                         //   Fluttertoast.showToast(
//                                         //       msg:
//                                         //           "Data Not Updated Sucessfully",
//                                         //       toastLength: Toast.LENGTH_LONG,
//                                         //       gravity: ToastGravity.CENTER,
//                                         //       timeInSecForIosWeb: 1,
//                                         //       backgroundColor: Color.fromARGB(
//                                         //           255, 3, 87, 156),
//                                         //       textColor: Colors.white,
//                                         //       fontSize: 12.0);
//                                         // }
//                                         Navigator.of(context).push(
//                                             MaterialPageRoute(
//                                                 builder: (BuildContext
//                                                         context) =>
//                                                     PaymentStatusDetailsPage(
//                                                         aptId,
//                                                         docTitle,
//                                                         tNo,
//                                                         this.userName)));

//                                         setState(() {
//                                           futureAppointments =
//                                               updateAppointment(
//                                             // docId,
//                                             aptId,
//                                             staffId,
//                                             docTitle,
//                                             tokenNo,
//                                             partyName,
//                                             contactNo,
//                                             partyType,
//                                             aptDate,
//                                             aptTime,
//                                             aptPlace,
//                                             city,
//                                             feesCollected,
//                                             totalFees,
//                                             paymentMode,
//                                             aptExecutive,
//                                             aptStatus,
//                                             comments!,
//                                           );
//                                         });
//                                         // }
//                                         // }
//                                       },

//                                       child: const Text("Save"),
//                                       style: ButtonStyle(
//                                           backgroundColor:
//                                               MaterialStateProperty.all(
//                                                   Color.fromARGB(
//                                                       255, 3, 89, 168))),

//                                       // )
//                                     ))
//                               ],
//                             ),
//                           )),
//                     ),
//                   );
//                 }
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }
//               //}

//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
