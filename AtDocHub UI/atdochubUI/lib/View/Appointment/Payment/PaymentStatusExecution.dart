import 'package:AtDocHUB/Controller/AppointmentController.dart';
import 'package:AtDocHUB/Controller/DocumentController.dart';

import 'package:AtDocHUB/Model/Appointment.dart';
import 'package:AtDocHUB/Model/Document.dart';
import 'package:AtDocHUB/View/Activity/ActivityStatusPage.dart';
import 'package:AtDocHUB/View/Appointment/Payment/PaymentStatusDetails.dart';
import 'package:AtDocHUB/View/AppointmentPageFE.dart';
import 'package:AtDocHUB/View/homePageAdmin.dart';

//import 'package:AtDocHUB/View/Document/PaymentStatusDetailPage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class PaymentStatusExecution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AtDocHub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> pages = [
    homePageAdmin(),
    //DocumentsPage(),
    AppointmentPageFE(),
    ActivityStatusPage(),
  ];
  int selectedPageIndex = 0;

  // void selectPage(int index) {
  //   setState(() {
  //     selectedPageIndex = index;
  //   });
  // }

  final _formKey = GlobalKey<FormState>();
  final minimumPadding = 2.0;
  int _selectedIndex = 0;

  final TextEditingController texttitle = TextEditingController();

  //DocumentController documentController = Get.put(DocumentController());
  AppointmentController appointmentController =
      Get.put(AppointmentController());
  TextEditingController dateinput = TextEditingController();
  //late Future<List<Document>> futureDocuments;
  late Future<List<Appointment>> futureAppointments;
//var futureDocs; //call for search bar
  //late Future<List<Document>> futureDocs;
//call for list of documents
  late Future<List<Appointment>> futureapt;
  @override
  void initState() {
    super.initState();
    dateinput.text = "";
    //set the initial value of text field
    futureAppointments = AppointmentController
        .fetchSearchAppointmentList(); //call for search bar
    futureapt = AppointmentController
        .fetchAppointmentList(); //call for list of documents
  }

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
                builder: (BuildContext context) => ActivityStatusPage()))),
      ),
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 80, 0, 0),
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: FutureBuilder<List<Appointment>>(
                future: futureapt,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Card(
                              child: ListTile(
                                title: Text(
                                  snapshot.data![index].city,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  snapshot.data![index].aptPlace,
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${snapshot.data![index].feesCollected}',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    const Icon(
                                        Icons.keyboard_arrow_right_sharp),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PaymentStatusDetailsPage((snapshot
                                                  .data![index]
                                                  .aptId) as int)));
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
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              decoration: BoxDecoration(),
              height: 73,
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
                    title: Text(user.aptPlace),
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

                  this.texttitle.text = user.aptTime;
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          PaymentStatusDetailsPage(user.aptId)));
                },
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
