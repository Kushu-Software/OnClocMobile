import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:on_cloc_mobile/app/models/profile/user_activity.dart';
import 'package:on_cloc_mobile/utilities/app_colors.dart';

class OnClocUserActivityController extends GetxController{
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxList<UserActivity> filteredActivities = <UserActivity>[].obs;
  RxList<UserActivity> listOfActivities = <UserActivity>[].obs;

  void selectDate(DateTime date, int index) {
    selectedDate.value = date;
  }

  Future<List<UserActivity>> getActivityList(DateTime date) async {
    listOfActivities.clear();
    filteredActivities.clear();
    String jsonData = await rootBundle
        .loadString("lib/assets/data/activity_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['activity_list'];

    listOfActivities.add(UserActivity(
        userActivityId: 1,
        date: DateTime.now(),
        activity: "Check In",
        activityType: "CI",
        status: "on Time",
        time: "09:00 am"));
    listOfActivities.add(UserActivity(
        userActivityId: 2,
        date: DateTime.now(),
        activity: "Break In",
        activityType: "BT",
        status: "on Time",
        time: "01:00 pm"));
    listOfActivities.add(UserActivity(
        userActivityId: 3,
        date: DateTime.now(),
        activity: "Break Out",
        activityType: "BT",
        status: "on Time",
        time: "01:30 pm"));
    listOfActivities.add(UserActivity(
        userActivityId: 4,
        date: DateTime.now(),
        activity: "Check Out",
        activityType: "CO",
        status: "on Time",
        time: "05:30 pm"));
    for (int i = 0; i < jsonArray.length; i++) {
      listOfActivities.add(UserActivity.fromJson(jsonArray[i]));
    }
    // Parse and filter activities by date
    for (int i = 0; i < listOfActivities.length; i++) {
      UserActivity activity = listOfActivities[i];
      if (_isSameDate(activity.date, date)) {
        filteredActivities.add(activity);
      }
    }

    return filteredActivities;
  }

  // Utility function to compare if two dates are the same
  bool _isSameDate(DateTime activityDate, DateTime dateToCompare) {
    return activityDate.year == dateToCompare.year &&
        activityDate.month == dateToCompare.month &&
        activityDate.day == dateToCompare.day;
  }

  // To check if there is any activity for today
  bool isActivityAvailableForToday() {
    return filteredActivities.isNotEmpty;
  }

  // Method to select start date
  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: Get.overlayContext!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      // Custom theme for the date picker dialog
      builder: (BuildContext context, Widget? child) {
        return Theme(
          // Customize the theme of the date picker dialog here
          data: ThemeData.light().copyWith(
            primaryColor: appColorPrimary,
            // Change primary color

            colorScheme: const ColorScheme.light(primary: appColorPrimary),
            // Change color scheme
            dialogBackgroundColor: Colors.white, // Change background color
            // Add more customizations as needed
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      selectedDate.value = picked;
      getActivityList(selectedDate.value);
      //print(selectedDate.value);
      update(); // This will update the GetBuilder in the UI
    }
  }

}