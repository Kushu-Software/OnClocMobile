import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:on_cloc_mobile/app/models/profile/user_activity.dart';
import 'package:get/get.dart';

class OnClocHomeController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxInt selectedDateIndex = 0.obs;
  RxBool isShowCheckInButton = true.obs;

  void selectDate(DateTime date,int index) {
    selectedDateIndex.value = index;
    selectedDate.value = date;
  }

  List<UserActivity> listOfActivities = [];

  Future<List<UserActivity>> getActivityList() async {
    listOfActivities.clear();
    // await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("lib/assets/data/activity_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['activity_list'];

    for (int i = 0; i < jsonArray.length; i++) {
      listOfActivities.add(UserActivity.fromJson(jsonArray[i]));
    }

    return listOfActivities;
  }
}
