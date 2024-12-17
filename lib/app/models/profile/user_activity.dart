class UserActivity {
  int id = 0;
  DateTime date = DateTime.now();
  String activity = '';
  String activityType = '';
  String status = '';
  String time = '';

  UserActivity(
      {required this.id,
      required this.date,
      required this.activity,
      required this.activityType,
      required this.status,
      required this.time});

  UserActivity.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['date'] != null) {
      date = DateTime.parse(json['date'].toString());
    }
    if (json['activity'] != null) {
      activity = json['activity'];
    }
    if (json['activity_type'] != null) {
      activityType = json['activity_type'];
    }
    if (json['status'] != null) {
      status = json['status'];
    }
    if (json['time'] != null) {
      time = json['time'];
    }
  }

  @override
  String toString() {
    return 'ActivityData{id: $id, date: $date, activity: $activity, activityType: $activityType, status: $status, time: $time}';
  }
}
