import 'package:AtDocHUB/Controller/ActivityController.dart';
import 'package:AtDocHUB/Controller/DocumentController.dart';
import 'package:AtDocHUB/Model/Activity.dart';
import 'package:AtDocHUB/Model/ActivityCount.dart';
import 'package:AtDocHUB/Model/Document.dart';

import 'package:AtDocHUB/Notification/NotificationPage.dart';
import 'package:AtDocHUB/View/AppointmentPageFE.dart';
import 'package:AtDocHUB/View/Activity/ActivityStatusPage.dart';
import 'package:AtDocHUB/View/Document/DocumentPage.dart';
import 'package:AtDocHUB/View/Document/document_status_report.dart';
import 'package:AtDocHUB/View/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class homePageAdmin extends StatefulWidget {
  @override
  State<homePageAdmin> createState() => _homePageAdminState();
}

class _homePageAdminState extends State<homePageAdmin> {
  List<Activity> activity = [];
  List<ActivityCount> acts = [];

  int count = 0;

  int activity_id = 0;

  ActivityController activityController = Get.put(ActivityController());

  late Future<ActivityCount> futureActivity;
  String t1 = '0';
  String t2 = '0';
  String t3 = '0';
  String t4 = '0';
  String t5 = '0';
  String t6 = '0';
  String t7 = '0';
  String t8 = '0';
  String t9 = '0';

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final acts = await ActivityController.userDashboard();
    setState(() => this.acts = acts);
    for (int i = 0; i < acts.length; i++) {
      this.activity_id = acts[i].activityId;
      this.count = acts[i].count;
      if (this.activity_id == 101) {
        setState(() {
          t1 = this.count.toString();
        });
      }
      print(t1);
      if (this.activity_id == 102) {
        setState(() {
          t2 = this.count.toString();
        });
      }
      print(t2);
      if (this.activity_id == 103) {
        setState(() {
          t3 = this.count.toString();
        });
      }
      print(t3);
      if (this.activity_id == 104) {
        setState(() {
          t4 = this.count.toString();
        });
      }
      print(t4);
      if (this.activity_id == 105) {
        setState(() {
          t5 = this.count.toString();
        });
      }
      if (this.activity_id == 106) {
        setState(() {
          t6 = this.count.toString();
        });
      }
      print(t6);
      if (this.activity_id == 107) {
        setState(() {
          t7 = this.count.toString();
        });
      }
      print(t7);
      if (this.activity_id == 108) {
        setState(() {
          t8 = this.count.toString();
        });
      }
      print(t8);
      if (this.activity_id == 109) {
        setState(() {
          t9 = this.count.toString();
        });
      }
      print(t9);
    }
  }

  void getDocID() {
    for (int i = 0; i <= acts.length; i++) {}
  }

  final TextEditingController typeaheadTitle = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  late final int docId;

  Widget build(BuildContext context) {
//Widget NotifyIt()=> NotificationPage();

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          title: Text('AtDocHub'),
          leading: IconButton(
              icon: BackButtonIcon(),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage()))),
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
                        //
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                homePageAdmin()));
                      }
                      //}
                      //  }
                      //},
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
        body: SingleChildScrollView(
            child: Column(children: [
          FittedBox(
            child: Row(children: [
              Container(
                child: Column(
                  children: [
                    Icon(Icons.person),
                    Text(
                      'Admin / Support',
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
                //width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    FittedBox(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AdminNotification()));
                        },
                        child: Icon(
                          Icons.notifications,
                          color: Colors.black,
                        ),
                        // style: TextStyle(
                        //     fontSize: 12, fontWeight: FontWeight.bold))),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
          Row(children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                // width: 10,
                padding: EdgeInsets.all(16),
                child: TypeAheadField<Document>(
                  hideSuggestionsOnKeyboardHide: true,
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 233, 246, 252),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: GestureDetector(
                        child: Icon(
                          Icons.close,
                          color: Colors.black54,
                          size: 20,
                        ),
                        onTap: () {
                          typeaheadTitle.clear();
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Document Title or Token No ',
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                    controller: this.typeaheadTitle,
                  ),
                  suggestionsCallback: DocumentController.getdocs,
                  itemBuilder: (context, Document suggestion) {
                    final user = suggestion;

                    return ListTile(
                      title: Text(user.docTitle),
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
                  onSuggestionSelected: (Document? suggestion) {
                    final user = suggestion!;
                    this.typeaheadTitle.text = user.docTitle;

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            DocumentStatusReport(user.docId)));
                  },
                ),
              ),
            ),
          ]),
          Container(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                          elevation: 3,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width,
                            color: Color.fromARGB(255, 233, 246, 252),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    'Draft Sent Pending ',
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                // Text(
                                //   (acts[0] != null &&
                                //           (acts[0].activityId % 100 == 1))
                                //       ? '${acts[0].count}'
                                //       : 'N/A',
                                // ),
                                // Text(
                                //   (acts.length > 0 &&
                                //           (acts[0].activityId % 100 == 1))
                                //       ? '${acts[0].count}'
                                //       : 'N/A',
                                // ),

                                Text((acts.isNotEmpty) ? '$t1' : 'N/A'),

                                SizedBox(
                                  width: 5,
                                ),
                                // Text('${acts[0].count}'),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Card(
                          elevation: 3,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width,
                            color: Color.fromARGB(255, 233, 246, 252),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(child: Text('Draft Approval Pending')),
                                SizedBox(
                                  width: 40,
                                ),
                                // Text(
                                //   (acts[1] != null &&
                                //           (acts[1]!.activityId % 100 == 2))
                                //       ? '${acts[1]?.count}'
                                //       : 'N/A',
                                // ),
                                // Text(
                                //   (acts.length > 1 &&
                                //           (acts[1].activityId % 100 == 2))
                                //       ? '${acts[1].count}'
                                //       : 'N/A',
                                // ),
                                Text((acts.isNotEmpty) ? '$t2' : 'N/A'),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Card(
                          elevation: 3,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width,
                            color: Color.fromARGB(255, 233, 246, 252),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child:
                                        Text('Appointment Schedule Pending')),
                                SizedBox(
                                  width: 40,
                                ),
                                // Text(
                                //   (acts[2] != null &&
                                //           (acts[2]!.activityId % 100 == 3))
                                //       ? '${acts[2]?.count}'
                                //       : 'N/A',
                                // ),
                                Text((acts.isNotEmpty) ? '$t3' : 'N/A'),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Card(
                          elevation: 3,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width,
                            color: Color.fromARGB(255, 233, 246, 252),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child:
                                        Text('Appointment Execution Pending')),
                                SizedBox(
                                  width: 40,
                                ),
                                // Text(
                                //   (acts[3] != null &&
                                //           (acts[3]!.activityId % 100 == 4))
                                //       ? '${acts[3]?.count}'
                                //       : 'N/A',
                                // ),
                                Text((acts.isNotEmpty) ? '$t4' : 'N/A'),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Card(
                          elevation: 3,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width,
                            color: Color.fromARGB(255, 233, 246, 252),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Text('Charges Collection Pending')),
                                SizedBox(
                                  width: 40,
                                ),
                                // Text(
                                //   (acts[4] != null &&
                                //           (acts[4]!.activityId % 100 == 5))
                                //       ? '${acts[4]?.count}'
                                //       : 'N/A',
                                // ),

                                Text((acts.isNotEmpty) ? '$t5' : 'N/A'),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width,
                          color: Color.fromARGB(255, 233, 246, 252),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Text('Challan Submission Pending')),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 40,
                                    ),
                                    // Text(
                                    //   (acts[5] != null &&
                                    //           (acts[5]!.activityId % 100 == 6))
                                    //       ? '${acts[5]?.count}'
                                    //       : 'N/A',
                                    // ),
                                    Text((acts.isNotEmpty) ? '$t6' : 'N/A'),

                                    SizedBox(
                                      width: 5,
                                    ),
                                    // Text(
                                    //   '${acts[6].count}',
                                    // ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width,
                          color: Color.fromARGB(255, 233, 246, 252),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Text('Document Submission Pending')),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text((acts.isNotEmpty) ? '$t7' : 'N/A'),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width,
                          color: Color.fromARGB(255, 233, 246, 252),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child:
                                        Text('Document Registration Pending')),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text((acts.isNotEmpty) ? '$t8' : 'N/A'),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width,
                          color: Color.fromARGB(255, 233, 246, 252),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(child: Text('Document Sent Pending')),
                                SizedBox(
                                  width: 168,
                                ),
                                Text((acts.isNotEmpty) ? '$t9' : 'N/A'),
                                SizedBox(
                                  width: 5,
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ])));
  }
}
