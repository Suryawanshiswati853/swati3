import 'dart:core';

class Activity {
  int docId;
  int activityId;
  int status;

  get getdocId => this.docId;

  set setdocId(docId) => this.docId = docId;

  get getactivityId => this.activityId;

  set setactivityId(final activityId) => this.activityId = activityId;

  get getstatus => this.status;

  set setstatus(final status) => this.status = status;

  Activity({
    required this.docId,
    // required this.docId,
    required this.activityId,
    required this.status,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      docId: json['docId'],
      activityId: json['activityId'],
      status: json['status'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'docId': docId,
      'activityId': activityId,
      'status': status,
    };
  }
}
