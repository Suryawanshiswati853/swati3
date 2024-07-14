import 'dart:async';
import 'package:AtDocHUB/Model/Activity.dart';
import 'package:AtDocHUB/Model/ActivityCount.dart';
import 'package:AtDocHUB/Model/Document.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ActivityController {
  Future<Activity> fetchActivityById(int docId) async {
    final response = await http.get(
      Uri.parse(
          'http://3.108.194.111:8080/AtdochubJ-3/activity/updatebyid/${docId}'),
    );
    //print(fromJson(json)).toList());

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Activity>((json) => Activity.fromJson(json)).toList();

      // return Activity.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Appointment');
    }
  }

  static Future<List<ActivityCount>> userDashboard() async {
    final url = Uri.parse(
        'http://3.108.194.111:8080/AtdochubJ-3/activity/userdashboard/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<ActivityCount>((json) => ActivityCount.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load Document');
    }
  }

  static Future<List<Activity>> fetchActivity(docId) async {
    // final url = Uri.parse('http://3.108.194.111 :8080/Atdochub-3/document/');
    final url =
        Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/activity/${docId}');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Activity>((json) => Activity.fromJson(json)).toList();

      //return Document.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Document');
    }
  }
}

Future<Activity> updateActivity(
  int docId,
  int activityId,
  int status,
) async {
  final http.Response response = await http.patch(
    // Uri.parse('http://3.108.194.111 :8080/Atdochub-3/appointment/update'),
    Uri.parse('http://3.108.194.111:8080/AtdochubJ-3/activity/updatebyid/'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'docId': docId,
      'activityId': activityId,
      'status': status,
    }),
  );
  print(activityId);

  if (response.statusCode == 201) {
    print("response.statusCode ${'successful'}");
    return Activity.fromJson(jsonDecode(response.body));
  } else {
    print("error ${response.statusCode}");
    throw Exception('Failed to update Appointment.');
  }
}
