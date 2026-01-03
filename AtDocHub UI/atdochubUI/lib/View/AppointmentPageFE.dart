import 'dart:async';

import 'package:AtDocHUB/Model/Document.dart';
import 'package:AtDocHUB/Model/User.dart';
import 'package:AtDocHUB/Notification/AptNotification.dart';
import 'package:AtDocHUB/View/Document/dateSearch.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:AtDocHUB/View/Activity/ActivityStatusPage.dart';
import 'package:AtDocHUB/View/Document/DocumentPage.dart';
import 'package:AtDocHUB/View/homePageAdmin.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import '../Controller/AppointmentController.dart';
import '../Controller/DocumentController.dart';
import '../Model/Appointment.dart';
import 'Appointment/AddNewAppointment.dart';
import 'Appointment/AppointmentDetailPage.dart';

class AppointmentPageFE extends StatefulWidget {
  // final TextEditingController mycontroller = TextEditingController();
  @override
  State<AppointmentPageFE> createState() => _AppointmentPageFEState();
}

class _AppointmentPageFEState extends State<AppointmentPageFE> {
  final TextEditingController typeAheadControllerDate = TextEditingController();
  final TextEditingController typeAheadControllerName = TextEditingController();
  //String formattedDate = DateFormat('yyyy-MM-dd – kk:mm');

  AppointmentController appointmentController =
      Get.put(AppointmentController());
  final TextEditingController controller = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  List<UserLogin> logs = [];
  String email = '';

  String pass = '';
  List<Document> docs = [];

  //final _myController = TextEditingController(text: '');
  TextEditingController dateinput = TextEditingController();

  late Future<List<Appointment>> futureAppointments; //call for search bar
  late Future<List<Appointment>> futureapt; //call for list of documents
  late Future<List<Appointment>> futuretodayapt; //call for list of documents
  late Future<List<Appointment>> futuretommorowapt;

  List<Appointment> apmnt = [];
  String query = '';
  String dTitle = '';
  String token = '';
  @override
  void initState() {
    super.initState();
    dateinput.text = "";
    //set the initial value of text field
    futureAppointments = AppointmentController
        .fetchSearchAppointmentList(); //call for search bar
    futureapt = AppointmentController
        .fetchAppointmentList(); //call for list of documents
    futuretodayapt =
        AppointmentController.fetchAptByTodays() as Future<List<Appointment>>;
    futuretommorowapt = AppointmentController.fetchAptByTommorow();
  }

  Future init() async {
    final apmnt = await AppointmentController.fetchAppointmentList();
    setState(() => this.apmnt = apmnt);
    final docs = await DocumentController.getdocs(query);
    setState(() {
      this.docs = docs;
      for (int i = 0; i <= docs.length; i++) {
        this.dTitle = docs[i].docTitle;
        this.token = docs[i].tokenNo.toString();
      }
    });
    print(docs);
  }
  // final logs = await LoginController.login(email, pass);
  // setState(() => this.logs = logs as List<UserLogin>);

  @override
  Widget build(BuildContext context) {
    //Apt date search

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => AddAppointment()),
                (Route<dynamic> route) => false);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: const Text('Appointments'),
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: BackButtonIcon(),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => DocumentPage()))),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
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
        body: Column(children: [
          FittedBox(
            // child: Padding(
            //   padding: const EdgeInsets.all(3.0),
            child: Row(
              children: [
                Container(
                  //  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      Icon(Icons.person),
                      Text(
                        'Field Executive',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 190,
                ),
                Container(
                  child: Column(
                    children: [
                      FittedBox(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AptNotification()));
                          },
                          child: Icon(
                            Icons.notifications,
                            color: Colors.black,
                          ),
                          //Text(
                          //   'Notifications',
                          //   style: TextStyle(
                          //       fontSize: 12,
                          //       // color: Colors.grey,
                          //       fontWeight: FontWeight.bold),
                          //  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SingleChildScrollView(
              child: Row(children: <Widget>[
            Container(
              // margin: EdgeInsets.fromLTRB(0, 0, 10, 0),

              padding: EdgeInsets.all(12),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.5,
                // color: Color.fromARGB(255, 233, 246, 252),
                child: TypeAheadField<Appointment>(
                  hideSuggestionsOnKeyboardHide: true,
                  textFieldConfiguration: TextFieldConfiguration(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            // size: 15,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Title/Token No',
                          hintStyle: TextStyle(fontSize: 10)),
                      //  controller:this.controller
                      controller: this.controller),
                  suggestionsCallback: AppointmentController.fetchAppointments,
                  itemBuilder: (context, Appointment suggestion) {
                    final user = suggestion;

                    return ListTile(
                      title: Text(this.dTitle),
                    );
                  },
                  noItemsFoundBuilder: (context) => Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        'No Documents Found.',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  onSuggestionSelected: (Appointment? suggestion) {
                    final user = suggestion;
                    // this.controller.text = user.docTitle;
                    this.controller.text = user!.docTitle;
                    final int aptId = user.aptId;
                    final int userId = user.staffId;
                    final int docId = user.docId;

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AppointmentDetails(
                            user.aptId,
                            user.docId,
                            user.staffId,
                            user.docTitle,
                            user.tokenNo,
                            user.aptExecutive)));
                  },
                ),
              ),
            ),
            buildAptDate()
          ])),
          // SizedBox(
          //   width: 50,
          // ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Expanded(
              child: ListView.builder(
                itemCount: apmnt.length,
                itemBuilder: (context, index) {
                  final doc = apmnt[index];
                  print(doc);
                  return builappointment(doc);
                },
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Today's Appointments",
                style: TextStyle(fontSize: 15.0, color: Colors.blue),
              )),
          const SizedBox(
            height: 0.1,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                height: 200,
                width: 500,
                child: FutureBuilder<List<Appointment>>(
                  future: futuretodayapt,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => Card(
                                child: ListTile(
                                  title: AutoSizeText(
                                    snapshot.data![index].partyName,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    snapshot.data![index].partyType,
                                  ),
                                  trailing: const Icon(
                                      Icons.keyboard_arrow_right_sharp),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AppointmentDetails(
                                                    (apmnt[index].aptId),
                                                    (apmnt[index].docId),
                                                    (apmnt[index].staffId),
                                                    (apmnt[index].docTitle),
                                                    (apmnt[index].tokenNo),
                                                    (apmnt[index]
                                                        .aptExecutive))));
                                  },
                                ),
                              ));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.0,
          ),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Tomorrow's Appointments",

//),
                style: TextStyle(fontSize: 15.0, color: Colors.blue),
              )),
          SizedBox(
            height: 0.1,
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            height: 200,
            width: 500,
            child: FutureBuilder<List<Appointment>>(
              future: futuretommorowapt,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Card(
                            child: ListTile(
                              title: Text(
                                snapshot.data![index].partyName,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                snapshot.data![index].partyType,
                              ),
                              trailing:
                                  const Icon(Icons.keyboard_arrow_right_sharp),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AppointmentDetails(
                                              (snapshot.data![index].aptId),
                                              (snapshot.data![index].docId),
                                              (snapshot.data![index].staffId),
                                              (snapshot.data![index].docTitle),
                                              (snapshot.data![index].tokenNo),
                                              (snapshot
                                                  .data![index].aptExecutive),
                                            )));
                              },
                            ),
                          ));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          )))
        ]));

    // )
    //));
  }

  Future searchAptDate(String query) async {
    final docs = await AppointmentController.aptDate(query);
    print("========" + '$docs');

    if (!mounted) return;
    setState(() {
      this.query = query;
      this.apmnt = apmnt;
    });
  }

  Widget buildAptDate() => dateSearch(
        text: query,
        onChanged: searchAptDate,
        hintText: 'Appointment Date',
      );

  Widget builappointment(Appointment doc) => Expanded(
        child: Card(
          elevation: 3,
          child: ListTile(
            title: Text(
              doc.partyName,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              doc.partyType,
            ),
            trailing: const Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AppointmentDetails(
                          (doc.aptId),
                          doc.docId,
                          doc.staffId,
                          doc.docTitle,
                          doc.tokenNo,
                          doc.aptExecutive)));
            },
          ),
        ),
      );
}
