import 'package:AtDocHUB/Notification/NotificationPage.dart';
import 'package:AtDocHUB/View/AppointmentPageFE.dart';
import 'package:AtDocHUB/View/Activity/ActivityStatusPage.dart';
import 'package:AtDocHUB/View/homePageAdmin.dart';

import 'package:AtDocHUB/Controller/DocumentController.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:get/get.dart';

import 'package:AtDocHUB/Model/Document.dart';
import 'package:flutter/material.dart';

class NotificationDocs extends StatefulWidget {
  final int docId;

  NotificationDocs(this.docId);

  @override
  _NotificationDocsState createState() => _NotificationDocsState(this.docId);
}

class _NotificationDocsState extends State<NotificationDocs> {
  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  DocumentController documentController = Get.put(DocumentController());

  late Future<Document> futureDocuments;
  final int docId;
  _NotificationDocsState(this.docId);

  @override
  void initState() {
    super.initState();
    futureDocuments = DocumentController.fetchDocumentsByID(this.docId);
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Color.fromARGB(255, 3, 87, 156),
      minimumSize: Size(30, 15),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          title: Text('Document Details'),
          leading: IconButton(
              icon: BackButtonIcon(),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AdminNotification()))),
        ),
        body: SafeArea(
          child: SelectionArea(
            child: Center(
              child: FutureBuilder<Document>(
                  future: futureDocuments,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView(children: [
                        SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.all(30),
                            height: 600,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Document Title : " +
                                          snapshot.data!.docTitle,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      )),
                                  Text(
                                      "Token No : " +
                                          snapshot.data!.tokenNo.toString(),
                                      style: const TextStyle(fontSize: 15)),
                                  Text(
                                      "Party Name : " +
                                          snapshot.data!.partyName,
                                      style: const TextStyle(fontSize: 15)),
                                  Text("Address : " + snapshot.data!.address,
                                      style: const TextStyle(fontSize: 15)),
                                  Text("City : " + snapshot.data!.city,
                                      style: const TextStyle(fontSize: 15)),
                                  Text("Pin Code : " + snapshot.data!.pinCode,
                                      style: const TextStyle(fontSize: 15)),
                                  Text("Duration : " + snapshot.data!.duration,
                                      style: const TextStyle(fontSize: 15)),
                                  Text(
                                      "Document Type : " +
                                          snapshot.data!.docType,
                                      style: const TextStyle(fontSize: 15)),
                                  Text(
                                      "Document Status : " +
                                          snapshot.data!.docStatus,
                                      style: const TextStyle(fontSize: 15)),
                                  Text(
                                      "Start Date : " +
                                          snapshot.data!.startDate,
                                      style: const TextStyle(fontSize: 15)),
                                  Text("End Date : " + snapshot.data!.endDate,
                                      style: const TextStyle(fontSize: 15)),
                                  Text(
                                      "Rent Description : " +
                                          snapshot.data!.rentDesc,
                                      style: const TextStyle(fontSize: 15)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ]),
                          ),
                        )
                      ]);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  }),
            ),
          ),
        ));
  }
}
