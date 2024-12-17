const String userNotificationsTable = 'user_notifications';

class UserNotification {
  String title = '';
  String message = '';
  String dateTime = '';
  String notificationType = '';
  String imageUrl = '';

  UserNotification.fromJson(Map<String, dynamic> json) {
    if (json['title'] != null) {
      title = json['title'];
    }
    if (json['message'] != null) {
      message = json['message'];
    }
    if (json['date_time'] != null) {
      dateTime = json['date_time'];
    }
    if (json['notification_type'] != null) {
      notificationType = json['notification_type'];
    }
    if (json['image_url'] != null) {
      imageUrl = json['image_url'];
    }
  }

}