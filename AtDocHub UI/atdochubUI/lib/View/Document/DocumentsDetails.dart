import 'package:AtDocHUB/View/AppointmentPageFE.dart';
import 'package:AtDocHUB/View/Activity/ActivityStatusPage.dart';
import 'package:AtDocHUB/View/homePageAdmin.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'DocumentDetailEditPage.dart';
import './DocumentPage.dart';
import 'package:AtDocHUB/Controller/DocumentController.dart';

import 'package:get/get.dart';

import 'package:AtDocHUB/Model/Document.dart';
import 'package:flutter/material.dart';
import 'DocumentPage.dart';
import 'package:AtDocHUB/View/AppointmentPageFE.dart';
import 'package:AtDocHUB/View/Activity/ActivityStatusPage.dart';
import 'package:AtDocHUB/View/homePageAdmin.dart';

import 'DocumentDetailEditPage.dart';
import './DocumentPage.dart';
import 'package:AtDocHUB/Controller/DocumentController.dart';

import 'package:get/get.dart';

import 'package:AtDocHUB/Model/Document.dart';
import 'package:flutter/material.dart';
import 'DocumentPage.dart';

class DocumentsDetails extends StatefulWidget {
  final int docId;

  DocumentsDetails(this.docId);

  @override
  _DocumentsDetailsState createState() => _DocumentsDetailsState(this.docId);
}

class _DocumentsDetailsState extends State<DocumentsDetails> {
  DocumentController documentController = Get.put(DocumentController());

//  print(formatted);
  late Future<Document> futureDocuments;
  final int docId;
  // String startDate = Date(json.toString(startDate)) as String;
  _DocumentsDetailsState(this.docId);

  @override
  void initState() {
    super.initState();
    // futureDocuments = documentController
    //     .fetchDocumentsByTitle('Skyone Building, Flat no 101');
    // futureDocuments = documentController.fetchDocumentsByID(docId);
    futureDocuments = DocumentController.fetchDocumentsByID(this.docId);
  }

  //  Widget buildDate(Document docDate) => Card(
  //       child: ListTile(
  //         title: Text(
  //           docDate.startDate,
  //           style: const TextStyle(
  //             fontSize: 12.0,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 87, 156),
        title: Text('Document Details'),
        leading: IconButton(
            icon: BackButtonIcon(),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => DocumentPage()))),
      ),

      //  flexibleSpace: LogOut(),

      // appBar: AppBar(
      // title: const Text('DocumentDetails'),
      // automaticallyImplyLeading: false,
      // leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: Colors.white),
      //     onPressed: () {
      //       Navigator.of(context).pushAndRemoveUntil(
      //           MaterialPageRoute(
      //               builder: (BuildContext context) =>
      //                    DocumentsPage()),
      //           (Route<dynamic> route) => false);
      //     }),

      body: SafeArea(
        child: SelectionArea(
          child: Center(
            child: FutureBuilder<Document>(
              future: futureDocuments,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(children: [
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(30),
                        height: 600,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                                "Document Title : " + snapshot.data!.docTitle,
                                style: const TextStyle(
                                  fontSize: 15.0,
                                )),
                            AutoSizeText(
                                "Token No : " +
                                    snapshot.data!.tokenNo.toString(),
                                style: const TextStyle(fontSize: 15.0)),
                            AutoSizeText(
                                "Party Name : " + snapshot.data!.partyName,
                                style: const TextStyle(fontSize: 15.0)),
                            AutoSizeText("Address : " + snapshot.data!.address,
                                style: const TextStyle(fontSize: 15.0)),
                            AutoSizeText("City : " + snapshot.data!.city,
                                style: const TextStyle(fontSize: 15.0)),
                            AutoSizeText("Pin Code : " + snapshot.data!.pinCode,
                                style: const TextStyle(fontSize: 15.0)),
                            AutoSizeText(
                                "Duration : " + snapshot.data!.duration,
                                style: const TextStyle(fontSize: 15.0)),
                            AutoSizeText(
                                "Document Type : " + snapshot.data!.docType,
                                style: const TextStyle(fontSize: 15.0)),

                            AutoSizeText(
                                "Document Status : " + snapshot.data!.docStatus,
                                style: const TextStyle(fontSize: 15.0)),
                            AutoSizeText(
                                "Start Date : " + snapshot.data!.startDate,
                                style: const TextStyle(fontSize: 15.0)),
                            AutoSizeText("End Date : " + snapshot.data!.endDate,
                                style: const TextStyle(fontSize: 15.0)),

                            AutoSizeText(
                                "Rent Description : " + snapshot.data!.rentDesc,
                                style: const TextStyle(fontSize: 15.0)),
                            // FittedBox(
                            //   child: Row(
                            //     children: [
                            //       SizedBox(
                            //         width: 70,
                            //       ),
                            Container(
                              alignment: Alignment.center,
                              height: 35,
                              margin: EdgeInsets.symmetric(
                                horizontal: 100.0,
                              ),
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 3, 89, 168),
                              ),
                              child: TextButton(
                                // style:
                                //     TextButton.styleFrom(fixedSize: Size.fromHeight(300)),
                                child: const Text(
                                  'Edit ',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    backgroundColor:
                                        Color.fromARGB(255, 3, 89, 168),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              DocumentDetialEditPage(
                                                  this.docId)),
                                      (Route<dynamic> route) => false);
                                },
                              ),
                            ),
                          ],
                        ),
                        //),
                        //]),
                      ),
                      padding: const EdgeInsets.all(10),
                    ),
                  ]);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}


