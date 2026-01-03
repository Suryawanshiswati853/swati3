import 'dart:async';

import 'package:AtDocHUB/Controller/AppointmentController.dart';
import 'package:AtDocHUB/Controller/LoginController.dart';
import 'package:AtDocHUB/Model/Appointment.dart';
import 'package:AtDocHUB/Model/User.dart';
import 'package:AtDocHUB/View/AlwaysDisableFocusNode.dart';
import 'package:AtDocHUB/View/Appointment/AppointmentDetailPage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class AppointmentDetailsEditPage extends StatefulWidget {
  final String userName;
  final int aptId;
  final int staffId;

  final int docID;

  final String dTitle;
  final int tNo;
  final String aptExecutive;
  final String playerid;
  final String createdBY;

  AppointmentDetailsEditPage(
      this.userName,
      this.aptId,
      this.staffId,
      this.docID,
      this.dTitle,
      this.tNo,
      this.aptExecutive,
      this.playerid,
      this.createdBY);

  @override
  _AppointmentDetailsEditPageState createState() =>
      _AppointmentDetailsEditPageState(
          this.userName,
          this.aptId,
          this.staffId,
          this.docID,
          this.dTitle,
          this.tNo,
          this.aptExecutive,
          this.playerid,
          this.createdBY);
}

class _AppointmentDetailsEditPageState
    extends State<AppointmentDetailsEditPage> {
  // late final String executive;
  Future<Appointment>? futureAppointments;
  var paymentMode = ["Online", "Cash", "Cheque"];
//  int staffid = 0;
  String? selectedMode;
  var items = ["Owner", "Tenant", "Agent", "Both"];

  // late final int dID;

  var status = ["Open", "Closed", "Cancel"];
  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 6.0);

  AppointmentController appointmentController =
      Get.put(AppointmentController());
  late final String userName;
  final int aptId;
  late int staffId;
  late int docID;
  final String dTitle;
  final int tNo;
  String aptExecutive;
  String playerid;
  final String createdBY;

  List<Appointment> aptmnt = [];
  List<UserLogin> allUsers = [];
  String username = '';

  _AppointmentDetailsEditPageState(
      this.userName,
      this.aptId,
      this.staffId,
      this.docID,
      this.dTitle,
      this.tNo,
      this.aptExecutive,
      this.playerid,
      this.createdBY);

  @override
  void initState() {
    // this.staff_Id = staff_Id;
    print(
        'apt detail...... $aptId, $dTitle, $tNo, $aptExecutive ,$staffId,$docID');
    super.initState();
    futureAppointments =
        AppointmentController.fetchAppointmentsById(this.aptId);

    init();
  }

  Future init() async {
    // final apmnt = await AppointmentController.fetchAppointmentList();
    final allUsrs = await LoginController.users();
    //final aptsExecutive = await AppointmentController.fetchAppointments;
    setState(() {
      //this.aptmnt = apmnt;
      this.allUsers = allUsrs;
      // this.aptExecutive = aptsExecutive as String;
      // for (int i = 0; i <= aptmnt.length; i++) {
      //  this.username = aptmnt[i].userName;
      // this.staff_Id = aptmnt[i].staffId;
      // }
    });
    // final aptmnt = await AppointmentController.fetchAppointments;
    // final aptmnt =
    //   await AppointmentController.fetchAppointmentsById(this.aptId);
    // final allUsrs = await LoginController.users();
    // setState(() {
    // this.aptmnt = aptmnt as List<Appointment>;
    //  this.aptmnt = aptmnt as List<Appointment>;
    // this.allUsers = allUsrs;
    //  });
  }

  Future<void> initOneSignal() async {
    OneSignal.shared.setAppId('e89acaa4-5388-4e3a-bd69-44d197bdcbd7');
    final status = await OneSignal.shared.getDeviceState();
    final String? osUserID = status?.userId;

    // var playerId = status.subscriptionStatus.userId;
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      debugPrint('NOTIFICATION OPENED HANDLER CALLED WITH: $result');
      setState(() {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => AppointmentDetails(
                this.userName,
                this.aptId,
                this.staffId,
                this.docID,
                this.dTitle,
                this.tNo,
                this.aptExecutive,
                this.playerid)));
      });
    });
  }

  late TextEditingController aptIdController = new TextEditingController();

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
                    this.userName,
                    aptId,
                    staffId,
                    docID,
                    dTitle,
                    tNo,
                    aptExecutive,
                    this.playerid)))),
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
                      String createdBY = snapshot.data!.createdBy;
                      print('edit :${createdBY}');
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
                                              text: '${this.tNo}'),

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
                                          focusNode:
                                              new AlwaysDisabledFocusNode(),
                                          minLines: 1,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp("[a-z A-Z]")),
                                          ],
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
                                        child: TypeAheadField<UserLogin>(
                                          hideSuggestionsOnKeyboardHide: true,
                                          textFieldConfiguration:
                                              TextFieldConfiguration(
                                            decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                  fontSize: 0.05),

                                              fillColor: Color.fromARGB(
                                                  255, 233, 246, 252),
                                              //  prefixIcon: Icon(Icons.search),
                                              suffixIcon: GestureDetector(
                                                child: Icon(
                                                  Icons.close,
                                                  color: Color.fromARGB(
                                                      137, 221, 221, 221),
                                                  size: 20,
                                                ),
                                                onTap: () {
                                                  aptExecutiveController
                                                      .clear();
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          FocusNode());
                                                },
                                              ),
                                              border: OutlineInputBorder(
                                                  // borderRadius: BorderRadius.circular(10.0),
                                                  ),
                                              hintText:
                                                  'Appointment Executive ',
                                              //  labelText: 'Appointment Executive',

                                              hintStyle:
                                                  TextStyle(fontSize: 12),
                                            ),
                                            controller: this
                                                    .aptExecutiveController =
                                                TextEditingController(
                                                    text:
                                                        '${this.aptExecutive}'),
                                          ),
                                          suggestionsCallback: (pattern) async {
                                            return await LoginController
                                                .users();
                                          },
                                          itemBuilder:
                                              (context, UserLogin allUsers) {
                                            final user = allUsers;

                                            return ListTile(
                                              title: Text(user.userName),
                                            );
                                          },
                                          noItemsFoundBuilder: (context) =>
                                              Container(
                                            height: 50,
                                            child: Center(
                                              child: Text(
                                                'No Staff Found.',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                          ),
                                          onSuggestionSelected:
                                              (UserLogin? AllUsers) {
                                            final user = AllUsers!;
                                            this.aptExecutiveController.text =
                                                user.userName;
                                            this.aptExecutive = user.userName;
                                            // this.staffId = user.userId;

                                            setState(() {
                                              this.aptExecutiveController.text =
                                                  user.userName;
                                              this.staffId = user.userId;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      SizedBox(
                                        //   height: 80.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: TextFormField(
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
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter contact No';
                                            } else if (value.length < 10) {
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
                                              firstDate: DateTime.now(),
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
                                              DateTime parsedTime =
                                                  DateFormat.Hm().parse(
                                                      pickedTime
                                                          .format(context)
                                                          .toString());

                                              String formattedTime =
                                                  DateFormat('HH:mm:ss')
                                                      .format(parsedTime);
                                              print(
                                                  formattedTime); //output 14:59:00

                                              aptTimeController.text =
                                                  formattedTime; //set the value of text field.

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
                                          focusNode:
                                              new AlwaysDisabledFocusNode(),
                                          minLines: 1,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp("[a-z A-Z ]")),
                                            //  LengthLimitingTextInputFormatter(50)
                                          ],
                                          style: TextStyle(fontSize: 12),
                                          keyboardType: TextInputType.name,
                                          controller: aptStatusController =
                                              TextEditingController(
                                                  text:
                                                      '${snapshot.data!.aptStatus}'),
                                          decoration: InputDecoration(
                                            errorStyle:
                                                const TextStyle(fontSize: 0.05),
                                            suffixIcon: PopupMenuButton<String>(
                                              icon: Icon(Icons.arrow_drop_down),
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
                                                        child: new Text(value),
                                                      ),
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
                                          focusNode:
                                              new AlwaysDisabledFocusNode(),
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
                                        onPressed: () {
                                          final int docId = this.docID;

                                          final int aptId = this.aptId;

                                          final int staffId = this.staffId;
                                          print('$staffId');

                                          final String partyName =
                                              partyNameController.text;
                                          final String partyType =
                                              partyTypeController.text;
                                          final String city =
                                              cityController.text;
                                          final String aptPlace =
                                              aptPlaceController.text;
                                          int feesCollected;
                                          if (feesCollectedController
                                              .text.isNotEmpty) {
                                            feesCollected = int.parse(
                                                    feesCollectedController
                                                        .text)
                                                .toInt();
                                          } else {
                                            feesCollected = 0;
                                          }

                                          final int totalFees = int.parse(
                                                  totalFeesController.text)
                                              .toInt();

                                          final String aptDate =
                                              aptDateController.text;
                                          final String aptTime =
                                              aptTimeController.text;

                                          final String paymentMode =
                                              paymentModeController.text;

                                          final String aptEx =
                                              aptExecutiveController.text;
                                          final String aptStatus =
                                              aptStatusController.text;
                                          final String contactNo =
                                              contactNoController.text;
                                          final String comments =
                                              commentsController.text;
                                          final createdBy = this.userName;
                                          final updatedBy = this.userName;

                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          AppointmentDetails(
                                                              userName,
                                                              aptId,
                                                              staffId,
                                                              docID,
                                                              dTitle,
                                                              tNo,
                                                              aptEx,
                                                              this.playerid)));

                                          setState(() {
                                            futureAppointments =
                                                createAppointment(
                                              aptId,
                                              staffId,
                                              docID,
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
                                              updatedBy,
                                            );
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
                                      ))
                                ])),
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
