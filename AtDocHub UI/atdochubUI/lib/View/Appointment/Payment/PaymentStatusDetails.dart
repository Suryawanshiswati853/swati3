import 'package:AtDocHUB/Controller/AppointmentController.dart';
import 'package:AtDocHUB/Model/Appointment.dart';
import 'package:AtDocHUB/View/Appointment/Payment/PaymentStatusExecution.dart';
import 'package:AtDocHUB/Controller/DocumentController.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:get/get.dart';

import 'package:AtDocHUB/Model/Document.dart';
import 'package:flutter/material.dart';

import 'PaymentDetailEdit.dart';

class PaymentStatusDetailsPage extends StatefulWidget {
  String result = "0";
  final int aptId;

  PaymentStatusDetailsPage(this.aptId);

  @override
  _PaymentStatusDetailsState createState() =>
      _PaymentStatusDetailsState(this.aptId);
}

class _PaymentStatusDetailsState extends State<PaymentStatusDetailsPage> {
  final int aptId;

  _PaymentStatusDetailsState(this.aptId);
  //_DocumentsDetailsState(this.docId);
  AppointmentController appointmentController =
      Get.put(AppointmentController());

  late Future<Appointment> futureAppointments;
  //late Future<List<Appointment>> futureapt;

  @override
  void initState() {
    super.initState();

    futureAppointments = AppointmentController.fetchAppointmentsById(this.aptId)
        as Future<Appointment>;
  }

  final _formKey = GlobalKey<FormState>();

  late int totalpayment;
  late int pendingpayment;
  late int receivedpayment;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Payment Status Details',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const AutoSizeText('Payment Status Details'),
            backgroundColor: Color.fromARGB(255, 3, 87, 156),
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: BackButtonIcon(),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PaymentStatusExecution()))),
          ),
          body: SafeArea(
            child: SelectionArea(
              child: Center(
                child: FutureBuilder<Appointment>(
                  future: futureAppointments,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      totalpayment = snapshot.data!.totalFees;
                      receivedpayment = snapshot.data!.feesCollected;

                      print(totalpayment);
                      print(receivedpayment);
                      pendingpayment = totalpayment - receivedpayment;
                      print(pendingpayment);
                      return ListView(
                        children: [
                          SingleChildScrollView(
                            child: Container(
                              padding: new EdgeInsets.all(30),
                              //height: 600,

                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                        "Doc Title : " +
                                            snapshot.data!.partyName,
                                        style: const TextStyle(fontSize: 15.0)),
                                    SizedBox(
                                      height: 35,
                                    ),
                                    AutoSizeText(
                                        "Token No : " +
                                            snapshot.data!.partyType,
                                        style: const TextStyle(fontSize: 15.0)),
                                    SizedBox(
                                      height: 35,
                                    ),
                                    AutoSizeText(
                                        "Party Name : " +
                                            snapshot.data!.partyName,
                                        style: const TextStyle(fontSize: 15.0)),
                                    SizedBox(
                                      height: 35,
                                    ),
                                    AutoSizeText(
                                        "Fees : " +
                                            snapshot.data!.totalFees.toString(),
                                        style: const TextStyle(fontSize: 15.0)),
                                    SizedBox(
                                      height: 35,
                                    ),
                                    AutoSizeText(
                                        "Fees Collected : " +
                                            snapshot.data!.feesCollected
                                                .toString(),
                                        style: const TextStyle(fontSize: 15.0)),
                                    SizedBox(
                                      height: 35,
                                    ),
                                    AutoSizeText(
                                        "Pending Payment : " +
                                            pendingpayment.toString(),
                                        style: const TextStyle(fontSize: 15.0)),
                                    SizedBox(
                                      height: 35,
                                    ),
                                    AutoSizeText(
                                        "Payment Mode : " +
                                            snapshot.data!.paymentMode!,
                                        style: const TextStyle(fontSize: 15.0)),
                                    SizedBox(
                                      height: 35,
                                    ),
                                  ]),

                              //)
                            ),
                          ),
                          FittedBox(
                            child:
                                //  Row(
                                //   children: [
                                //     SizedBox(
                                //       width: 100,
                                //     ),
                                Container(
                              alignment: Alignment.center,
                              height: 35,
                              width: 200,
                              margin: EdgeInsets.symmetric(
                                horizontal: 100.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 3, 89, 168),
                              ),
                              child: TextButton(
                                // style:
                                //     TextButton.styleFrom(fixedSize: Size.fromHeight(300)),
                                child: const AutoSizeText(
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
                                          builder: (BuildContext context) =>
                                              PaymentDetailEditPage(
                                                  this.aptId)),
                                      (Route<dynamic> route) => false);
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
