
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
  late final String userName;
  AddAppointment(this.userName);
  @override
  _AddAppointmentState createState() => _AddAppointmentState(this.userName);
}

class _AddAppointmentState extends State<AddAppointment> {
  final String userName;
  _AddAppointmentState(this.userName);
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

  late final int dID;
  late final int staff_Id;
  //late int Uid;
  //late int ExId;
  late final apID = null;

  late String executiveName;

  List<UserLogin> allUsers = [];
  late String createdBY = '';
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
    setState(() {
      this.allUsers = allUsrs;
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
                      builder: (BuildContext context) =>
                          AppointmentPageFE(this.userName)))),
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
                  //   inputFormatters: [
                  //   //   FilteringTextInputFormatter.digitsOnly,
                  //   LengthLimitingTextInputFormatter(50)
                  // ],
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
                      firstDate: DateTime
                          .now(), //DateTime.now() - not to allow to choose before today.
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
                  final String createdBy = this.userName;
                  print('before : ${createdBy}');
                  createdBY = createdBy;
                  print('After : ${createdBy}');
                  // final String updatedBy = '';
                  // print('updatedBy: ${updatedBy}');
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
                      createdBy,
                      //updatedBy
                    );
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          AppointmentPageFE(this.userName)));
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
