// import 'dart:convert';
// import 'package:AtDocHUB/Model/Appointment.dart';
// import 'package:http/http.dart' as http;

// import 'dart:async';
// import 'package:AtDocHUB/Model/Appointment.dart';

// class AppointmentController {
//   static Future<List<Appointment>> fetchAppointments(String title) async {
//     //final url = Uri.parse('http://3.108.194.111 :8080/Atdochub-3/appointment/');
//     final url = Uri.parse('http://http://3.108.194.111:8080/AtdochubJ-3/appointment/');
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final List docs = json.decode(response.body);

//       return docs.map((json) => Appointment.fromJson(json)).where((doc) {
//         final titleLower = doc.docTitle.toLowerCase();
//         final tokenLower = doc.tokenNo.toLowerCase();
//         final searchLower = title.toLowerCase();

//         return titleLower.contains(searchLower) ||
//             tokenLower.contains(searchLower);
//       }).toList();
//     } else {
//       throw Exception();
//     }
//   }

//   static Future<List<Appointment>> fetchAppointmentList() async {
//     final response = await http
//         .get(Uri.parse('http://http://3.108.194.111:8080/AtdochubJ-3/appointment/'));
//     //print(fromJson(json)).toList());
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body);
//       //.cast<Map<String, dynamic>>();

//       return parsed
//           .map<Appointment>((json) => Appointment.fromJson(json))
//           .toList();

//       //return Document.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load Document');
//     }
//   }

//   static Future<Appointment> fetchAppointmentsById(int aptId) async {
//     final response = await http.get(
//       // Uri.parse(
//       //     'http://3.108.194.111 :8080/Atdochub-3/appointment/find/${aptId}'),
//       Uri.parse(
//           'http://http://3.108.194.111:8080/AtdochubJ-3/appointment/find/${aptId}'),
//     );
//     //print(fromJson(json)).toList());

//     if (response.statusCode == 200) {
//       return Appointment.fromJson(jsonDecode(response.body[0]));
//       //final parsed = json.decode(response.body[0]);
//       // final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

//       // return parsed
//       //     .map<Appointment>((json) => Appointment.fromJson(json))
//       //     .toList();
//       //return parsed

//       // return parsed.map<Appointment>((json) => Appointment.fromJson(json))
//       //     .toList();
//     } else {
//       throw Exception('Failed to load Appointment');
//     }
//   }

//   Future<Appointment> fetchAppointmentsByTitle(String aptTitle) async {
//     final response = await http.get(
//       // Uri.parse(
//       //     'http://3.108.194.111 :8080/Atdochub-3/appointment/findbydocumenttitle/${aptTitle}'),
//       Uri.parse(
//           'http://http://3.108.194.111:8080/AtdochubJ-3/appointment/findbydocumenttitle/${aptTitle}'),
//     );
//     //print(fromJson(json)).toList());
//     if (response.statusCode == 200) {
//       // final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

//       // return parsed.map<Appointment>((json) => Appointment.fromJson(json)).toList();

//       return Appointment.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load Appointment');
//     }
//   }

//   static Future<List<Appointment>> weeklyNotification() async {
//     // final url = Uri.parse('http://3.108.194.111 :8080/Atdochub-3/document/');
//     final url = Uri.parse(
//         'http://http://3.108.194.111:8080/AtdochubJ-3/appointment/notification/');
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

//       return parsed
//           .map<Appointment>((json) => Appointment.fromJson(json))
//           .toList();

//       //return Document.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load Document');
//     }
//   }

//   static Future<List<Appointment>> getAptList(String query) async {
//     // final url = Uri.parse('http://3.108.194.111 :8080/Atdochub-3/document/');
//     final url = Uri.parse('http://http://3.108.194.111:8080/AtdochubJ-3/document/');
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final List docs = json.decode(response.body);
//       // return json.decode(response.body).toList();

//       return docs.map((json) => Appointment.fromJson(json)).where((doc) {
//         final titleLower = doc.docTitle.toLowerCase();
//         final tokenLower = doc.tokenNo.toLowerCase();
//         final searchLower = query.toLowerCase();

//         return titleLower.contains(searchLower) ||
//             tokenLower.contains(searchLower);
//       }).toList();
//     } else {
//       throw Exception();
//     }
//   }

//   static Future<List<Appointment>> aptDate(String query) async {
//     // final url = Uri.parse(
//     //     'http://3.108.194.111 :8080/Atdochub-3/document/findbystartdate?startdate=$query');
//     final url = Uri.parse(
//         'http://http://3.108.194.111:8080/AtdochubJ-3/appointment/aptdate?aptdate=$query');
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final List docs = json.decode(response.body);
//       // return json.decode(response.body).toList();

