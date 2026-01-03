import 'dart:async';

import 'package:AtDocHUB/Model/Appointment.dart';
import 'package:AtDocHUB/Model/Document.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DocumentController {
  static FutureOr<Iterable<Document>> fetchDocuments(String title) async {
    final response = await http
        .get(Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/document'));

    //print(fromJson(json)).toList());
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Document>((json) => Document.fromJson(json));

      //return Document.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Document');
    }
  }

//call for list of documents
  static Future<List<Document>> fetchDocList() async {
    final response = await http
        .get(Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/document'));
    //print(fromJson(json)).toList());
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Document>((json) => Document.fromJson(json)).toList();

      //return Document.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Document');
    }
  }

  static Future<List<Document>> agreementEnd() async {
    // final url = Uri.parse('http://3.108.194.111 :8080/Atdochub-3/document/');
    final url = Uri.parse(
        'http://3.108.194.111:8080/AtdochubJ-3/document/notification/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Document>((json) => Document.fromJson(json)).toList();

      //return Document.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Document');
    }
  }

  static Future<List<Appointment>> aptDate() async {
    final url = Uri.parse(
        'http://3.108.194.111:8080/AtdochubJ-3/appointment/aptdate?aptdate');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List docs = json.decode(response.body);
      // return json.decode(response.body).toList();

      return docs.map((json) => Appointment.fromJson(json)).where((doc) {
        final titleLower = doc.partyName.toLowerCase();
        final tokenLower = doc.partyType.toLowerCase();
        final aptmntDate = doc.aptDate.toString();
        // print(agreeEnd);

        //final searchLower = endOfAgreement.toLowerCase();
        //print(endOfAgreement);

        return titleLower.contains(aptmntDate) ||
            tokenLower.contains(aptmntDate);
      }).toList();
    } else {
      throw Exception();
    }
  }

