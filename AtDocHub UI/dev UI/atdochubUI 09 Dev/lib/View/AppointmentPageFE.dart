import 'dart:async';

import 'package:AtDocHUB/Controller/LoginController.dart';
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
  late final String userName;
  AppointmentPageFE(this.userName);
  // final TextEditingController mycontroller = TextEditingController();
  @override
  State<AppointmentPageFE> createState() =>
      _AppointmentPageFEState(this.userName);
}

class _AppointmentPageFEState extends State<AppointmentPageFE> {
  final String userName;
  late final String executive;
  final TextEditingController typeAheadControllerDate = TextEditingController();
  final TextEditingController typeAheadControllerName = TextEditingController();
  //String formattedDate = DateFormat('yyyy-MM-dd – kk:mm');
  _AppointmentPageFEState(this.userName);
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
  late Future<List<Appointment>> aptsExecutive =
      [] as Future<List<Appointment>>; //call for search bar

  List<Appointment> apmnt = [];
  String query = '';
  String dTitle = '';
  String token = '';
  String username = '';
  int aptid = 0;
  @override
  void initState() {
    super.initState();
    dateinput.text = "";
    //set the initial value of text field
    futureAppointments = AppointmentController
        .fetchSearchAppointmentList(); //call for search bar
    futureapt = AppointmentController
        .fetchAppointmentList(); //call for list of documents
    futuretodayapt = AppointmentController.fetchAptByTodays();
    futuretommorowapt = AppointmentController.fetchAptByTommorow();
    init();
  }

