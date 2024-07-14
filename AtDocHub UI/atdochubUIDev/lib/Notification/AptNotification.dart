import 'dart:async';
import 'package:AtDocHUB/Controller/AppointmentController.dart';
import 'package:AtDocHUB/Controller/DocumentController.dart';
import 'package:AtDocHUB/Model/Appointment.dart';
import 'package:AtDocHUB/View/Appointment/AppointmentDetailPage.dart';
import 'package:AtDocHUB/View/AppointmentPageFE.dart';
import 'package:AtDocHUB/View/Document/AddNewDocument.dart';
import 'package:AtDocHUB/View/Document/DocumentsDetails.dart';
import 'package:AtDocHUB/View/Document/dateSearch.dart';
import 'package:AtDocHUB/View/LoginPage.dart';
import 'package:AtDocHUB/View/homePageAdmin.dart';
import '../../Controller/DocumentController.dart';
import '../../Model/Document.dart';
import 'package:flutter/material.dart';

class AptNotification extends StatefulWidget {
  String playerid;
  AptNotification(this.playerid);
  @override
  AptNotificationState createState() => AptNotificationState(this.playerid);
}

class AptNotificationState extends State<AptNotification> {
  late final String userName;
  TextEditingController startdatecntr = TextEditingController();
  TextEditingController enddatecntr = TextEditingController();
  List<Appointment> apts = [];
  List<Appointment> datedocs = [];
  String stDate = '';
  String query = '';
  Timer? debouncer;
  String playerid;
  AptNotificationState(this.playerid);

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final apts = await AppointmentController.weeklyNotification();
    print(apts);
    setState(() => this.apts = apts);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          title: Text('Notifications'),
          leading: IconButton(
              icon: BackButtonIcon(),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      AppointmentPageFE(this.userName)))),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //buildDocSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: apts.length,
                itemBuilder: (context, index) {
                  // final doc = docs[index];
                  //print(doc);
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Card(
                      color: Color.fromARGB(255, 233, 246, 252),
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            child: Text(
                                '${apts[index].docTitle} ${apts[index].aptDate}',
                                style: TextStyle(
                                  color: Colors.black,
                                )),
                            onPressed: () {
                              final int apiid = (apts[index].aptId);
                              final int did = (apts[index].docId);
                              final int staffid = (apts[index].staffId);
                              final String doctitle = (apts[index].docTitle);
                              final int tokenNo = (apts[index].tokenNo);
                              final String aptExecutive =
                                  (apts[index].userName);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AppointmentDetails(
                                          userName,
                                          apiid,
                                          did,
                                          staffid,
                                          doctitle,
                                          tokenNo,
                                          aptExecutive,
                                          this.playerid
                                          // (apts[index].aptExecutive),
                                          )));
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
}
