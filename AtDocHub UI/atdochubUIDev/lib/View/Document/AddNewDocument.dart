import 'dart:convert';

import 'package:AtDocHUB/Controller/DocumentController.dart';
import 'package:AtDocHUB/Model/Document.dart';
import 'package:AtDocHUB/View/Document/DocumentPage.dart';
import 'package:AtDocHUB/View/Document/DocumentsDetails.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:http/http.dart' as http;

//import 'package:onesignal_flutter/onesignal_flutter.dart';

DateTime now = DateTime.now();
String formattedDate = DateFormat("yyyy-MM-dd").format(now);

//import 'package:flutter_text_form_field/flutter_text_form_field.dart';
class AddNewDocument extends StatefulWidget {
  final String userName;

  AddNewDocument(this.userName);

  @override
  State createState() {
    return _AddNewDocumentState(this.userName);
  }
}
// AddAppointmentState<AddDocument> createState() => _AddDocumentState();

class _AddNewDocumentState extends State<AddNewDocument> {
  final String userName;

  _AddNewDocumentState(this.userName);

  late final String date1;

  late String datainput;

  final List<String> items1 = ["Open", "Closed", "Cancel", "Submitted"];
  String? selectedItem;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController docIdController = TextEditingController();

  TextEditingController docTitleController = TextEditingController();
  TextEditingController tokenNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController docStatusController = TextEditingController();
  TextEditingController docTypeController = TextEditingController();

