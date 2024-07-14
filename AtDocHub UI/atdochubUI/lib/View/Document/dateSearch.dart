import 'package:AtDocHUB/Model/Document.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class dateSearch extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  dateSearch(
      {required this.text, required this.onChanged, required this.hintText});

  @override
  State<dateSearch> createState() => _dateSearchState();
}

class _dateSearchState extends State<dateSearch> {
  String stDate = '';
  final startDtcontroller = TextEditingController();
  List<Document> docs = [];
  DateTime? selectedDateTime;

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54, fontSize: 10);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Center(
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.4,
          // color: Color.fromARGB(255, 233, 246, 252),
          // margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          // decoration: BoxDecoration(
          //   // borderRadius: BorderRadius.circular(12),
          //   color: Colors.white,
          //   border: Border.all(color: Colors.black26),
          // ),
          // padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,

                initialDate: selectedDateTime ?? DateTime.now(),
                firstDate: DateTime(
                    1991), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2025),
                // onConfirm:widget.onChanged,
              ).then((pickedDate) {
                if (pickedDate != null) {
                  // print(
                  //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);

                  print(formattedDate);

                  setState(() {
                    startDtcontroller.text = formattedDate;
                    selectedDateTime = pickedDate;

                    //set output date to TextField value.
                  });
                  //print(startDtcontroller.text);
                  //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement
                  // DateFormat df = new DateFormat("yyyy-MM-dd");
                  // String stDate = df.format(pickedDate);
                  // print(stDate);

                  widget.onChanged(formattedDate);
                } else {
                  print("Date is not selected");
                }
              });

              // final docs = await DocumentController.checkDate(stDate);

              // setState(() => this.docs = docs);
            },
            onChanged: widget.onChanged,

            readOnly:
                false, //set it true, so that user will not able to edit text

            controller: startDtcontroller,
            decoration: InputDecoration(
              icon: Icon(Icons.calendar_month, color: style.color),
              hintText: widget.hintText,
              hintStyle: style,

              // border: InputBorder.none,
            ),
            style: style,
          )),
    );
  }
}
