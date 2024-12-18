import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:on_cloc_mobile/app/controllers/profile/user_activity.dart';
import 'package:on_cloc_mobile/app/models/profile/user_activity.dart';
import 'package:on_cloc_mobile/main.dart';
import 'package:on_cloc_mobile/utilities/app_colors.dart';
import 'package:on_cloc_mobile/utilities/app_constants.dart';
import 'package:on_cloc_mobile/utilities/app_images.dart';
import 'package:on_cloc_mobile/utilities/app_theme.dart';
import 'package:on_cloc_mobile/utilities/app_widgets.dart';

class OnClocUserActivityScreen extends StatefulWidget {
  static String tag = '/OnClocUserActivityScreen';
  const OnClocUserActivityScreen({super.key});

  @override
  OnClocUserActivityScreenState createState() => OnClocUserActivityScreenState();
}

class OnClocUserActivityScreenState extends State<OnClocUserActivityScreen> {
  OnClocUserActivityController controller = Get.put(OnClocUserActivityController());

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = Get.isDarkMode
    ? OnClocTheme.onClocDarkTheme 
    : OnClocTheme.onClocLightTheme;
  }

  double horizontalPadding = 15.0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnClocUserActivityController>(
      init: controller,
      builder: (controller) {
        return Scaffold(
          appBar: onClocCommonAppBarWidget(context,
              titleText: yourActivity,
              actionWidget: InkWell(
                onTap: () async {
                  await controller.selectStartDate(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(
                    calendarIcon,
                    colorFilter: ColorFilter.mode(
                        Get.isDarkMode ? Colors.white : appTextColorPrimary,
                        BlendMode.srcIn),
                  ),
                ),
              ),
              isTitleCenter: true),
          backgroundColor: theme.scaffoldBackgroundColor,
          body: SafeArea(
            child: getActivityList(),
          ),
        );
      },
    );
  }

  getActivityList() {
    return FutureBuilder<List<UserActivity>>(
      future: controller.getActivityList(controller.selectedDate.value),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: appColorPrimary,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return controller.filteredActivities.isEmpty
              ? Center(
                  child: Text(
                    noDataAvailable,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w400,color: appColorPrimary),
                  ),
                )
              : ListView.builder(
                  itemCount: controller.filteredActivities.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    UserActivity data = controller.filteredActivities[index];
                    return Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appStore.isDarkModeOn
                            ? appColorPrimary
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 110,
                              offset: const Offset(0, 55))
                        ],
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: appColorPrimary.withOpacity(0.10),
                            ),
                            padding: const EdgeInsets.all(8),
                            width: 40,
                            height: 40,
                            child: SvgPicture.asset(
                              getActivityIcon(data.activityType),
                              width: 18,
                              height: 18,
                            ),
                          ),
                          10.width,
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.activity,
                                  style: theme.textTheme.bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  DateFormat('MMM dd,yyyy').format(data.date),
                                  style: theme.textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w300,
                                      color: appGreyColor),
                                ),
                              ],
                            ),
                          ),
                          10.width,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.time,
                                style: theme.textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                data.status,
                                style: theme.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: appGreyColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
        }
      },
    );
  }

  String getActivityIcon(String type) {
    if (type == "CI") {
      return checkInIcon;
    } else if (type == "CO") {
      return checkoutIcon;
    } else {
      return breakTimeIcon;
    }
  }
  }