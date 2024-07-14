import 'package:AtDocHUB/Controller/LoginController.dart';
import 'package:AtDocHUB/Model/User.dart';
import 'package:AtDocHUB/View/AppointmentPageFE.dart';
import 'package:AtDocHUB/View/BottomNavigationBar.dart';
import 'package:AtDocHUB/View/Appointment/Payment/PaymentStatusExecution.dart';
import 'package:AtDocHUB/View/Document/document_status_report.dart';
import 'package:AtDocHUB/View/Document/searchDocStatus.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../Document/DocumentPage.dart';
import '../homePageAdmin.dart';
import 'package:im_stepper/stepper.dart';

class ActivityStatusPage extends StatefulWidget {
  @override
  State<ActivityStatusPage> createState() => _ActivityStatusPageState();
}

class _ActivityStatusPageState extends State<ActivityStatusPage> {
  List<UserLogin> logs = [];
  String email = '';

  String pass = '';

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    // final logs = await LoginController.login(email, pass);
    // setState(() => this.logs = logs);
    // print(logs[0].userEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          title: Text('Activity Status'),
          //flexibleSpace: LogOut(),

          // appBar: AppBar(
          //   title: const Text('ActivityStatus'),
          //   automaticallyImplyLeading: false,
          //   // ignore: unnecessary_new
          leading: IconButton(
              icon: BackButtonIcon(),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AppointmentPageFE())))),
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(
      //         builder: (BuildContext context) => HomePage()),
      //     (Route<dynamic> route) => false);

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
                            builder: (BuildContext context) => DocumentPage()),
                        (Route<dynamic> route) => false);
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.schedule_outlined,
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
          Card(
            color: Color.fromARGB(255, 233, 246, 252),
            elevation: 5,
            child: ListTile(
              title: const AutoSizeText('Document Status Report'),
              trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchDocStatus(),
                  ),
                );
              },
            ),
          ),
          Card(
            color: Color.fromARGB(255, 233, 246, 252),
            elevation: 5,
            child: ListTile(
              title: const AutoSizeText('Payment Status Execution'),
              trailing: const Icon(Icons.keyboard_arrow_right_sharp),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentStatusExecution(),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