// class DocumentsDetails extends StatefulWidget {
//   final int docId;

//   DocumentsDetails(this.docId);

//   @override
//   _DocumentsDetailsState createState() => _DocumentsDetailsState(this.docId);
// }

// class _DocumentsDetailsState extends State<DocumentsDetails> {
//   TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

//   DocumentController documentController = Get.put(DocumentController());

//   late Future<Document> futureDocuments;
//   final int docId;
//   _DocumentsDetailsState(this.docId);

//   @override
//   void initState() {
//     super.initState();
//     futureDocuments = documentController.fetchDocumentsByID(this.docId);
//     print(futureDocuments);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ButtonStyle flatButtonStyle = TextButton.styleFrom(
//       primary: Color.fromARGB(255, 3, 87, 156),
//       minimumSize: Size(30, 15),
//       padding: EdgeInsets.symmetric(horizontal: 16.0),
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(2.0)),
//       ),
//     );

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 3, 87, 156),
//         title: Text('Document Details'),
//         leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () {
//               Navigator.of(context).pushAndRemoveUntil(
//                   MaterialPageRoute(
//                       builder: (BuildContext context) => DocumentPage()),
//                   (Route<dynamic> route) => false);
//             }),
//       ),
//       body: Center(
//         child: FutureBuilder<Document>(
//           future: futureDocuments,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView(children: [
//                 SingleChildScrollView(
//                   child: FittedBox(
//                     child: Container(
//                       padding: EdgeInsets.all(5),
//                       child: Center(
//                         child: Padding(
//                           padding: const EdgeInsets.all(5),
//                           child: Column(
//                               //mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                     "Document Title : " +
//                                         snapshot.data!.docTitle,
//                                     style: const TextStyle(fontSize: 3.0)),
//                                 SizedBox(
//                                   height: 5,
//                                 ),

//                                 Text("Token No : " + snapshot.data!.tokenNo,
//                                     style: const TextStyle(fontSize: 3.0)),
//                                 SizedBox(
//                                   height: 5,
//                                 ),

//                                 Text(
//                                     "Duration : " +
//                                         snapshot.data!.duration.toString(),
//                                     style: const TextStyle(fontSize: 3.0)),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 // Text(
//                                 //     "Created At : " +
//                                 //         snapshot.data!.createdAt.toIso8601String(),
//                                 //     style: const TextStyle(fontSize: 15.0)),
//                                 // Text(
//                                 //     "Created By : " +
//                                 //         snapshot.data!.startDate.toIso8601String(),
//                                 //     style: const TextStyle(fontSize: 15.0)),
//                                 // Text(
//                                 //     "End Date : " +
//                                 //         snapshot.data!.endDate.toIso8601String(),
//                                 //     style: const TextStyle(fontSize: 15.0)),
//                                 // Text(
//                                 //     "Updtaed At : " +
//                                 //         snapshot.data!.updatedAt.toIso8601String(),
//                                 //     style: const TextStyle(fontSize: 15.0)),
//                                 Text(
//                                     "Document Type : " + snapshot.data!.docType,
//                                     style: const TextStyle(fontSize: 3.0)),
//                                 SizedBox(
//                                   height: 5,
//                                 ),

//                                 Text("Address : " + snapshot.data!.address,
//                                     style: const TextStyle(fontSize: 3.0)),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text("City : " + snapshot.data!.city,
//                                     style: const TextStyle(fontSize: 3.0)),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                     "Party Name : " +
//                                         snapshot.data!.partyName.toString(),
//                                     style: const TextStyle(fontSize: 3.0)),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                     "Pin Code : " +
//                                         snapshot.data!.pinCode.toString(),
//                                     style: const TextStyle(fontSize: 3.0)),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                     "Start Date : " +
//                                         snapshot.data!.startDate.toString(),
//                                     style: const TextStyle(fontSize: 3.0)),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                     "End Date : " +
//                                         snapshot.data!.endDate.toString(),
//                                     style: const TextStyle(fontSize: 3.0)),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                     "Document Status : " +
//                                         snapshot.data!.docStatus,
//                                     style: const TextStyle(fontSize: 3.0)),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                     "Rent Description : " +
//                                         snapshot.data!.rentDesc,
//                                     style: const TextStyle(fontSize: 3.0)),
//                                 SizedBox(
//                                   height: 5,
//                                 ),

//                                 Row(
//                                   children: [
//                                     SizedBox(
//                                       width: 15,
//                                     ),
//                                     Container(
//                                       height: 15,
//                                       width: 45,
//                                       child: MaterialButton(
//                                         shape: new RoundedRectangleBorder(
//                                             borderRadius:
//                                                 new BorderRadius.circular(8)),
//                                         color: Color.fromARGB(255, 3, 89, 168),
//                                         minWidth:
//                                             MediaQuery.of(context).size.width /
//                                                 5,
//                                         // padding: const EdgeInsets.fromLTRB(
//                                         //     20.0, 15.0, 20.0,  15.0),
//                                         onPressed: () {
//                                           Navigator.of(context).push(
//                                               MaterialPageRoute(
//                                                   builder: (_) =>
//                                                       DocumentDetialEditPage(
//                                                           docId)));
//                                         },
//                                         child: Text("Edit",
//                                             textAlign: TextAlign.center,
//                                             style: style.copyWith(
//                                               color: Colors.white,
//                                               //fontWeight: FontWeight.bold,
//                                               fontSize: 5,
//                                             )),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ]);
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             }

//             // By default, show a loading spinner.
//             return const CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }
