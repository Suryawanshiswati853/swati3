import 'package:AtDocHUB/Controller/AppointmentController.dart';
import 'package:AtDocHUB/Model/Appointment.dart';
import 'package:AtDocHUB/View/AlwaysDisableFocusNode.dart';
//import 'package:AtDocHUB/View/Appointment/AppointmentsDetailsEditPage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

//import 'package:AtDocHUB/View/Payment/PaymentStatusDetailsPage.dart';
//import 'package:AtDocHUB/View/homePageAdmin.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'PaymentStatusDetails.dart';

class PaymentDetailEditPage extends StatefulWidget {
  final int aptId;
  final String dTitle;
  late final int tNo;
  late final int docid;
  late final int staffid;
  final String userName;

  PaymentDetailEditPage(this.aptId, this.dTitle, this.tNo, this.docid,
      this.staffid, this.userName);
  @override
  _State createState() => _State(this.aptId, this.dTitle, this.tNo, this.docid,
      this.staffid, this.userName);
}

class _State extends State<PaymentDetailEditPage> {
  var Mode = ["Online", "Cash", "Cheque", "Other"];
  var status = ["Open", "Closed", "Pending", "Cancel"];

  late TextEditingController aptIdController = TextEditingController();
  late TextEditingController staffIdController = TextEditingController();

  late TextEditingController docTitleController = TextEditingController();
  late TextEditingController aptDateController = TextEditingController();

  late TextEditingController aptPlaceController = TextEditingController();
  late TextEditingController aptTimeController = TextEditingController();
  late TextEditingController cityController = TextEditingController();
  late TextEditingController commentsController = TextEditingController();
  late TextEditingController docIdController = TextEditingController();
  late TextEditingController feesCollectedController = TextEditingController();
  late TextEditingController partyNameController = TextEditingController();
  late TextEditingController paymentModeController = TextEditingController();
  late TextEditingController totalFeesController = TextEditingController();
  late TextEditingController partyTypeController = TextEditingController();
  late TextEditingController tokenNoController = TextEditingController();
  late TextEditingController aptExecutiveController = TextEditingController();
  late TextEditingController aptStatusController = TextEditingController();
  late TextEditingController contactNoController = TextEditingController();

  late final int aptId;
  late final String dTitle;
  late final int tNo;
  late final int docid;
  late final int staffid;
  final String userName;

  _State(this.aptId, this.dTitle, this.tNo, this.docid, this.staffid,
      this.userName);

  final _formKey = GlobalKey<FormState>();

  AppointmentController appointmentcontroller =
      Get.put(AppointmentController());

  late Future<Appointment> futureAppointments;

  @override
  void initState() {
    super.initState();
    futureAppointments = AppointmentController.fetchAppointmentsById(this.aptId)
        as Future<Appointment>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 3, 87, 156),
      //   title: Text('Home Page'),
      //   //flexibleSpace: LogOut(),
      // ),
      appBar: AppBar(
        title: const AutoSizeText('Edit Payment Details'),
        backgroundColor: Color.fromARGB(255, 3, 87, 156),
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: BackButtonIcon(),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => PaymentStatusDetailsPage(
                    aptId, dTitle, tNo, docid, staffid, this.userName)))),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: FutureBuilder<Appointment>(
            future: futureAppointments,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Center(
                    child: SelectionArea(
                      child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  // height:
                                  //     MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: TextFormField(
                                    readOnly: true,
                                    minLines: 1,
                                    maxLines: 4,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[a-z A-Z ]")),
                                      // LengthLimitingTextInputFormatter(100)
                                    ],

                                    // autovalidateMode:
                                    //     AutovalidateMode.onUserInteraction,
                                    //  readOnly: true,
                                    //  enabled: false,
                                    style: TextStyle(fontSize: 12),
                                    keyboardType: TextInputType.name,
                                    controller: docTitleController =
                                        TextEditingController(
                                            text: '${this.dTitle}'),
                                    // text: snapshot.data!.docTitle), //,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Document Title',
                                      hintText: 'Enter the document title',
                                    ),
                                    validator: MultiValidator([
                                      RequiredValidator(errorText: 'Required*')
                                    ]),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: TextFormField(
                                        // autovalidateMode:
                                        //     AutovalidateMode.onUserInteraction,
                                        readOnly: true,
                                        enabled: true,
                                        style: TextStyle(fontSize: 12),
                                        keyboardType: TextInputType.number,
                                        controller: tokenNoController =
                                            TextEditingController(
                                                text: '${this.tNo}'),
                                        // text: snapshot.data!.tokenNo),
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Token No',
                                          hintText: 'Enter the token no',
                                        ),
                                        // validator: MultiValidator([
                                        //   RequiredValidator(
                                        //       errorText: 'Required*')
                                        // ]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: TextFormField(
                                        cursorHeight: 15,

                                        //  readOnly: true,
                                        enabled: true,
                                        style: TextStyle(fontSize: 12),
                                        // autovalidateMode:
                                        //     AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.number,
                                        controller: contactNoController =
                                            TextEditingController(
                                                //    text: snapshot.data!.contactNo),
                                                text:
                                                    '${snapshot.data!.contactNo}'),
                                        decoration: const InputDecoration(
                                          errorStyle:
                                              const TextStyle(fontSize: 0.05),
                                          border: OutlineInputBorder(),
                                          labelText: 'Contact No',
                                          hintText: 'Enter the contact no',
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter contact no';
                                          } else if (value.length < 6) {
                                            return 'Please enter 10 digits number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: TextFormField(
                                        readOnly: true,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[a-z A-Z ]")),
                                          LengthLimitingTextInputFormatter(100)
                                        ],

                                        style: TextStyle(fontSize: 12),

                                        // autovalidateMode:
                                        //     AutovalidateMode.onUserInteraction,
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
                                          hintText: 'Enter the party name',
                                        ),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: 'Required*')
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: TextFormField(
                                        readOnly: true,
                                        enabled: true,
                                        //  autovalidateMode:
                                        //    AutovalidateMode.onUserInteraction,
                                        style: TextStyle(fontSize: 12),
                                        keyboardType: TextInputType.name,
                                        controller: partyTypeController =
                                            TextEditingController(
                                                text:
                                                    '${snapshot.data!.partyType}'),
                                        // text: snapshot.data!.partyType),
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Party Type',
                                          hintText: 'Enter the party type',
                                        ),
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: TextFormField(
                                        readOnly: true,
                                        enabled: true,
                                        style: TextStyle(fontSize: 12),
                                        // autovalidateMode:
                                        //    AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.name,
                                        controller: aptStatusController =
                                            TextEditingController(
                                                //  text: snapshot.data!.aptStatus),
                                                text:
                                                    '${snapshot.data!.aptStatus}'),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Appointment Status',
                                          hintText:
                                              'appointment Status required',
                                        ),

                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: 'Required*')
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
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
                                                text: snapshot.data!.userName),

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
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: TextFormField(
                                        readOnly: true,
                                        enabled: true,
                                        // autovalidateMode:
                                        //  AutovalidateMode.onUserInteraction,
                                        style: TextStyle(fontSize: 12),
                                        keyboardType: TextInputType.name,
                                        controller: aptPlaceController =
                                            TextEditingController(
                                                text:
                                                    '${snapshot.data!.aptPlace}'),
                                        // text: snapshot.data!.aptPlace),
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: ' Appointment Place',
                                          hintText:
                                              'appointment place required',
                                        ),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: 'Required*')
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: TextFormField(
                                        readOnly: true,
                                        enabled: true,
                                        // autovalidateMode:
                                        //     AutovalidateMode.onUserInteraction,
                                        style: TextStyle(fontSize: 12),
                                        keyboardType: TextInputType.name,
                                        controller: cityController =
                                            TextEditingController(
                                                text: '${snapshot.data!.city}'),
                                        // text: snapshot.data!.city),
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: ' City',
                                        ),
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: TextFormField(
                                        readOnly: true,
                                        enabled: true,
                                        style: TextStyle(fontSize: 12),
                                        // autovalidateMode:
                                        //    AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.datetime,
                                        controller: aptDateController =
                                            TextEditingController(
                                                //     text: snapshot.data!.aptDate),
                                                text:
                                                    '${snapshot.data!.aptDate}'),
                                        decoration: const InputDecoration(
                                          // prefixIcon: Icon(Icons.calendar_month),
                                          border: OutlineInputBorder(),
                                          labelText: 'Appointment Date',
                                          hintText: 'Appointment Date required',
                                        ),

                                        //  validator: MultiValidator([
                                        //    RequiredValidator(errorText: 'Required*')
                                        //  ]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: TextFormField(
                                        readOnly: true,
                                        enabled: true,
                                        style: TextStyle(fontSize: 12),
                                        // autovalidateMode:
                                        //     AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.datetime,
                                        controller: aptTimeController =
                                            TextEditingController(
                                                text:
                                                    '${snapshot.data!.aptTime}'),
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Appointment Time',
                                          hintText: 'Appointment Time required',
                                        ),
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: TextFormField(
                                        cursorHeight: 15,

                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(50)
                                        ],
                                        // autovalidateMode:
                                        //     AutovalidateMode.onUserInteraction,
                                        style: TextStyle(fontSize: 12),
                                        keyboardType: TextInputType.number,
                                        controller: totalFeesController =
                                            TextEditingController(
                                                //  text: snapshot.data!.totalFees
                                                //  .toString()),
                                                text:
                                                    '${snapshot.data!.totalFees}'),
                                        decoration: const InputDecoration(
                                          errorStyle:
                                              const TextStyle(fontSize: 0.05),
                                          border: OutlineInputBorder(),
                                          labelText: 'Fees',
                                          hintText: 'fees required',
                                        ),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: 'Required*')
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: TextFormField(
                                        cursorHeight: 15,

                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(50)
                                        ],
                                        // autovalidateMode:
                                        //     AutovalidateMode.onUserInteraction,
                                        style: TextStyle(fontSize: 12),
                                        keyboardType: TextInputType.number,
                                        controller: feesCollectedController =
                                            TextEditingController(
                                                // text: snapshot.data!.feesCollected
                                                //  .toString()),
                                                text:
                                                    '${snapshot.data!.feesCollected}'),
                                        decoration: const InputDecoration(
                                          errorStyle:
                                              const TextStyle(fontSize: 0.05),
                                          border: OutlineInputBorder(),
                                          labelText: 'Fees Collected',
                                          hintText: 'fees Collected required',
                                        ),
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: TextFormField(
                                        focusNode:
                                            new AlwaysDisabledFocusNode(),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[a-z A-Z ]")),
                                          LengthLimitingTextInputFormatter(50)
                                        ],
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        style: TextStyle(fontSize: 12),
                                        keyboardType: TextInputType.name,
                                        controller: paymentModeController =
                                            TextEditingController(
                                                //   text: snapshot.data!.paymentMode),
                                                text:
                                                    '${snapshot.data!.paymentMode}'),
                                        decoration: InputDecoration(
                                          errorStyle:
                                              const TextStyle(fontSize: 0.05),
                                          suffixIcon: PopupMenuButton<String>(
                                            // SizedBox(
                                            icon: Icon(Icons.arrow_drop_down),
                                            onSelected: (String value) {
                                              paymentModeController.text =
                                                  value;
                                            },
                                            itemBuilder:
                                                (BuildContext context) {
                                              return Mode.map<
                                                      PopupMenuItem<String>>(
                                                  (String value) {
                                                return new PopupMenuItem(
                                                    child: new Container(
                                                      // height: 17,
                                                      // width: 100,
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
                                          labelText: 'Payment Mode',
                                          hintText: 'Payment Mode required',
                                        ),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: 'Required*')
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    SizedBox(
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: TextFormField(
                                        minLines: 1,
                                        maxLines: 4,
                                        cursorHeight: 15,
                                        //cursorWidth: 8,
                                        //readOnly: true,
                                        enabled: true,
                                        //autovalidateMode:
                                        //   AutovalidateMode.onUserInteraction,
                                        style: TextStyle(fontSize: 12),
                                        keyboardType: TextInputType.name,
                                        controller: commentsController =
                                            TextEditingController(
                                                text:
                                                    '${snapshot.data!.comments}'),
                                        // text: snapshot.data!.comments,
                                        //),
                                        decoration: const InputDecoration(
                                          errorStyle:
                                              const TextStyle(fontSize: 0.05),
                                          border: OutlineInputBorder(),
                                          labelText: 'Comments',
                                          hintText: 'comments required',
                                        ),
                                        // validator: MultiValidator([
                                        //   RequiredValidator(
                                        //       errorText: 'Required*')
                                        // ]),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(

                                    //alignment: Alignment.center,
                                    height: 35,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 3, 89, 168),
                                    ),

                                    //),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        final isValidForm =
                                            _formKey.currentState!.validate();
                                        if (isValidForm) {
                                          _formKey.currentState?.validate();
                                          // aptIdController.text =aptId;
                                          final int docId = this.docid;
                                          // int.parse(docIdController.text)
                                          //    .toInt();
                                          final int aptId = this.aptId;
                                          final int staffId = this.staffid;

                                          final String docTitle =
                                              docTitleController.text;
                                          final int tokenNo =
                                              int.parse(tokenNoController.text)
                                                  .toInt();
                                          final String partyName =
                                              partyNameController.text;
                                          final String partyType =
                                              partyTypeController.text;
                                          final String city =
                                              cityController.text;
                                          final String aptPlace =
                                              aptPlaceController.text;
                                          final int? feesCollected = int.parse(
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

                                          final String aptExecutive =
                                              aptExecutiveController.text;
                                          final String aptStatus =
                                              aptStatusController.text;
                                          final String contactNo =
                                              contactNoController.text;
                                          final String comments =
                                              commentsController.text;
                                          final String createdBy =
                                              this.userName;
                                          final String updatedBy =
                                              this.userName;
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
                                                  builder: (BuildContext
                                                          context) =>
                                                      PaymentStatusDetailsPage(
                                                          aptId,
                                                          docTitle,
                                                          tNo,
                                                          docid,
                                                          staffid,
                                                          this.userName)));

                                          setState(() {
                                            futureAppointments =
                                                createAppointment(
                                              // docId,
                                              aptId,
                                              staffId,
                                              docId,

                                              //String docTitle,
                                              // String tokenNo,
                                              partyName,
                                              contactNo,
                                              partyType,
                                              aptPlace,
                                              city,
                                              feesCollected!,
                                              totalFees,
                                              paymentMode,
                                              aptDate,
                                              aptTime,
                                              // String aptExecutive,
                                              aptStatus,
                                              comments,
                                              createdBy,
                                              updatedBy,
                                            );
                                          });
                                          // }
                                        }
                                      },

                                      child: const Text("Save"),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color.fromARGB(
                                                      255, 3, 89, 168))),

                                      // )
                                    ))
                              ],
                            ),
                          )),
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
    );
  }
}
