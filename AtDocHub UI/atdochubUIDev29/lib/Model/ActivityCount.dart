import 'dart:core';

class ActivityCount {
  int activityId;
  int count;

  get getactivityId => this.activityId;

  set setactivityId(activityId) => this.activityId = activityId;

  get getcount => this.count;

  set setcount(final count) => this.count = count;

  ActivityCount({
    required this.activityId,
    required this.count,
  });

  factory ActivityCount.fromJson(Map<String, dynamic> json) {
    return ActivityCount(
      activityId: json['activityId'],
      count: json['count'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'activityId': activityId,
      'count': count,
    };
  }
}