//       return docs.map((json) => Appointment.fromJson(json)).where((doc) {
//         final titleLower = doc.aptDate;
//         // final tokenLower = doc.tokenNo.toLowerCase();
//         final searchLower = query.toLowerCase();

//         return titleLower.contains(searchLower);
//         //  titleLower.contains(searchLower) ||
//         //     tokenLower.contains(searchLower);
//       }).toList();
//     } else {
//       throw Exception();
//     }
//   }

//   static Future<List<Appointment>> fetchSearchAppointmentList() async {
//     //  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     //var jsonResponse = null;

//     // final response = await http
//     //     .get(Uri.parse('http://3.108.194.111 :8080/Atdochub-3/appointment/'));
//     final response = await http
//         .get(Uri.parse('http://http://3.108.194.111:8080/AtdochubJ-3/appointment/'));
//     //print(fromJson(json)).toList());
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

//       return parsed.map<Appointment>((json) => Appointment.fromJson(json));

//       //return Document.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load Document');
//     }
//   }

//   static Future<List<Appointment>> fetchAptByTodays() async {
//     final response = await http.get(
//         Uri.parse('http://http://3.108.194.111:8080/AtdochubJ-3/appointment/todays'));
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//       // final parsed = jsonDecode(response.body) as List;
//       return parsed.map((e) => Appointment.fromJson(e)).toList();
//     } else {
//       throw Exception('Failed to load Document');
//     }
//   }

//   static Future<List<Appointment>> fetchAptByTommorow() async {
//     final response = await http.get(Uri.parse(
//         'http://http://3.108.194.111:8080/AtdochubJ-3/appointment/tommorows'));
//     if (response.statusCode == 200) {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

//       return parsed
//           .map<Appointment>((json) => Appointment.fromJson(json))
//           .toList();
//     } else {
//       throw Exception('Failed to load Document');
//     }
//   }
// }

// Future<Appointment> createAppointment(
//     // int aptId,
//     //int docId,
//     int staffId,
//     String docTitle,
//     String tokenNo,
//     String partyName,
//     String partyType,
//     String aptPlace,
//     String city,
//     int feesCollected,
//     int totalFees,
//     String paymentMode,
//     String aptDate,
//     String aptTime,
//     String aptExecutive,
//     String aptStatus,
//     String contactNo,
//     String comments) async {
//   final response = await http.post(
//       //Uri.parse('http://3.108.194.111 :8080/Atdochub-3/appointment/register'),
//       Uri.parse('http://http://3.108.194.111:8080/AtdochubJ-3/appointment/register'),
//       headers: {
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, dynamic>{
//         // 'aptId': aptId,
//         // 'docId': docId,
//         'staffId': staffId,
//         'docTitle': docTitle,
//         'tokenNo': tokenNo,
//         'partyName': partyName,
//         'partyType': partyType,
//         'aptPlace': aptPlace,
//         'city': city,
//         'feesCollected': feesCollected,
//         'totalFees': totalFees,
//         'paymentMode': paymentMode,
//         'aptDate': aptDate,
//         'aptTime': aptTime,
//         'aptExecutive': aptExecutive,
//         'aptStatus': aptStatus,
//         'contactNo': contactNo,
//         'comments': comments,
//       }));

//   if (response.statusCode == 201) {
//     return Appointment.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception(' Failed To Create Appointment');
//   }
// }

// Future<Appointment> fetchAppointment(aptId) async {
//   final response = await http.get(
//     //Uri.parse('http://3.108.194.111 :8080/Atdochub-3/appointment/find/156'),
//     Uri.parse(
//         'http://http://3.108.194.111:8080/AtdochubJ-3/appointment/find/${aptId}'),
//   );

//   if (response.statusCode == 200) {
//     return Appointment.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load Appointment');
//   }
// }

// Future<Appointment> updateAppointment(
//   int aptId,
//   int staffId,
//   // int docId,
//   String docTitle,
//   String tokenNo,
//   String partyName,
//   String partyType,
//   String aptDate,
//   String aptTime,
//   String aptPlace,
//   String city,
//   int feesCollected,
//   int totalFees,
//   String paymentMode,
//   String aptExecutive,
//   String aptStatus,
//   String contactNo,
//   String comments,
// ) async {
//   final http.Response response = await http.put(
//     // Uri.parse('http://3.108.194.111 :8080/Atdochub-3/appointment/update'),
//     Uri.parse('http://http://3.108.194.111:8080/AtdochubJ-3/appointment/update'),
//     headers: {
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, dynamic>{
//       'aptId': aptId,
//       'staffId': staffId,
//       //  'docId': docId,
//       'docTitle': docTitle,
//       'tokenNo': tokenNo,
//       'partyName': partyName,
//       'partyType': partyType,
//       'aptDate': aptDate,
//       'aptTime': aptTime,
//       'aptPlace': aptPlace,
//       'city': city,
//       'feesCollected': feesCollected,
//       'totalFees': totalFees,
//       'paymentMode': paymentMode,
//       'aptExecutive': aptExecutive,
//       'aptStatus': aptStatus,
//       'contactNo': contactNo,
//       'comments': comments,
//     }),
//   );

//   if (response.statusCode == 201) {
//     print("response.statusCode ${'successful'}");
//     return Appointment.fromJson(jsonDecode(response.body));
//   } else {
//     print("error ${response.statusCode}");
//     throw Exception('Failed to update Appointment.');
//   }
// }

import 'dart:convert';
import 'dart:ui';
import 'package:AtDocHUB/Model/Appointment.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import 'dart:async';

class AppointmentController {
  // fetch list of appointment
  static FutureOr<Iterable<Appointment>> fetchAppointments(String title) async {
    //  final url = Uri.parse('http://192.168.0.134:8080/AtdochubJ-3/appointment/');
    final url = Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/appointment/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List docs = json.decode(response.body);

      return docs.map((json) => Appointment.fromJson(json)).where((doc) {
        final titleLower = doc.partyName.toLowerCase();
        final tokenLower = doc.partyType.toLowerCase();
        final searchLower = title.toLowerCase();

        return titleLower.contains(searchLower) ||
            tokenLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
  //list of appointment

  static Future<List<Appointment>> fetchAppointmentList() async {
    final response = await http
        .get(Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/appointment/'));
    //print(fromJson(json)).toList());
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<Appointment>((json) => Appointment.fromJson(json))
          .toList();

      //return Document.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Appointment');
    }
  }
  //fetch list of appointment by id

  static Future<Appointment> fetchAppointmentsById(aptId) async {
    final response = await http.get(
      Uri.parse(
          'http://3.108.194.111:8080/AtdochubJ-3/appointment/find/${aptId}'),
    );

    if (response.statusCode == 200) {
      return Appointment.fromJson(jsonDecode(response.body)[0]);
    } else {
      throw Exception('Failed to load Appointment');
    }
  }
  // fetch list of appointment by title

  Future<Appointment> fetchAppointmentsByTitle(String aptTitle) async {
    final response = await http.get(
      Uri.parse(
          'http://3.108.194.111:8080/AtdochubJ-3/appointment/findbydocumenttitle/${aptTitle}'),
    );

    if (response.statusCode == 200) {
      return Appointment.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Appointment');
    }
  }
  // fetch weekly notification of appointment

  static Future<List<Appointment>> weeklyNotification() async {
    final url = Uri.parse(
        'http://3.108.194.111:8080/AtdochubJ-3/appointment/notification/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<Appointment>((json) => Appointment.fromJson(json))
          .toList();

      //return Document.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Appointment');
    }
  }

  // fetch appointment list
  static Future<List<Appointment>> getAptList(String query) async {
    // final url = Uri.parse('http://192.168.0.134:8080/AtdochubJ-3/appointment/');
    final url = Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/appointment/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List docs = json.decode(response.body);
      // return json.decode(response.body).toList();

      return docs.map((json) => Appointment.fromJson(json)).where((doc) {
        final titleLower = doc.partyName.toLowerCase();
        final tokenLower = doc.partyType.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            tokenLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
  // fetch appointment by Date

  static Future<List<Appointment>> aptDate(String query) async {
    // final url = Uri.parse(
    //     'http://192.168.0.134:8080/AtdochubJ-3/appointment/findbyaptdate?aptdate=$query');
    final url = Uri.parse(
        'http://3.108.194.111:8080/AtdochubJ-3/appointment/aptdate?aptdate=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List docs = json.decode(response.body);
      // return json.decode(response.body).toList();

      return docs.map((json) => Appointment.fromJson(json)).where((doc) {
        final titleLower = doc.aptDate;
        // final tokenLower = doc.tokenNo.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
        //  titleLower.contains(searchLower) ||
        //     tokenLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<Appointment>> fetchSearchAppointmentList() async {
    // final response = await http
    //     .get(Uri.parse('http://192.168.0.134:8080/AtdochubJ-3/appointment/'));
    final response = await http
        .get(Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/appointment/'));
    //print(fromJson(json)).toList());
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Appointment>((json) => Appointment.fromJson(json));

      //return Document.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Appointment');
    }
  }
  // fetch appointment list by todays appointment rest api

  static Future<List<Appointment>> fetchAptByTodays() async {
    //final response = await http.get(
    //   Uri.parse('http://192.168.0.134:8080/AtdochubJ-3/appointment/todays'));
    final response = await http.get(
        Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/appointment/todays'));
    //print(fromJson(json)).toList());
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<Appointment>((json) => Appointment.fromJson(json))
          .toList();

      //return Document.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Appointment');
    }
  }

// list of tommarrows appointment rest api

  static Future<List<Appointment>> fetchAptByTommorow() async {
    final response = await http.get(Uri.parse(
        'http://3.108.194.111:8080/AtdochubJ-3/appointment/tommorows'));
    //print(fromJson(json)).toList());
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<Appointment>((json) => Appointment.fromJson(json))
          .toList();

      //return Document.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Appointment');
    }
  }
}
//add Appointment rest api

Future<Appointment> createAppointment(
  final aptId,
  int docId,
  int staffId,
  //String docTitle,
  // String tokenNo,
  String partyName,
  String contactNo,
  String partyType,
  String aptPlace,
  String city,
  int feesCollected,
  int totalFees,
  String paymentMode,
  String aptDate,
  String aptTime,
  // String aptExecutive,
  String aptStatus,
  String comments,
  // String createdAt,
) async {
  final response = await http.put(
      // Uri.parse('http://192.168.0.134:8080/AtdochubJ-3/appointment/register'),
      Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/appointment/register'

          // 'http://3.108.194.111:8080/AtdochubJ-3/appointment/register'
          ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'aptId': aptId,
        'docId': docId,
        'staffId': staffId,
        // 'docTitle': docTitle,
        // 'tokenNo': tokenNo,
        'partyName': partyName,
        'contactNo': contactNo,
        'partyType': partyType,
        'aptPlace': aptPlace,
        'city': city,
        'feesCollected': feesCollected,
        'totalFees': totalFees,
        'paymentMode': paymentMode,
        'aptDate': aptDate,
        'aptTime': aptTime,
        //'aptExecutive': aptExecutive,
        'aptStatus': aptStatus,

        'comments': comments,
        //  'createdAt': createdAt,
      }));

  if (response.statusCode == 201) {
    return Appointment.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(' Failed To Create Appointment');
  }
}

// fetchAppointment by aptId

Future<Appointment> fetchAppointment(aptId) async {
  final response = await http.get(
    Uri.parse(
        //  'http://192.168.0.134:8080/AtdochubJ-3/appointment/find/${aptId}'),

        /// Uri.parse(
        'http://3.108.194.111:8080/AtdochubJ-3/appointment/find/${aptId}'),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    Fluttertoast.showToast(
        msg: "Appointment Scheduled Successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Color.fromARGB(255, 3, 87, 156),
        textColor: Colors.white,
        fontSize: 12.0);
    print("response.statusCode ${'successful'}");
    return Appointment.fromJson(jsonDecode(response.body));
  } else {
    if (response.statusCode == 500) {
      Fluttertoast.showToast(
          msg: "Internal Server Error !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          textColor: Colors.white,
          fontSize: 12.0);
    } else {
      Fluttertoast.showToast(
          msg: "Failed to schedule appointment",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          textColor: Colors.white,
          fontSize: 12.0);
    }
  }
  throw Exception(' Failed To Create Appointment');
}

// update appointment

Future<Appointment> updateAppointment(
  // int docId,
  int aptId,
  int staffId,
  String docTitle,
  String tokenNo,
  String partyName,
  String contactNo,
  String partyType,
  String aptDate,
  String aptTime,
  String aptPlace,
  String city,
  int feesCollected,
  int totalFees,
  String paymentMode,
  String aptExecutive,
  String aptStatus,
  String comments,
) async {
  final http.Response response = await http.put(
    // Uri.parse('http://192.168.0.134:8080/AtdochubJ-3/appointment/update'),
    Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/appointment/update'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      // 'docId': docId,
      'aptId': aptId,
      'staffId': staffId,
      'docTitle': docTitle,
      'tokenNo': tokenNo,
      'partyName': partyName,
      'contactNo': contactNo,
      'partyType': partyType,
      'aptDate': aptDate,
      'aptTime': aptTime,
      'aptPlace': aptPlace,
      'city': city,
      'feesCollected': feesCollected,
      'totalFees': totalFees,
      'paymentMode': paymentMode,
      'aptExecutive': aptExecutive,
      'aptStatus': aptStatus,
      'comments': comments,
    }),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    Fluttertoast.showToast(
        msg: "Data updated successfully!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Color.fromARGB(255, 3, 87, 156),
        textColor: Colors.white,
        fontSize: 12.0);
    print("response.statusCode ${'successful'}");
    return Appointment.fromJson(jsonDecode(response.body)[0]);
  } else {
    if (response.statusCode == 500) {
      Fluttertoast.showToast(
          msg: "Internal Server Error !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          textColor: Colors.white,
          fontSize: 12.0);
    } else {
      Fluttertoast.showToast(
          msg: "Failed to update data",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          textColor: Colors.white,
          fontSize: 12.0);
    }
  }
  print("error ${response.statusCode}");
  throw Exception('Failed to update data.');
}