  Future init() async {
    final apmnt = await AppointmentController.fetchAppointmentList();
    final aptsExecutive = await AppointmentController.fetchAppointments;

    setState(() {
      this.apmnt = apmnt;
      this.aptsExecutive = aptsExecutive as Future<List<Appointment>>;
      for (int i = 0; i <= apmnt.length; i++) {
        this.username = apmnt[i].userName;
        this.aptid = apmnt[i].aptId;
      }
    });
    final docs = await DocumentController.getdocs(query);

    setState(() {
      this.docs = docs;

      // for (int i = 0; i <= docs.length; i++) {
      //   this.dTitle = docs[i].docTitle;
      //   this.token = docs[i].tokenNo.toString();
      // }
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
                    builder: (BuildContext context) =>
                        AddAppointment(this.userName)),
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
                  builder: (BuildContext context) =>
                      DocumentPage(this.userName)))),
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
                          builder: (BuildContext context) =>
                              homePageAdmin(this.userName)));
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
                                  DocumentPage(this.userName)),
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
                                  AppointmentPageFE(this.userName)),
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
                      style: TextStyle(fontSize: 12),
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
                  itemBuilder: (context, Appointment alluser) {
                    final user = alluser;

                    return ListTile(
                      title: Text(
                        user.docTitle,
                        style: TextStyle(fontSize: 12),
                      ),
                      subtitle: Text(
                        user.partyType,
                        style: TextStyle(fontSize: 12),
                      ),
                    );
                  },
                  noItemsFoundBuilder: (context) => Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        'No Documents Found.',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  onSuggestionSelected: (Appointment? alluser) {
                    final user = alluser!;
                    // this.controller.text = user.docTitle;
                    this.controller.text = user.docTitle;
                    final int aptId = user.aptId;
                    dTitle = user.docTitle;
                    final int tNo = user.tokenNo;
                    final int docid = user.docId;
                    final int staffid = user.staffId;
                    final String aptExcecutive = user.userName;
                    setState(() {
                      this.executive = aptExcecutive;
                    });
                    // final int userId = user.staffId;
                    //    final int docId = user.docId;

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AppointmentDetails(this.userName,
                            aptId, staffid, docid, dTitle, tNo, aptExcecutive
                            //  user.docId,
                            // user.staffId,
                            //  user.docTitle,
                            // user.tokenNo,
                            //user.aptExecutive
                            )));
                    print('apt id null $aptId');
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
                  final apt = apmnt[index];
                  print(apt);
                  return builappointment(apt);
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
                          itemBuilder: (_, index) => Container(
                                height: 70,
                                child: Card(
                                  child: ListTile(
                                    onTap: () {
                                      final int aptId =
                                          (snapshot.data![index].aptId);
                                      final int docId =
                                          (snapshot.data![index].docId);
                                      final int staffId =
                                          (snapshot.data![index].staffId);
                                      final String dTitle =
                                          (snapshot.data![index].docTitle);
                                      final int tNo =
                                          (snapshot.data![index].tokenNo);
                                      final String aptExcecutive =
                                          (snapshot.data![index].userName);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AppointmentDetails(
                                                      userName,
                                                      aptId,
                                                      staffId,
                                                      docId,
                                                      dTitle,
                                                      tNo,
                                                      aptExcecutive
                                                      // (apmnt[index]
                                                      //     .aptExecutive)
                                                      )));
                                    },
                                    title: AutoSizeText(
                                      snapshot.data![index].docTitle,
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: AutoSizeText(
                                      snapshot.data![index].tokenNo.toString(),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        AutoSizeText(
                                          snapshot.data![index].partyType,
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              final int aptId =
                                                  (snapshot.data![index].aptId);
                                              final int docId =
                                                  (snapshot.data![index].docId);
                                              final int staffId = (snapshot
                                                  .data![index].staffId);
                                              final String dTitle = (snapshot
                                                  .data![index].docTitle);
                                              final int tNo = (snapshot
                                                  .data![index].tokenNo);
                                              final String aptExcecutive =
                                                  (snapshot
                                                      .data![index].userName);
                                              print(
                                                  'apt executive...........:$aptExcecutive');

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AppointmentDetails(
                                                              userName,
                                                              aptId,
                                                              staffId,
                                                              docId,
                                                              dTitle,
                                                              tNo,
                                                              aptExcecutive
                                                              //aptExcecutive
                                                              // (apmnt[index]
                                                              //     .aptExecutive)
                                                              )));
                                            },
                                            icon: const Icon(Icons
                                                .keyboard_arrow_right_sharp)),
                                      ],
                                    ),
                                  ),
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
                      itemBuilder: (_, index) => Container(
                            height: 70,
                            child: Card(
                                child: ListTile(
                                    onTap: (() {
                                      final int aptId =
                                          (snapshot.data![index].aptId);
                                      final int docId =
                                          (snapshot.data![index].docId);
                                      final int staffId =
                                          (snapshot.data![index].staffId);
                                      final String dTitle =
                                          (snapshot.data![index].docTitle);
                                      final int tNo =
                                          (snapshot.data![index].tokenNo);
                                      final String aptExcecutive =
                                          (snapshot.data![index].userName);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AppointmentDetails(
                                                      userName,
                                                      aptId,
                                                      staffId,
                                                      docId,
                                                      dTitle,
                                                      tNo,
                                                      aptExcecutive

                                                      // (snapshot
                                                      //     .data![index].aptExecutive),
                                                      )));
                                    }),
                                    title: AutoSizeText(
                                      snapshot.data![index].docTitle,
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: AutoSizeText(
                                      snapshot.data![index].tokenNo.toString(),
                                    ),
                                    trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          AutoSizeText(
                                            snapshot.data![index].partyType,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                final int aptId = (snapshot
                                                    .data![index].aptId);
                                                final int docId = (snapshot
                                                    .data![index].docId);
                                                final int staffId = (snapshot
                                                    .data![index].staffId);
                                                final String dTitle = (snapshot
                                                    .data![index].docTitle);
                                                final int tNo = (snapshot
                                                    .data![index].tokenNo);
                                                final String aptExcecutive =
                                                    (snapshot
                                                        .data![index].userName);

                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            AppointmentDetails(
                                                                userName,
                                                                aptId,
                                                                staffId,
                                                                docId,
                                                                dTitle,
                                                                tNo,
                                                                aptExcecutive

                                                                // (snapshot
                                                                //     .data![index].aptExecutive),
                                                                )));
                                              },
                                              icon: const Icon(Icons
                                                  .keyboard_arrow_right_sharp)),
                                        ]))),
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
    final apmnt = await AppointmentController.aptDate(query);
    print("========" + '$apmnt');

    if (!mounted) return;
    setState(() {
      this.query = query;
      this.apmnt = apmnt;
    });
  }

  Widget buildAptDate() => dateSearch(
        text: query,
        onChanged: searchAptDate,
        hintText: 'Date',
      );

  Widget builappointment(Appointment apt) => Expanded(
        child: Container(
          height: 70,
          child: Card(
            elevation: 3,
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AppointmentDetails(
                            this.userName,
                            (apt.aptId),
                            apt.staffId,
                            apt.docId,
                            apt.docTitle,
                            apt.tokenNo,
                            apt.userName)));
              },
              title: AutoSizeText(
                apt.docTitle,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: AutoSizeText(
                apt.tokenNo.toString(),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AutoSizeText(
                    apt.partyType,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppointmentDetails(
                                    this.userName,
                                    (apt.aptId),
                                    apt.staffId,
                                    apt.docId,
                                    apt.docTitle,
                                    apt.tokenNo,
                                    apt.userName)));
                      },
                      icon: const Icon(Icons.keyboard_arrow_right_sharp)),
                ],
              ),
            ),
          ),
        ),
      );
}
