const String userActivitiesTable = 'user_activities';

class UserActivityFields {
  static final List<String> values = [
    /// Add all fields
    userActivityId, date, activity, activityType, status, time
  ];

  static final String userActivityId = 'userActivityId';
  static final String date = 'date';
  static final String activity = 'activity';
  static final String activityType = 'activityType';
  static final String status = 'status';
  static final String time = 'time';
}

class UserActivity {
  final int userActivityId;
  final DateTime date;
  final String activity;
  final String activityType;
  final String status;
  final String time;

  UserActivity(
      {required this.userActivityId,
      required this.date,
      required this.activity,
      required this.activityType,
      required this.status,
      required this.time});

  factory UserActivity.fromJson(Map<String, dynamic> json) => UserActivity(
      userActivityId: json['userActivityId'],
      date: DateTime.parse(json['date']),
      activity: json['activity'],
      activityType: json['activityType'],
      status: json['status'],
      time: json['time']);

  Map<String, dynamic> toJson() => {
        'userActivityId': userActivityId,
        'date': date.toIso8601String(),
        'activity': activity,
        'activityType': activityType,
        'status': status,
        'time': time
      };
}