//call for search list bar
  Future<Document> fetchSearchDocumentsList() async {
    //  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //var jsonResponse = null;

    // final response = await http
    //     .get(Uri.parse('http://3.108.194.111 :8080/Atdochub-3/document'));
    final response = await http
        .get(Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/document'));
    //print(fromJson(json)).toList());
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Document>((json) => Document.fromJson(json));

      //return Document.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Document');
    }
  }

  static Future<Document> fetchDocumentsByID(docId) async {
    // final response = await http.get(Uri.parse(
    //     'http://3.108.194.111 :8080/Atdochub-3/document/find/${docId}'));

    final response = await http.get(Uri.parse(
        'http://3.108.194.111:8080/AtdochubJ-3/document/find/${docId}'));
    //print(fromJson(json)).toList());
    if (response.statusCode == 200) {
      //final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      //log(parsed);
      //return parsed.map<Document>((json) => Document.fromJson(json)).toList();

      return Document.fromJson(jsonDecode(response.body));
    } else {
      if (response.statusCode == 204) {
        Fluttertoast.showToast(
            msg: "No Document Available",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromARGB(255, 3, 87, 156),
            textColor: Colors.white,
            fontSize: 12.0);
      }
      return Document.fromJson(jsonDecode(response.body));
      //throw Exception('Failed to load Document');
    }
  }

  static Future<List<Document>> getdocs(String query) async {
    // final url = Uri.parse('http://3.108.194.111 :8080/Atdochub-3/document/');
    final url = Uri.parse(
        // 'http://3.108.194.111:8080/AtdochubJ-3/document/'
        'http://3.108.194.111:8080/AtdochubJ-3/document/');
    final response = await http.get(url);

    //  try {
    // final response = await http.get(url);
    //.timeout(Duration(seconds: Time_out_duration)

    //  return _processResponse(response);
    // } on SocketException {
    //   throw FetchDataException(
    //     "No Internet Connection",
    //   );
    // } on TimeoutException {
    //   ApiNotRespondingException("API not responding");
    // }

    if (response.statusCode == 200) {
      final List docs = json.decode(response.body);
      // return json.decode(response.body).toList();

      return docs.map((json) => Document.fromJson(json)).where((doc) {
        final titleLower = doc.docTitle.toLowerCase();
        final tokenLower = doc.tokenNo.toString();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            tokenLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<Document>> getdatedocs(String query) async {
    // final url = Uri.parse(
    //     'http://3.108.194.111 :8080/Atdochub-3/document/findbystartdate?startdate=$query');
    final url = Uri.parse(
        'http://3.108.194.111:8080/AtdochubJ-3/document/findbystartdate?startdate=${query}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List docs = json.decode(response.body);
      // return json.decode(response.body).toList();

      return docs.map((json) => Document.fromJson(json)).where((doc) {
        final titleLower = doc.startDate;
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

  static Future<List<Document>> getenddatedocs(String query) async {
    // final url = Uri.parse(
    //     'http://3.108.194.111 :8080/Atdochub-3/document/findbyenddate?enddate=$query');
    final url = Uri.parse(
        'http://3.108.194.111:8080/AtdochubJ-3/document/findbyenddate?enddate=$query');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List docs = json.decode(response.body);
      // return json.decode(response.body).toList();

      return docs.map((json) => Document.fromJson(json)).where((doc) {
        final titleLower = doc.endDate;
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

  static Future<List<Document>> getUserSuggestions(String query) async {
    // final url = Uri.parse('http://3.108.194.111 :8080/Atdochub-3/document/');
    final url = Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/document/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List users = json.decode(response.body);

      return users.map((json) => Document.fromJson(json)).where((user) {
        final nameLower = user.docTitle.toLowerCase();
        final tokenLower = user.tokenNo.toString();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower) ||
            tokenLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

  static Future checkDate(String stDate) async {
    // final response = await http.get(Uri.parse(
    //     'http://3.108.194.111 :8080/Atdochub-3/document/findbystartdate?startdate=2022-06-23'));

    final response = await http.get(Uri.parse(
        'http://3.108.194.111:8080/AtdochubJ-3/document/findbystartdate?startdate=2022-06-23'));
    // +
    // DateFormat("yyyy-MM- dd").format(picked)));

    if (response.statusCode == 200) {
      // final json = response.body;
      // Map<String, dynamic> map = jsonDecode(json);
      // final doc = Document.fromJson(map);
      // return doc;
      return json.decode(response.body).toList();
    } else {
      throw Exception('Failed to load date');
    }
  }
}

Future<Document> createDocument(
  String docTitle,
  int tokenNo,
  String partyName,
  String docType,
  String address,
  String city,
  String pinCode,
  String duration,
  String rentDesc,
  String docStatus,
  String startDate,
  String endDate,
  String createdBy,
  String? updatedBy,
  // String createdAt,
) async {
  // final response = await http.post(
  //     Uri.parse('http://3.108.194.111 :8080/Atdochub-3/document/register'),
  final response = await http.post(
      Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/document/register'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        //'docId': docId,
        'docTitle': docTitle,
        'tokenNo': tokenNo,

        'partyName': partyName,
        'docType': docType,
        'address': address,
        'city': city,
        'pinCode': pinCode,
        'duration': duration,
        'rentDesc': rentDesc,

        'docStatus': docStatus,
        'startDate': startDate,
        'endDate': endDate,
        'createdBy': createdBy,
        'updatedBy': updatedBy,
        // 'createdAt': createdAt
      }));

  if (response.statusCode == 200 || response.statusCode == 201) {
    Fluttertoast.showToast(
        msg: "Data Saved Successfully!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Color.fromARGB(255, 3, 87, 156),
        textColor: Colors.white,
        fontSize: 12.0);

    return Document.fromJson(jsonDecode(response.body));
  } else {
    if (response.statusCode == 500) {
      Fluttertoast.showToast(
          msg: "Internal Server Error!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          textColor: Colors.white,
          fontSize: 12.0);
    } else {
      Fluttertoast.showToast(
          msg: "Failed to save data !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          textColor: Colors.white,
          fontSize: 12.0);
    }
  }

  throw Exception('Failed to create Document');
}

Future<Document> fetchDocument(docId) async {
  // final response = await http.get(
  //   Uri.parse('http://3.108.194.111:8080/Atdochub-3/document/find/125'),

  final response = await http.get(
    Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/document/find/$docId'),
  );

  if (response.statusCode == 200) {
    return Document.fromJson(jsonDecode(response.body));
  }

  throw Exception('Failed to load Document');
}

Future<Document> updateDocument(
    int docId,
    String docTitle,
    int tokenNo,
    String partyName,
    String docType,
    String address,
    String city,
    String pinCode,
    String duration,
    String rentDesc,
    String docStatus,
    String startDate,
    String endDate,
    String createdBy,
    String updatedBy) async {
  // final response = await http.put(
  //   Uri.parse('http://3.108.194.111:8080/Atdochub-3/document/update'),

  final response = await http.put(
    Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/document/update'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'docId': docId,
      'docTitle': docTitle,
      'tokenNo': tokenNo,
      'partyName': partyName,
      'docType': docType,
      'address': address,
      'city': city,
      'pinCode': pinCode,
      'duration': duration,
      'rentDesc': rentDesc,
      'docStatus': docStatus,
      'startDate': startDate,
      'endDate': endDate,
      'createdBy': createdBy,
      'updatedBy': updatedBy
    }),
  );

  if (response.statusCode == 201 || response.statusCode == 200) {
    Fluttertoast.showToast(
        msg: "Data Updated Successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Color.fromARGB(255, 3, 87, 156),
        textColor: Colors.white,
        fontSize: 12.0);
    print("response.statusCode ${'successful'}");
    return Document.fromJson(jsonDecode(response.body));
  } else {
    if (response.statusCode == 500) {
      Fluttertoast.showToast(
          msg: "Internal Server Error!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          textColor: Colors.white,
          fontSize: 12.0);
    } else {
      Fluttertoast.showToast(
          msg: "Failed to update data",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Color.fromARGB(255, 3, 87, 156),
          textColor: Colors.white,
          fontSize: 12.0);
    }
    throw Exception('Failed to update Document.');
  }
}