  TextEditingController partyNameController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  TextEditingController rentDescController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  late String docType = docTypeController.text;
  int DID = 0;
  final List<String> items = [
    "Residential",
    "Commercial",
  ];
  String? selectedValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<int> _getDividersIndexes() {
    List<int> _dividersIndexes = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _dividersIndexes.add(i);
      }
    }
    return _dividersIndexes;
  }

  @override
  void dispose() {
    docStatusController.dispose();
    docTypeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Future<Document>? _futureDocument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 87, 156),
        title: Text('Add New Document'),
        leading: IconButton(
            icon: BackButtonIcon(),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    DocumentPage(this.userName)))),
      ),
      body:
          //Container(

          SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: (_futureDocument == null)
                ? buildColumn()
                : buildFutureBuilder(),
          ),
        ),
      ),
    );
  }

  Form buildColumn() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.06,
          //   width: MediaQuery.of(context).size.width * 8,
          // child:
          TextFormField(
            minLines: 1,
            maxLines: 3,

            textCapitalization: TextCapitalization.words,

            //    autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: [
              //  LengthLimitingTextInputFormatter(100),
              FilteringTextInputFormatter.allow(
                  RegExp("[ ',-/ a-z A-Z á-ú Á-Ú 0-9]")),
            ],

            controller: docTitleController,
            style: TextStyle(fontSize: 12),
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                errorStyle: const TextStyle(fontSize: 0.05),
                border: OutlineInputBorder(),
                hintStyle: TextStyle(fontSize: 12),
                labelStyle: TextStyle(
                  fontSize: 12,
                ),
                labelText: 'Document Title',
                hintText: 'Document title required'),

            // validator: ,
            validator:
                MultiValidator([RequiredValidator(errorText: 'Required*')]),
          ),

          SizedBox(
            height: 20,
          ),
          Wrap(
            children: [
              SizedBox(
                // height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  style: TextStyle(fontSize: 12),
                  minLines: 1,
                  maxLines: 2,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(14)
                  ],
                  //    autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: tokenNoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.05),
                      counterText: "",
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(fontSize: 12),
                      labelStyle: TextStyle(
                        fontSize: 12,
                      ),
                      labelText: 'Token No',
                      hintText: 'Token no required'),
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
                width: 15,
              ),
              SizedBox(
                // height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  style: TextStyle(fontSize: 12),
                  minLines: 1,
                  maxLines: 2,
                  //    autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2)
                  ],
                  controller: durationController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.05),
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(fontSize: 12),
                      labelStyle: TextStyle(
                        fontSize: 12,
                      ),
                      labelText: 'Duration(M)',
                      hintText: 'Duration required'),
                  validator: MultiValidator(
                    [RequiredValidator(errorText: 'Required*')],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.06,
          //   width: MediaQuery.of(context).size.width,
          //   child:
          SizedBox(
            // height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              minLines: 1,
              maxLines: 4,
              //     autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: [
                LengthLimitingTextInputFormatter(50),
                FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
              ],
              controller: partyNameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  errorStyle: const TextStyle(fontSize: 0.05),
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(fontSize: 12),
                  labelStyle: TextStyle(
                    fontSize: 12,
                  ),
                  labelText: 'Party Name',
                  hintText: 'Party name required'),
              validator:
                  MultiValidator([RequiredValidator(errorText: 'Required*')]),
            ),
          ),

          SizedBox(
            height: 20,
          ),
          SizedBox(
            //  height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              minLines: 1,
              maxLines: 4,
              //  autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: [
                LengthLimitingTextInputFormatter(100),
                FilteringTextInputFormatter.allow(
                    RegExp("[,-/: a-z A-Z á-ú Á-Ú 0-9]")),
              ],
              controller: addressController,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                  errorStyle: const TextStyle(fontSize: 0.05),
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(fontSize: 12),
                  labelStyle: TextStyle(
                    fontSize: 12,
                  ),
                  labelText: 'Address',
                  hintText: 'Address required'),
              validator:
                  MultiValidator([RequiredValidator(errorText: 'Required*')]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                // height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  minLines: 1,
                  maxLines: 2,
                  //  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                    FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9]")),
                  ],
                  controller: cityController,

                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.05),
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(fontSize: 12),
                      labelStyle: TextStyle(
                        fontSize: 12,
                      ),
                      labelText: 'City',
                      hintText: 'City required'),
                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'Required*')]),
                ),
              ),
              SizedBox(
                width: 13,
              ),
              SizedBox(
                // height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  minLines: 1,
                  maxLines: 2,

                  //     autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6)
                  ],
                  controller: pinCodeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.05),
                      hintStyle: TextStyle(fontSize: 12),
                      labelStyle: TextStyle(
                        fontSize: 12,
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'PinCode',
                      hintText: 'PinCode required'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Pin Code No';
                    } else if (value.length < 6) {
                      return 'Please enter 6 digits number';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.08,
          //   width: MediaQuery.of(context).size.width * 0.5,
          //   child: TextFormField(
          //     // controller: docTypeController =
          //     //     TextEditingController(
          //     //   text: '${snapshot.data!.docType}',
          //     // ),
          //     decoration: InputDecoration(
          //       suffixIcon: PopupMenuButton<String>(
          //         icon: Icon(Icons.arrow_drop_down),
          //         onSelected: (String value) {
          //           docTypeController.text = value;
          //         },

          //         // child: DropdownButton2(
          //         itemBuilder: (BuildContext context) {
          //           // PopupMenuItem(child: Text(''));
          //           // Padding(
          //           //     padding: const EdgeInsets.only(
          //           //         top: 50, bottom: 50));

          //           return items.map<PopupMenuItem<String>>((String value) {
          //             return new PopupMenuItem(
          //                 // height: 40,
          //                 padding: EdgeInsets.symmetric(
          //                   horizontal: 45,
          //                   vertical: 5,
          //                 ),
          //                 textStyle:
          //                     TextStyle(color: Colors.black, fontSize: 12),
          //                 child: new Text(value),
          //                 value: value);
          //           }).toList();
          //         },
          //       ),

          //       border: OutlineInputBorder(),
          //       labelText: 'Document Type',
          //       //  hintText: 'Enter the docType',
          //     ),
          //   ),
          // ),
          // Container(
          //   // child: Row(
          //   child: Column(
          //     children: <Widget>[
          //       const Align(
          //           alignment: Alignment.center,
          //           child: SizedBox(
          //             width: 50,
          //           )),
          Wrap(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.4,
                child: InputDecorator(
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(fontSize: 0.05),

                    //  fillColor: Colors.grey[10],
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                      // width: 10
                    )),
                  ),
                  // child: Padding(
                  //   padding: EdgeInsets.only(top: 4),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: AutoSizeText(
                        'Document Status',
                        style: TextStyle(
                          fontSize: 10,
                          //color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items1
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedItem,
                      onChanged: (value) {
                        setState(() {
                          selectedItem = value as String;
                        });
                      },
                      //isExpanded: true,
                      buttonHeight: 20,
                      buttonWidth: 150,
                      itemHeight: 40,
                      dropdownWidth: 200,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                //  height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.5,
                child: InputDecorator(
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(fontSize: 0.05),
                    border: OutlineInputBorder(
                        // borderSide:
                        //     BorderSide(color: Colors.black, width: 0.1)
                        //
                        ),
                  ),
                  // child: Padding(
                  //   padding: EdgeInsets.only(top: 3),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: AutoSizeText(
                        'Document Type',
                        style: TextStyle(
                          fontSize: 10,
                          //color: Theme.of(context).hintColor,
                        ),
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
                      buttonHeight: 20,
                      buttonWidth: 200,
                      itemHeight: 40,
                      dropdownWidth: 200,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            children: [
              SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(
                  //  autovalidateMode: AutovalidateMode.onUserInteraction,
                  //FilteringTextInputFormatter.allow(RegExp("[- 0-9]")),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[- 0-9]")),
                    LengthLimitingTextInputFormatter(10)
                  ],
                  controller: startDateController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    errorStyle: const TextStyle(fontSize: 0.05),
                    prefixIcon: Icon(Icons.calendar_month),
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(fontSize: 12),
                    labelStyle: TextStyle(
                      fontSize: 12,
                    ),
                    labelText: 'Start Date',
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
                        print(startDateController.text);
                      } else {
                        print("Date is not selected");
                      }
                    });
                    final int dur = int.parse(durationController.text);
                    var stDate = DateTime.parse(startDateController.text);

                    var jiffy = Jiffy(stDate).add(
                      months: dur,
                      days: -1,
                      // days: 1095,
                    );
                    DateTime d = jiffy.dateTime;
                    String s = jiffy.format('yyyy-MM-dd');
                    setState(() {
                      endDateController.text = s.toString();
                    });
                  },

                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'Required*')]),
                ),
              ),
              SizedBox(
                width: 13,
              ),
              SizedBox(
                // height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  // maxLength: 8,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  autofocus: false,
                  controller: endDateController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[- 0-9]")),
                    LengthLimitingTextInputFormatter(10)
                  ],
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.05),
                      // prefixIcon: Icon(Icons.calendar_month),
                      counterText: "",
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(fontSize: 12),
                      labelStyle: TextStyle(
                        fontSize: 12,
                      ),
                      labelText: 'End Date',
                      hintText: ' yyyy-MM-dd'),
                  onTap: () async {},

                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'Required*')]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          // Container(
          //     child: Column(children: <Widget>[
          //   const Align(
          //       alignment: Alignment.center,
          //       child: SizedBox(
          //         width: 100,
          //       )),

          SizedBox(
            //  height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              minLines: 1,
              maxLines: 4,

              // autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9]")),
                // FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(50)
              ],
              controller: rentDescController,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                  errorStyle: const TextStyle(fontSize: 0.05),
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(fontSize: 12),
                  labelStyle: TextStyle(
                    fontSize: 12,
                  ),
                  labelText: 'Rent Description',
                  hintText: 'Rent Description required'),
              // validator:
              //     MultiValidator([RequiredValidator(errorText: 'Required*')]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(

              //alignment: Alignment.center,
              height: 35,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color.fromARGB(255, 3, 89, 168),
              ),
              child: ElevatedButton(
                onPressed: () async {
                  formKey.currentState?.validate();
                  final isValidForm = formKey.currentState!.validate();
                  if (isValidForm) {
                    //formKey.currentState?.validate();
                    //  final int docId = ;
                    final String docTitle = docTitleController.text;
                    final int tokenNo =
                        int.parse(tokenNoController.text).toInt();
                    //final String tokenNo = tokenNoController.text;
                    final String partyName = partyNameController.text;

                    // addStatus(selectedItem!);
                    final String docType = selectedValue.toString();
                    final String docStatus = selectedItem.toString();

                    final String address = addressController.text;

                    final String city = cityController.text;

                    final String rentDesc = rentDescController.text;
                    // final String docStatus = docStatusController.text;
                    final String pinCode = pinCodeController.text;
                    final String duration = durationController.text;
                    // final int pinCode = int.parse(pinCodeController.text).toInt();
                    // final int duration = int.parse(durationController.text).toInt();
                    final String startDate = startDateController.text;
                    final String endDate = endDateController.text;
                    final String createdBy = this.userName;
                    // final String updatedBy = this.userName;
                    print(
                        'User Name from Add Document Page : ${this.userName}');
                    // DateTime now = DateTime.now();

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            DocumentPage(this.userName)));

                    setState(() {
                      _futureDocument = createDocument(
                        // docId,
                        docTitle,
                        tokenNo,
                        partyName,
                        docType,
                        address,
                        city,
                        pinCode,
                        duration,
                        rentDesc,
                        docStatus,
                        startDate,
                        endDate,
                        createdBy,
                        //updatedBy,
                        //  createdAt,
                      );
                    });
                    // }
                  }
                },
                child: const Text("Save"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 3, 89, 168))),
              ))
        ],
      ),
    );
    //])
    //);
  }

  FutureBuilder<Document> buildFutureBuilder() {
    return FutureBuilder<Document>(
      future: _futureDocument,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.docTitle);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
