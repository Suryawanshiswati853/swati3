import 'package:AtDocHUB/Controller/AppointmentController.dart';

import 'package:AtDocHUB/Model/Appointment.dart';
import 'package:AtDocHUB/View/Activity/ActivityStatusPage.dart';
import 'package:AtDocHUB/View/Appointment/Payment/PaymentStatusDetails.dart';

//import 'package:AtDocHUB/View/Document/PaymentStatusDetailPage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class PaymentStatusExecution extends StatelessWidget {
  final String userName;
  PaymentStatusExecution(this.userName);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AtDocHub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(this.userName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String userName;
  MyHomePage(this.userName);
  @override
  _MyHomePageState createState() => _MyHomePageState(this.userName);
}

class _MyHomePageState extends State<MyHomePage> {
  final String userName;
  late final String executive;
  List<Appointment> apmnt = [];
  String query = '';
  String dTitle = '';
  String token = '';
  String username = '';
  int aptid = 0;

  int selectedPageIndex = 0;
  _MyHomePageState(this.userName);

  final _formKey = GlobalKey<FormState>();
  final minimumPadding = 2.0;
  int _selectedIndex = 0;

  final TextEditingController texttitle = TextEditingController();
  final _scrollController = ScrollController();

  AppointmentController appointmentController =
      Get.put(AppointmentController());
  TextEditingController dateinput = TextEditingController();

  late Future<List<Appointment>> futureAppointments;

  late Future<List<Appointment>> futureapt;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Kindly Use Filters to search Appointment!'),
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

  Future init() async {
    final apmnt = await AppointmentController.getAptList(query);

    setState(() {
      this.apmnt = apmnt;
    });
    print(apmnt);
  }

  late int receivedpayment;
  late int totalpayment;
  late int pendingpayment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Payment Status Report'),
        backgroundColor: Color.fromARGB(255, 3, 87, 156),
        leading: IconButton(
            icon: BackButtonIcon(),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    ActivityStatusPage(this.userName)))),
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          //  Expanded(
          // child:
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(),
              height: 80,
              width: 350,
              padding: const EdgeInsets.all(12),
              child: TypeAheadField<Appointment>(
                hideSuggestionsOnKeyboardHide: true,
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.search),
                    //border: OutlineInputBorder(b),
                    hintText: 'Enter the Token/DocTitle',
                    hintStyle: TextStyle(fontSize: 10),
                  ),
                  controller: this.texttitle,
                ),
                suggestionsCallback: AppointmentController.fetchAppointments,
                itemBuilder: (context, Appointment suggestion) {
                  final user = suggestion;
                  return ListTile(
                    title: Text(user.docTitle),
                    subtitle: Text(
                      user.partyType,
                      style: TextStyle(fontSize: 12),
                    ),
                  );
                },
                noItemsFoundBuilder: (context) => Container(
                  height: 100,
                  child: const Center(
                    child: Text(
                      'No Data Found.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                onSuggestionSelected: (Appointment suggestion) {
                  final user = suggestion;
                  // totalpayment = user.totalFees;
                  // receivedpayment = user.feesCollected;
                  // pendingpayment = totalpayment - receivedpayment;

                  this.texttitle.text = user.docTitle;
                  final int aptId = user.aptId;
                  final int staffid = user.staffId;
                  final int docid = user.docId;
                  dTitle = user.docTitle;
                  final int tokenNo = user.tokenNo;

                  final String aptExcecutive = user.userName;
                  setState(() {
                    // totalpayment = user.totalFees;
                    // receivedpayment = user.feesCollected;
                    // pendingpayment = totalpayment - receivedpayment;

                    this.executive = aptExcecutive;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PaymentStatusDetails(
                            this.userName,
                            aptId,
                            staffid,
                            docid,
                            dTitle,
                            tokenNo,
                            aptExcecutive,
                          )));
                },
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 400,
            child: Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: apmnt.length,
                itemBuilder: (context, index) {
                  final apt = apmnt[index];
                  receivedpayment = apmnt[index].feesCollected;
                  totalpayment = apmnt[index].totalFees;
                  pendingpayment = totalpayment - receivedpayment;
                  print('$pendingpayment');

                  print(apt);
                  return builappointment(apt);
                },
              ),
            ),
          ),
        ]),
        // ]),
      ),
    );
  }

  Widget builappointment(Appointment apt) => Expanded(
        child: Container(
          //height: 400,

          child: Card(
            elevation: 3,
            child: ListTile(
              // leading: Icon(Icons.document_scanner_sharp),
              title: Text(
                apt.docTitle,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                apt.tokenNo.toString(),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    //apt.feesCollected.toString(),
                    pendingpayment.toString(),

                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Icon(Icons.pending, color: Colors.deepPurpleAccent),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentStatusDetails(
                                    this.userName,
                                    (apt.aptId),
                                    apt.staffId,
                                    apt.docId,
                                    apt.docTitle,
                                    apt.tokenNo,
                                    apt.userName
                                    // apt.userName
                                    // this.userName,
                                    // (apt.aptId),
                                    // apt.staffId,
                                    // apt.docId,
                                    // apt.docTitle,
                                    // apt.tokenNo,
                                    // apt.userName
                                    )));
                      },
                      icon: const Icon(Icons.keyboard_arrow_right_sharp)),
                ],
              ),
            ),
          ),
        ),
      );
