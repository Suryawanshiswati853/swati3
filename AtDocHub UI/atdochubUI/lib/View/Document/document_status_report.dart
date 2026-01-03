import 'package:AtDocHUB/Controller/ActivityController.dart';
import 'package:AtDocHUB/Model/Activity.dart';
import 'package:AtDocHUB/View/Document/searchDocStatus.dart';
import 'package:flutter/material.dart';
import 'package:AtDocHUB/Controller/DocumentController.dart';
import 'package:AtDocHUB/Model/Document.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DocumentStatusReport extends StatefulWidget {
  final int docId;

  DocumentStatusReport(this.docId);

  @override
  _DocumentStatusReportState createState() =>
      _DocumentStatusReportState(this.docId);
}

class _DocumentStatusReportState extends State<DocumentStatusReport> {
  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  DocumentController documentController = Get.put(DocumentController());

  ActivityController activityController = Get.put(ActivityController());

  late Future<Document> futureDocuments;
  final int docId;

  late Future<List<Activity>> futureActivity;
  List<Document> docs = [];
  List<Activity> actId = [];
  List<Activity> acts = [];

  final int id1 = 101;
  final int id2 = 102;
  final int id3 = 103;

  final int id4 = 104;

  final int id5 = 105;

  final int id6 = 106;

  final int id7 = 107;

  final int id8 = 108;

  final int id9 = 109;

  int status = 0;

  int activity_id = 0;

  // void checked(){
  //   for(int i=0;i<=acts.length;i++){
  //     if(acts[i].activityId=id1)
  //   }
  // }

  _DocumentStatusReportState(this.docId);

  late bool checkbox1 = false;

  late bool checkbox2 = false;
  late bool checkbox3 = false;
  late bool checkbox4 = false;
  late bool checkbox5 = false;
  late bool checkbox6 = false;
  late bool checkbox7 = false;
  late bool checkbox8 = false;
  late bool checkbox9 = false;

  //  void isChecked() {
  //   for (int i = 0; i < acts.length; i++) {
  //     this.activity_id = acts[i].activityId;
  //     this.status = acts[i].status;

  //     if (this.activity_id == 101) {
  //       if (checkbox1 = true) {
  //         setState(() {
  //           this.status = 1;
  //         });
  //       } else {
  //         setState(() {
  //           this.status = 0;
  //         });
  //       }
  //     }

  @override
  void initState() {
    super.initState();
    futureActivity = ActivityController.fetchActivity(this.docId);
    futureDocuments = DocumentController.fetchDocumentsByID(this.docId);
    init();
  }

  Future init() async {
    final acts = await ActivityController.fetchActivity(this.docId);
    // ignore: unused_local_variable
    final docs = await DocumentController.fetchDocumentsByID(this.docId);
    // final update = await ActivityController.updateActivity(this.docId);
    setState(() {
      this.acts = acts;
      //this.docs = docs as List<Document>;

      for (int i = 0; i < acts.length; i++) {
        this.activity_id = acts[i].activityId;
        this.status = acts[i].status;
        print('id======= ${this.activity_id}');
        //  for(this.docId){

        //////////// Activity 1 ////////////////////////
        if (this.activity_id == 101 && this.status == 1) {
          setState(() {
            checkbox1 = true;
          });
        }
        // else if (checkbox1 = true) {
        //   setState(() {
        //     this.status = 1;
        //   });
        // } else {
        //   setState(() {
        //     this.status = 0;
        //   });
        // }
//////////////// Activity 2 ///////////////////
        if (this.activity_id == 102 && this.status == 1) {
          setState(() {
            checkbox2 = true;
          });
        }

//////////////// Activity 3 ///////////////////

        if (this.activity_id == 103 && this.status == 1) {
          setState(() {
            checkbox3 = true;
          });
        }
        //////////////// Activity 4 ///////////////////

        if (this.activity_id == 104 && this.status == 1) {
          setState(() {
            checkbox4 = true;
          });
        }
        //////////////// Activity 5 ///////////////////

        if (this.activity_id == 105 && this.status == 1) {
          setState(() {
            checkbox5 = true;
          });
        }
        //////////////// Activity 6 ///////////////////

        if (this.activity_id == 106 && this.status == 1) {
          setState(() {
            checkbox6 = true;
          });
        }
        //////////////// Activity 7 ///////////////////

        if (this.activity_id == 107 && this.status == 1) {
          setState(() {
            checkbox7 = true;
          });
        }
        //////////////// Activity 8 ///////////////////

        if (this.activity_id == 108 && this.status == 1) {
          setState(() {
            checkbox8 = true;
          });
        }
        //////////////// Activity 9 ///////////////////

        if (this.activity_id == 109 && this.status == 1) {
          setState(() {
            checkbox9 = true;
          });
        }
      }
      //this.activity_id = [...acts];
      //this.status = [...acts.status];
    });
  }

// THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  // final TextEditingController texttitle = TextEditingController();

// Initial step set to 5.
  //int activeStep = 0;

// upperBound MUST BE total number of icons minus 1.
  // int upperBound = 13;

//Logic for checkboxs. Needs a revist.

