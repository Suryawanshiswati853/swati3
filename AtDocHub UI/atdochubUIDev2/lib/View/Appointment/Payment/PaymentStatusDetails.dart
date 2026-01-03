import 'package:AtDocHUB/Controller/AppointmentController.dart';
import 'package:AtDocHUB/Model/Appointment.dart';
import 'package:AtDocHUB/View/Appointment/Payment/PaymentStatusExecution.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'PaymentDetailEdit.dart';

class PaymentStatusDetails extends StatefulWidget {
  final String userName;
  final int aptId;
  final int staff_Id;
  final int docID;
  final String dTitle;
  final int tNo;

  final String aptExecutive;

  PaymentStatusDetails(
    this.userName,
    this.aptId,
    this.staff_Id,
    this.docID,
    this.dTitle,
    this.tNo,
    //this.createdBY,
    // this.doctitle,
    // this.docToken,
    this.aptExecutive,
  );

  @override
  _PaymentStatusDetailsState createState() => _PaymentStatusDetailsState(
        this.userName,
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

class _PaymentStatusDetailsState extends State<PaymentStatusDetails> {
  late String createdby;

  AppointmentController appointmentController =
      Get.put(AppointmentController());

  late Future<Appointment> futureAppointments;
  final String userName;

  final int aptId;
  final int staff_Id;
  final int docID;

  final String dTitle;
  final int tNo;
  //final String docToken;
  final String aptExecutive;

  _PaymentStatusDetailsState(
    this.userName,
    this.aptId,
    this.staff_Id,
    this.docID,
    this.dTitle,
    this.tNo,
    // this.doctitle, this.docToken
    this.aptExecutive,
  );

  @override
  void initState() {
    super.initState();
    //  print('detail staff ID $staff_Id');
    //  print('detail doc ID $docId');
    print('apt detail...... $aptId, $dTitle, $tNo');

    futureAppointments =
        AppointmentController.fetchAppointmentsById(this.aptId);
  }

  late int totalpayment;
  late int pendingpayment;
  late int receivedpayment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 87, 156),
        title: Text('Payment Status Details'),
        leading: IconButton(
            icon: BackButtonIcon(),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => PaymentStatusExecution(
                      this.userName,
                    )))),
      ),
      body: Center(
        child: FutureBuilder<Appointment>(
          future: futureAppointments,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              this.createdby = snapshot.data!.createdBy;
              totalpayment = snapshot.data!.totalFees;
              receivedpayment = snapshot.data!.feesCollected;

              print(totalpayment);
              print(receivedpayment);
              pendingpayment = totalpayment - receivedpayment;
              print(pendingpayment);

              return ListView(children: [
                SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: 500,
                      // child: Card(
                      //
                      child: SelectionArea(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText('Document Title: ' + this.dTitle,
                                  style: const TextStyle(fontSize: 15.0)),
                              AutoSizeText('Token No :' + this.tNo.toString(),
                                  style: const TextStyle(fontSize: 15.0)),
                              AutoSizeText(
                                  "Party Name : " + snapshot.data!.partyName,
                                  style: const TextStyle(fontSize: 15.0)),
                              AutoSizeText(
                                  "Party Type : " + snapshot.data!.partyType,
                                  style: const TextStyle(fontSize: 15.0)),
                              AutoSizeText(
                                  "Fees : " +
                                      snapshot.data!.totalFees.toString(),
                                  style: const TextStyle(fontSize: 15.0)),
                              AutoSizeText(
                                  "Fees Collected : " +
                                      snapshot.data!.feesCollected.toString(),
                                  style: const TextStyle(fontSize: 15.0)),
                              AutoSizeText(
                                  "Pending Payment : " +
                                      pendingpayment.toString(),
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                              AutoSizeText(
                                  "Payment Mode : " +
                                      snapshot.data!.paymentMode,
                                  style: const TextStyle(fontSize: 15.0)),
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
                                        Navigator.of(context).pushAndRemoveUntil(
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    PaymentStatusDetailsEditPage(
                                                        this.userName,
                                                        this.aptId,
                                                        this.staff_Id,
                                                        this.docID,
                                                        this.dTitle,
                                                        this.tNo,
                                                        this.aptExecutive,
                                                        this.createdby)),
                                            (Route<dynamic> route) => false);
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


// class PaymentStatusDetailsPage extends StatefulWidget {
//   //String result = "0";
//   final int aptId;
//   final String dTitle;
//   final String tNo;
//   final String userName;
//   PaymentStatusDetailsPage(this.aptId, this.dTitle, this.tNo, this.userName);

//   @override
//   _PaymentStatusDetailsState createState() => _PaymentStatusDetailsState(
//       this.aptId, this.dTitle, this.tNo, this.userName);
// }

// class _PaymentStatusDetailsState extends State<PaymentStatusDetailsPage> {
//   final int aptId;
//   final String dTitle;
//   final String tNo;
//   final String userName;
//   _PaymentStatusDetailsState(this.aptId, this.dTitle, this.tNo, this.userName);
//   //_DocumentsDetailsState(this.docId);
//   AppointmentController appointmentController =
//       Get.put(AppointmentController());

//   late Future<Appointment> futureAppointments;
//   //late Future<List<Appointment>> futureapt;

//   @override
//   void initState() {
//     super.initState();

//     futureAppointments =
//         AppointmentController.fetchAppointmentsById(this.aptId);
//   }

//   final _formKey = GlobalKey<FormState>();

//   late int totalpayment;
//   late int pendingpayment;
//   late int receivedpayment;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Payment Status Details',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: Scaffold(
//           appBar: AppBar(
//             title: const AutoSizeText('Payment Status Details'),
//             backgroundColor: Color.fromARGB(255, 3, 87, 156),
//             automaticallyImplyLeading: false,
//             leading: IconButton(
//                 icon: BackButtonIcon(),
//                 onPressed: () => Navigator.of(context).push(MaterialPageRoute(
//                     builder: (BuildContext context) =>
//                         PaymentStatusExecution(this.userName)))),
//           ),
//           body: SafeArea(
//             child: SelectionArea(
//               child: Center(
//                 child: FutureBuilder<Appointment>(
//                   future: futureAppointments,
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       totalpayment = snapshot.data!.totalFees;
//                       receivedpayment = snapshot.data!.feesCollected;

//                       print(totalpayment);
//                       print(receivedpayment);
//                       pendingpayment = totalpayment - receivedpayment;
//                       print(pendingpayment);
//                       return ListView(
//                         children: [
//                           SingleChildScrollView(
//                             child: Container(
//                               padding: new EdgeInsets.all(30),
//                               //height: 600,

//                               child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     AutoSizeText("Doc Title : " + this.dTitle,
//                                         style: const TextStyle(fontSize: 15.0)),
//                                     SizedBox(
//                                       height: 35,
//                                     ),
//                                     AutoSizeText("Token No : " + this.tNo,
//                                         style: const TextStyle(fontSize: 15.0)),
//                                     SizedBox(
//                                       height: 35,
//                                     ),
//                                     AutoSizeText(
//                                         "Party Name : " +
//                                             snapshot.data!.partyName,
//                                         style: const TextStyle(fontSize: 15.0)),
//                                     SizedBox(
//                                       height: 35,
//                                     ),
//                                     AutoSizeText(
//                                         "Fees : " +
//                                             snapshot.data!.totalFees.toString(),
//                                         style: const TextStyle(fontSize: 15.0)),
//                                     SizedBox(
//                                       height: 35,
//                                     ),
//                                     AutoSizeText(
//                                         "Fees Collected : " +
//                                             snapshot.data!.feesCollected
//                                                 .toString(),
//                                         style: const TextStyle(fontSize: 15.0)),
//                                     SizedBox(
//                                       height: 35,
//                                     ),
//                                     AutoSizeText(
//                                         "Pending Payment : " +
//                                             pendingpayment.toString(),
//                                         style: const TextStyle(fontSize: 15.0)),
//                                     SizedBox(
//                                       height: 35,
//                                     ),
//                                     AutoSizeText(
//                                         "Payment Mode : " +
//                                             snapshot.data!.paymentMode,
//                                         style: const TextStyle(fontSize: 15.0)),
//                                     SizedBox(
//                                       height: 35,
//                                     ),
//                                   ]),

//                               //)
//                             ),
//                           ),
//                           FittedBox(
//                             child:
//                                 //  Row(
//                                 //   children: [
//                                 //     SizedBox(
//                                 //       width: 100,
//                                 //     ),
//                                 Container(
//                               alignment: Alignment.center,
//                               height: 35,
//                               width: 200,
//                               margin: EdgeInsets.symmetric(
//                                 horizontal: 100.0,
//                               ),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Color.fromARGB(255, 3, 89, 168),
//                               ),
//                               child: TextButton(
//                                 // style:
//                                 //     TextButton.styleFrom(fixedSize: Size.fromHeight(300)),
//                                 child: const AutoSizeText(
//                                   'Edit ',
//                                   style: TextStyle(
//                                     fontSize: 17.0,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                     backgroundColor:
//                                         Color.fromARGB(255, 3, 89, 168),
//                                   ),
//                                 ),

//                                 onPressed: () {
//                                   Navigator.of(context).pushAndRemoveUntil(
//                                       MaterialPageRoute(
//                                           builder: (BuildContext context) =>
//                                               PaymentDetailEditPage(
//                                                   this.aptId,
//                                                   this.dTitle,
//                                                   this.tNo,
//                                                   this.userName)),
//                                       (Route<dynamic> route) => false);
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     } else if (snapshot.hasError) {
//                       return Text('${snapshot.error}');
//                     }

//                     // By default, show a loading spinner.
//                     return const CircularProgressIndicator();
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
// }
