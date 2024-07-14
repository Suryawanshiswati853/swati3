import 'package:AtDocHUB/View/AppointmentPageFE.dart';
import './AppointmentsDetailsEditPage.dart';
import 'dart:core';

import 'package:AtDocHUB/Controller/AppointmentController.dart';
import 'package:AtDocHUB/Model/Appointment.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter/material.dart';

class AppointmentDetails extends StatefulWidget {
  final int aptId;
  final int staff_Id;
  late final int docID;

  final String dTitle;
  final int tNo;
  // final String doctitle;
  // final String docToken;
  final String aptExecutive;

  AppointmentDetails(
      this.aptId,
      this.staff_Id,
      this.docID,
      this.dTitle,
      this.tNo,
      // this.doctitle,
      // this.docToken,
      this.aptExecutive);

  @override
  _AppointmentDetailsState createState() => _AppointmentDetailsState(
        this.aptId,
        this.staff_Id,
        this.docID,

        this.dTitle,
        this.tNo,

        //this.doctitle,
        // this.docToken,
        this.aptExecutive,
      );
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  AppointmentController appointmentController =
      Get.put(AppointmentController());

  late Future<Appointment> futureAppointments;
  final int aptId;
  final int staff_Id;
  final int docID;

  final String dTitle;
  final int tNo;
  //final String docToken;
  final String aptExecutive;

  _AppointmentDetailsState(
      this.aptId,
      this.staff_Id,
      this.docID,
      this.dTitle,
      this.tNo,
      // this.doctitle, this.docToken
      this.aptExecutive);

  @override
  void initState() {
    super.initState();
    //  print('detail staff ID $staff_Id');
    //  print('detail doc ID $docId');
    print('apt detail...... $aptId, $dTitle, $tNo');
    // setState(() {
    //   final String title = this.doctitle;
    //   final String token = this.docToken;
    //   //final String executive = this.aptExecutive;
    // });
    // futureDocuments = documentController
    //     .fetchDocumentsByTitle('Skyone Building, Flat no 101');
    // futureDocuments = documentController.fetchDocumentsByID(docId);
    futureAppointments =
        AppointmentController.fetchAppointmentsById(this.aptId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 87, 156),
        title: Text('Appointment Details'),
        leading: IconButton(
            icon: BackButtonIcon(),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => AppointmentPageFE()))),
      ),
      body: Center(
        child: FutureBuilder<Appointment>(
          future: futureAppointments,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(children: [
                SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: 750,
                      // child: Card(
                      //
                      child: SelectionArea(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Document Title: ' + this.dTitle,
                                  style: const TextStyle(fontSize: 15.0)),
                              Text('Token No :' + this.tNo.toString(),
                                  style: const TextStyle(fontSize: 15.0)),

                              Text("Party Name : " + snapshot.data!.partyName,
                                  style: const TextStyle(fontSize: 15.0)),
                              Text(
                                  "Appointment Executive : ${this.aptExecutive}",
                                  style: const TextStyle(fontSize: 15.0)),
                              Text("Contact No : " + snapshot.data!.contactNo,
                                  style: const TextStyle(fontSize: 15.0)),
                              Text("Party Type : " + snapshot.data!.partyType,
                                  style: const TextStyle(fontSize: 15.0)),
                              Text(
                                  "Appointment Place : " +
                                      snapshot.data!.aptPlace,
                                  style: const TextStyle(fontSize: 15.0)),
                              Text("Appointment City : " + snapshot.data!.city,
                                  style: const TextStyle(fontSize: 15.0)),
                              Text(
                                  "Appointment Date : " +
                                      snapshot.data!.aptDate,
                                  style: const TextStyle(fontSize: 15.0)),
                              Text(
                                  "Appointment Time : " +
                                      snapshot.data!.aptTime,
                                  style: const TextStyle(fontSize: 15.0)),
                              Text(
                                  "Appointment Status : " +
                                      snapshot.data!.aptStatus,
                                  style: const TextStyle(fontSize: 15.0)),
                              Text(
                                  "Fees : " +
                                      snapshot.data!.totalFees.toString(),
                                  style: const TextStyle(fontSize: 15.0)),
                              Text(
                                  "Fees Collected : " +
                                      snapshot.data!.feesCollected.toString(),
                                  style: const TextStyle(fontSize: 15.0)),
                              Text(
                                  "Payment Mode : " +
                                      snapshot.data!.paymentMode,
                                  style: const TextStyle(fontSize: 15.0)),

                              Text("Comments : " + snapshot.data!.comments,
                                  style: const TextStyle(fontSize: 15.0)),
                              //  ])),
                              // ),

                              // child: Row(
                              //   children: [
                              // SizedBox(
                              //   width: 100,
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 35,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 3, 89, 168),
                                    ),
                                    child: TextButton(
                                      // style:
                                      //     TextButton.styleFrom(fixedSize: Size.fromHeight(300)),
                                      child: const Text(
                                        'Edit ',
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          backgroundColor:
                                              Color.fromARGB(255, 3, 89, 168),
                                        ),
                                      ),

                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        AppointmentDetailsEditPage(
                                                          this.aptId,
                                                          this.docID,
                                                          this.staff_Id,
                                                          this.dTitle,
                                                          this.tNo,
                                                          this.aptExecutive,
                                                        )),
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ),

                    // ),
                    padding: const EdgeInsets.all(10),
                  ),
                ),
              ]);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
