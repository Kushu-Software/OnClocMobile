const String userNotificationsTable = 'user_notifications';

class UserNotificationFields {
  static final List<String> values = [
    notificationId,
    title,
    message,
    dateTime,
    imageUrl,
    notificationTypeId,
  ];

  static const String notificationId = 'notificationId';
  static const String title = 'title';
  static const String message = 'message';
  static const String dateTime = 'dateTime';
  static const String imageUrl = 'imageUrl';
  static const String notificationTypeId = 'notificationTypeId';
}

class UserNotification {
  final int notificationId;
  final String title;
  final String message;
  final DateTime dateTime;
  final String imageUrl;
  final int notificationTypeId;

  UserNotification({
    required this.notificationId,
    required this.title,
    required this.message,
    required this.dateTime,
    required this.imageUrl,
    required this.notificationTypeId,
  });

  factory UserNotification.fromJson(Map<String, dynamic> json) =>
      UserNotification(
        notificationId: json['notificationId'],
        title: json['title'],
        message: json['message'],
        dateTime: json['dateTime'],
        imageUrl: json['imageUrl'],
        notificationTypeId: json['notificationTypeId'],
      );

  Map<String, dynamic> toJson() => {
        'notificationId': notificationId,
        'title': title,
        'message': message,
        'dateTime': dateTime,
        'imageUrl': imageUrl,
        'notificationTypeId': notificationTypeId,
      };
}
