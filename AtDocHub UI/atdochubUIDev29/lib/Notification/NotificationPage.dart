import 'dart:async';
import 'package:AtDocHUB/Controller/DocumentController.dart';
import 'package:AtDocHUB/Notification/NotificationDocs.dart';

import 'package:AtDocHUB/View/homePageAdmin.dart';
import '../../Model/Document.dart';
import 'package:flutter/material.dart';

class AdminNotification extends StatefulWidget {
  final String userName;
  //final String createdBY;
  AdminNotification(this.userName);
  @override
  AdminNotificationState createState() => AdminNotificationState(this.userName);
}

class AdminNotificationState extends State<AdminNotification> {
  late final String userName;
  // late final String createdBY;

  TextEditingController startdatecntr = TextEditingController();
  TextEditingController enddatecntr = TextEditingController();
  List<Document> docs = [];
  List<Document> datedocs = [];
  String stDate = '';
  String query = '';
  Timer? debouncer;
  AdminNotificationState(this.userName);
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
    final docs = await DocumentController.agreementEnd();
    print(docs);
    setState(() => this.docs = docs);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          title: Text('Notifications'),
          leading: IconButton(
              icon: BackButtonIcon(),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => homePageAdmin(
                        '',
                        this.userName,
                      )))),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //buildDocSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  // final doc = docs[index];
                  //print(doc);
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      color: Color.fromARGB(255, 233, 246, 252),
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            child: Text(
                                '${docs[index].docTitle} ${docs[index].endDate} ',
                                style: TextStyle(
                                  color: Colors.black,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NotificationDocs(
                                            (docs[index].docId),
                                            this.userName,
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