  // _loadswitchValue() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     checkbox1 = (prefs.getBool('Draft sent')) ?? false;
  //     checkbox2 = (prefs.getBool('Draft Approval')) ?? false;
  //     checkbox3 = (prefs.getBool('Appintment Scheduled')) ?? false;
  //     checkbox4 = (prefs.getBool('Appointment Excecution Done')) ?? false;
  //     checkbox5 = (prefs.getBool('Charges Collected')) ?? false;
  //     checkbox6 = (prefs.getBool('Challan Paid')) ?? false;
  //     checkbox7 = (prefs.getBool('Document Submitted')) ?? false;
  //     checkbox8 = (prefs.getBool('Document Registered')) ?? false;
  //     checkbox9 = (prefs.getBool('Document Sent')) ?? false;
  //   });
  // }

  // _savenswitchValue() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     prefs.setBool('Draft sent', checkbox1);
  //     prefs.setBool('Draft Approval', checkbox2);
  //     prefs.setBool('Appintment Scheduled', checkbox3);
  //     prefs.setBool('Appointment Excecution Done', checkbox4);
  //     prefs.setBool('Charges Collected', checkbox5);
  //     prefs.setBool('Challan Paid', checkbox6);
  //     prefs.setBool('Document Submitted', checkbox7);
  //     prefs.setBool('Document Registered', checkbox8);
  //     prefs.setBool('Document Sent', checkbox9);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: BackButtonIcon(),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SearchDocStatus()))),
              // ignore: deprecated_member_use
              brightness: Brightness.light,
              elevation: 10,
              centerTitle: true,
              title: Text("Document Status Report",
                  style: TextStyle(
                    color: Colors.white,
                    decorationStyle: TextDecorationStyle.double,
                  )),
              backgroundColor: Color.fromARGB(255, 3, 87, 156),
            ),
            body: Center(
              child: SingleChildScrollView(
                  child: FutureBuilder<List<Activity>>(
                      future: futureActivity,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder<Document>(
                                    future: futureDocuments,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              " " + snapshot.data!.docTitle,
                                              style: const TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold)),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text('${snapshot.error}');
                                      }

                                      // By default, show a loading spinner.
                                      return const CircularProgressIndicator();
                                    }),
                                // Container(
                                //   height: 40,
                                //   child: ListView.builder(
                                //       itemCount: docs.length,
                                //       itemBuilder: (context, index) {
                                //         return Text('${docs[index].docTitle}');
                                //       }),
                                // ),

                                CheckboxListTile(
                                  title: Text('Draft Sent'),
                                  value: checkbox1,
                                  onChanged: (bool? value) => setState(() {
                                    checkbox1 = value!;
                                    print(checkbox1);
                                    print(value);
                                    if (checkbox1 == true) {
                                      this.status = 1;
                                    } else {
                                      this.status = 0;
                                    }
                                    print(status);
                                    updateActivity(
                                        this.docId, 101, this.status);
                                    // ActivityController.updateActivity(
                                    //     this.docId, 101, checkbox1 ? 1 : 0);

                                    // if (checkbox1 = true) {
                                    //   setState(() {
                                    //     this.status = 1;
                                    //     print(checkbox1);
                                    //   });
                                    // } else if (checkbox1 = false) {
                                    //   setState(() {
                                    //     this.status = 0;
                                    //     print(checkbox1);
                                    //   });

                                    //print("clicked!");

                                    //  var id = acts[0].activityId;
                                    //   var status = acts[0].status;

                                    // if (checkbox1 == true) {
                                    //   setState(() {
                                    //     acts[0].status = 1;
                                    //   });
                                    // } else {
                                    //   acts[0].status = 0;
                                    // }

                                    // if (){

                                    //     //_savenswitchValue();

                                    // }
                                  }),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor:
                                      Color.fromARGB(255, 15, 111, 221),
                                ),
                                SizedBox(height: 20),
                                CheckboxListTile(
                                  title: Text('Draft Approval'),
                                  value: checkbox2,
                                  onChanged: (bool? value) => setState(() {
                                    checkbox2 = value!;
                                    if (checkbox2 == true) {
                                      this.status = 1;
                                    } else {
                                      this.status = 0;
                                    }
                                    print(status);
                                    updateActivity(
                                        this.docId, 102, this.status);
                                    // _savenswitchValue();
                                  }),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor:
                                      Color.fromARGB(255, 15, 111, 221),
                                ),
                                SizedBox(height: 20),
                                CheckboxListTile(
                                  title: Text('Appointment Scheduled'),
                                  value: checkbox3,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkbox3 = value!;
                                      if (checkbox3 == true) {
                                        this.status = 1;
                                      } else {
                                        this.status = 0;
                                      }
                                      print(status);
                                      updateActivity(
                                          this.docId, 103, this.status);
                                      //_savenswitchValue();
                                    });
                                  },
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor:
                                      Color.fromARGB(255, 15, 111, 221),
                                ),
                                SizedBox(height: 20),
                                CheckboxListTile(
                                  title: Text('Appointment Excecution Done'),
                                  value: checkbox4,
                                  onChanged: (bool? value) => setState(() {
                                    checkbox4 = value!;
                                    if (checkbox4 == true) {
                                      this.status = 1;
                                    } else {
                                      this.status = 0;
                                    }
                                    print(status);
                                    updateActivity(
                                        this.docId, 104, this.status);
                                    //_savenswitchValue();
                                  }),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor:
                                      Color.fromARGB(255, 15, 111, 221),
                                ),
                                SizedBox(height: 20),
                                CheckboxListTile(
                                  title: Text('Charges Collected'),
                                  value: checkbox5,
                                  onChanged: (bool? value) => setState(() {
                                    checkbox5 = value!;
                                    if (checkbox5 == true) {
                                      this.status = 1;
                                    } else {
                                      this.status = 0;
                                    }
                                    print(status);
                                    updateActivity(
                                        this.docId, 105, this.status);
                                    //_savenswitchValue();
                                  }),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor:
                                      Color.fromARGB(255, 15, 111, 221),
                                ),
                                SizedBox(height: 20),
                                CheckboxListTile(
                                  title: Text('Challan Paid'),
                                  value: checkbox6,
                                  onChanged: (bool? value) => setState(() {
                                    checkbox6 = value!;
                                    if (checkbox6 == true) {
                                      this.status = 1;
                                    } else {
                                      this.status = 0;
                                    }
                                    print(status);
                                    updateActivity(
                                        this.docId, 106, this.status);
                                    //_savenswitchValue();
                                  }),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor:
                                      Color.fromARGB(255, 15, 111, 221),
                                ),
                                SizedBox(height: 20),
                                CheckboxListTile(
                                  title: Text('Document Submitted'),
                                  value: checkbox7,
                                  onChanged: (bool? value) => setState(() {
                                    checkbox7 = value!;
                                    if (checkbox7 == true) {
                                      this.status = 1;
                                    } else {
                                      this.status = 0;
                                    }
                                    print(status);
                                    updateActivity(
                                        this.docId, 107, this.status);
                                    //_savenswitchValue();
                                  }),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor:
                                      Color.fromARGB(255, 15, 111, 221),
                                ),
                                SizedBox(height: 20),
                                CheckboxListTile(
                                  title: Text('Document Registered'),
                                  value: checkbox8,
                                  onChanged: (bool? value) => setState(() {
                                    checkbox8 = value!;
                                    if (checkbox8 == true) {
                                      this.status = 1;
                                    } else {
                                      this.status = 0;
                                    }
                                    print(status);
                                    updateActivity(
                                        this.docId, 108, this.status);
                                    // _savenswitchValue();
                                  }),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  activeColor:
                                      Color.fromARGB(255, 15, 111, 221),
                                ),
                                SizedBox(height: 20),
                                CheckboxListTile(
                                    title: Text('Document Sent'),
                                    value: checkbox9,
                                    onChanged: (bool? value) => setState(() {
                                          checkbox9 = value!;
                                          if (checkbox9 == true) {
                                            this.status = 1;
                                          } else {
                                            this.status = 0;
                                          }
                                          print(status);
                                          updateActivity(
                                              this.docId, 109, this.status);
                                          // _savenswitchValue();
                                        }),
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    activeColor:
                                        Color.fromARGB(255, 15, 111, 221))
                              ]);
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      })),
            )));

    //             Text("Token No : " + snapshot.data!.tokenNo,
    //                 style: const TextStyle(fontSize: 5.0)),
    //             SizedBox(
    //               height: 20,
    //             ),

    // SizedBox(height: 20),

    //  [
    //   IconStepper(
    //     icons: [
    //       Icon(Icons.task),
    //       Icon(Icons.alarm),
    //       Icon(Icons.flag),
    //     ],

    //     // activeStep property set to activeStep variable defined above.
    //     activeStep: activeStep,

    //     // This ensures step-tapping updates the activeStep.
    //     onStepReached: (index) {
    //       setState(() {
    //         activeStep = index;
    //       });
    //     },
  }

  Widget builddoc(Document doc) => Card(
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
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => DocumentStatusReport((doc.docId))));
          },
        ),
      );
}
