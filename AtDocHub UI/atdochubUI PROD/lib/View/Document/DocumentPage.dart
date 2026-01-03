import 'dart:async';
import 'package:AtDocHUB/Controller/DocumentController.dart';
import 'package:AtDocHUB/View/Document/AddNewDocument.dart';
import 'package:AtDocHUB/View/Document/dateSearch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Controller/DocumentController.dart';
import '../../Model/Document.dart';
import '../Activity/ActivityStatusPage.dart';
import '../AppointmentPageFE.dart';
import '../homePageAdmin.dart';
import 'DocumentsDetails.dart';
import 'search_widget.dart';
import 'package:flutter/material.dart';

class DocumentPage extends StatefulWidget {
  @override
  DocumentPageState createState() => DocumentPageState();
}

class DocumentPageState extends State<DocumentPage> {
  TextEditingController startdatecntr = TextEditingController();
  TextEditingController enddatecntr = TextEditingController();
  final _scrollController = ScrollController();

  List<Document> docs = [];
  List<Document> datedocs = [];
  String stDate = '';
  String query = '';
  Timer? debouncer;
  // final snackBar =
  //SnackBar(content: const Text('Kindly Use Filters to search Document'));

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Kindly Use Filters to search Document!'),
            duration: const Duration(seconds: 5),
            backgroundColor: Color.fromARGB(255, 49, 104, 150),
            action: SnackBarAction(
                label: 'Dismiss',
                textColor: Colors.white,
                onPressed: () {
                  // Hide the snackbar before its duration ends
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                })));
      } else {
        if (_scrollController.position.pixels !=
            _scrollController.position.maxScrollExtent) {
          return null;
        }
      }
    });
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
    setState(() {
      this.docs = docs;
    });
    print(docs);
  }

  // void _checkController() {
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.pixels ==
  //         _scrollController.position.maxScrollExtent) {
  //       Fluttertoast.showToast(
  //           msg: "Kindly Use Filter",
  //           toastLength: Toast.LENGTH_LONG,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Color.fromARGB(255, 3, 87, 156),
  //           textColor: Colors.white,
  //           fontSize: 12.0);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Color.fromARGB(255, 3, 87, 156),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AddNewDocument()));
            }),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          title: Text('Documents'),
          leading: IconButton(
              icon: BackButtonIcon(),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => homePageAdmin()))),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Expanded(
            child: Container(
              height: 50,
              width: 800,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 87, 156),
              ),
              child: Row(children: [
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      //  if()
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => homePageAdmin()));
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.file_copy_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DocumentPage()),
                          (Route<dynamic> route) => false);
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.schedule,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AppointmentPageFE()),
                          (Route<dynamic> route) => false);
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.local_activity,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ActivityStatusPage()),
                          (Route<dynamic> route) => false);
                    },
                  ),
                ),
              ]),
            ),
          ),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildDocSearch(),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  buildStartSearch(),
                  buildEndSearch(),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // Center(
              //   child: Text('No Data Available'),
              // ),

              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final doc = docs[index];
                    print(doc);
                    //_checkController();

                    return builddoc(doc);
                  },
                ),
              ),
            ]),
        // Container(
        //   child: Text('No Data Found'),
        // )
      );
  Widget buildDocSearch() => SearchWidget(
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

  //End Date Search

  Future searchEndDate(String query) async {
    final docs = await DocumentController.getenddatedocs(query);
    // print("========" + '$docs');
    // if (docs == null) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Data is empty'),
    //     ),
    //   );
    // }
    if (!mounted) return;
    setState(() {
      this.query = query;
      this.docs = docs;
      // if (docs.isEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text('Data is empty'),
      //     ),
      //   );
      // }
    });
  }

  Widget buildEndSearch() => dateSearch(
      text: query, onChanged: searchEndDate, hintText: 'Enter End Date');

  //Start Date Search

  Future searchdocdate(String query) async {
    final docs = await DocumentController.getdatedocs(query);
    print("========" + '$docs');

    if (!mounted) return;
    setState(() {
      this.query = query;
      this.docs = docs;
    });
  }

  Widget buildStartSearch() => dateSearch(
      text: query, onChanged: searchdocdate, hintText: 'Enter Start Date');

  Widget builddoc(Document doc) => Card(
        //color: Color.fromARGB(255, 233, 246, 252),
        elevation: 3,
        child: ListTile(
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
          trailing: const Icon(Icons.keyboard_arrow_right_sharp),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DocumentsDetails((doc.docId))));
          },
        ),
      );
}
