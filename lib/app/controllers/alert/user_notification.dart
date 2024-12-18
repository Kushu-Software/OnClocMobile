import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:on_cloc_mobile/app/models/alert/user_notification.dart';

class OnClocUserNotificationController extends GetxController{
  List<UserNotification> listOfNotification = [];

    Future<List<UserNotification>> getNotificationList() async {
    listOfNotification.clear();
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("lib/assets/data/notification_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['notification_list'];

    for (int i = 0; i < jsonArray.length; i++) {
      listOfNotification.add(UserNotification.fromJson(jsonArray[i]));
    }

    return listOfNotification;
  }

}