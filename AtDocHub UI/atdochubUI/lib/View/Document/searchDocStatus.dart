// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:AtDocHUB/Controller/DocumentController.dart';
import 'package:AtDocHUB/View/Document/document_status_report.dart';

import '../../Controller/DocumentController.dart';
import '../../Model/Document.dart';
import '../Activity/ActivityStatusPage.dart';
import '../AppointmentPageFE.dart';
import '../homePageAdmin.dart';
import 'AddNewDocument.dart';
import 'DocumentsDetails.dart';
import 'search_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchDocStatus extends StatefulWidget {
  @override
  SearchDocStatusState createState() => SearchDocStatusState();
}

class SearchDocStatusState extends State<SearchDocStatus> {
  TextEditingController startdatecntr = TextEditingController();
  TextEditingController enddatecntr = TextEditingController();

  List<Document> docs = [];
  String query = '';
  Timer? debouncer;

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
    final docs = await DocumentController.getdocs(query);

    setState(() => this.docs = docs);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          title: Text('Document Status'),
          leading: IconButton(
              icon: BackButtonIcon(),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ActivityStatusPage()))),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(child: buildSearch()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SingleChildScrollView(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final doc = docs[index];

                  return builddoc(doc);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Document Title or Token No.',
        onChanged: searchdoc,
      );

  Future searchdoc(String query) async => debounce(() async {
        final docs = await DocumentController.getdocs(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.docs = docs;
        });
      });

  Widget builddoc(Document doc) => Card(
        child: ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DocumentStatusReport(doc.docId))),
          title: Text(
            doc.docTitle,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            doc.tokenNo.toString(),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                doc.docStatus,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DocumentStatusReport(doc.docId)));
                  },
                  icon: const Icon(Icons.keyboard_arrow_right_sharp)),
            ],
          ),
          // onTap: () {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => DocumentStatusReport(doc.docId)));
          // },
        ),
      );
}