//       body: SafeArea(
//         child: Stack(children: [
//           SingleChildScrollView(
//             child: Container(
//               margin: const EdgeInsets.fromLTRB(0, 80, 0, 0),
//               height: MediaQuery.of(context).size.height * 1,
//               width: MediaQuery.of(context).size.width * 1,
//               child: FutureBuilder<List<Appointment>>(
//                 future: futureapt,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return ListView.builder(
//                         itemCount: snapshot.data!.length,
//                         itemBuilder: (_, index) => Card(
//                               child: ListTile(
//                                 title: Text(
//                                   snapshot.data![index].docTitle,
//                                   style: const TextStyle(
//                                     fontSize: 12.0,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 subtitle: Text(
//                                   snapshot.data![index].tokenNo.toString(),
//                                 ),
//                                 trailing: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Text(
//                                       '${snapshot.data![index].feesCollected}',
//                                       style: TextStyle(
//                                           fontSize: 12, color: Colors.grey),
//                                     ),
//                                     const Icon(
//                                         Icons.keyboard_arrow_right_sharp),
//                                   ],
//                                 ),
//                                 onTap: () {
//                                   final String dTitle =
//                                       snapshot.data![index].docTitle;
//                                   final String token =
//                                       snapshot.data![index].tokenNo.toString();

//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               PaymentStatusDetails(
//                                                   (snapshot.data![index].aptId),
//                                                   dTitle,
//                                                   token,
//                                                   this.userName)));
//                                 },
//                               ),
//                             ));
//                   } else {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                 },
//               ),
//             ),
//           ),
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Container(
//               decoration: BoxDecoration(),
//               height: 73,
//               width: 350,
//               padding: const EdgeInsets.all(12),
//               child: TypeAheadField<Appointment>(
//                 hideSuggestionsOnKeyboardHide: true,
//                 textFieldConfiguration: TextFieldConfiguration(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     prefixIcon: Icon(Icons.search),
//                     //border: OutlineInputBorder(b),
//                     hintText: 'Enter the Token/DocTitle',
//                     hintStyle: TextStyle(fontSize: 10),
//                   ),
//                   controller: this.texttitle,
//                 ),
//                 suggestionsCallback: AppointmentController.fetchAppointments,
//                 itemBuilder: (context, Appointment suggestion) {
//                   final user = suggestion;
//                   return ListTile(
//                     title: Text(user.docTitle),
//                   );
//                 },
//                 noItemsFoundBuilder: (context) => Container(
//                   height: 100,
//                   child: const Center(
//                     child: Text(
//                       'No Data Found.',
//                       style: TextStyle(fontSize: 14),
//                     ),
//                   ),
//                 ),
//                 onSuggestionSelected: (Appointment suggestion) {
//                   final user = suggestion;

//                   this.texttitle.text = user.docTitle;
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => PaymentStatusDetails(
//                         this.userName,
//     aptId,
//     staff_Id,
//     docID,
//     dTitle,
//     tNo,
//     //this.createdBY,
//     // this.doctitle,
//     // this.docToken,
//     aptExecutive,
//                           )));
//                 },
//               ),
//             ),
//           ]),
//         ]),
//       ),
//     );
//   }
}
