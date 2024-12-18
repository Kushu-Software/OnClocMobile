import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:on_cloc_mobile/app/controllers/start/home.dart';
import 'package:on_cloc_mobile/app/models/profile/user_activity.dart';
import 'package:on_cloc_mobile/main.dart';
import 'package:on_cloc_mobile/utilities/app_colors.dart';
import 'package:on_cloc_mobile/utilities/app_constants.dart';
import 'package:on_cloc_mobile/utilities/app_images.dart';
import 'package:on_cloc_mobile/utilities/app_routes.dart';
import 'package:on_cloc_mobile/utilities/app_theme.dart';
import 'package:on_cloc_mobile/utilities/app_widgets.dart';

class OnClocHomeScreen extends StatefulWidget {
  static String tag = '/OnClocHomeScreen';
  const OnClocHomeScreen({super.key});

  @override
  OnClocHomeScreenState createState() => OnClocHomeScreenState();
}

class OnClocHomeScreenState extends State<OnClocHomeScreen> {
  OnClocHomeController controller = Get.put(OnClocHomeController());

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = Get.isDarkMode
    ? OnClocTheme.onClocDarkTheme 
    : OnClocTheme.onClocLightTheme;
  }

  final appBarHeight = AppBar().preferredSize.height;
  final int numberOfDays = 15;
  final double horizontalPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnClocHomeController>(
      init: controller,
      builder: (controller) {
        return Scaffold(
          appBar: _buildAppBar(),
          backgroundColor: appStore.isDarkModeOn
              ? appColorPrimary
              : Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCalendarView(),

                  Container(
                    decoration: BoxDecoration(
                      color: appStore.isDarkModeOn
                          ? appGreyColor.withOpacity(0.10)
                          : appGreyColor.withOpacity(0.05),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        15.height,
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                          child: Text(
                            jobCards,
                            style: theme.textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        15.height,
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: _buildTodayAttendanceChildView(
                                      checkInIcon, checkIn, '10:20 am', 'On Time')),
                              15.width,
                              Expanded(
                                  child: _buildTodayAttendanceChildView(
                                      checkoutIcon, checkOut, '07:00 pm', 'Go Home')),
                            ],
                          ),
                        ),
                        15.height,
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: _buildTodayAttendanceChildView(breakTimeIcon,
                                      breakTime, '00:30 min', 'Avg Time 30 min')),
                              15.width,
                              Expanded(
                                  child: _buildTodayAttendanceChildView(
                                      calendarIcon, totalDays, '28', 'Working Days')),
                            ],
                          ),
                        ),
                        15.height,
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                yourActivity,
                                style: theme.textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(OnClocRoutes.onClocUserActivityScreen);
                                },
                                child: Text(
                                  viewAll,
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w300,
                                      color: appColorPrimary),
                                ),
                              ),
                            ],
                          ),
                        ),
                        5.height,
                        getActivityList(),
                        100.height,
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: _buildCheckInOutButtonView(),
        );
      },
    );
  }

  getActivityList() {
    return Center(
        child: FutureBuilder<List<UserActivity>>(
      future: controller.getActivityList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            color: appColorPrimary,
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return controller.listOfActivities.isEmpty
              ? const Text(noDataAvailable)
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.listOfActivities.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    UserActivity data = controller.listOfActivities[index];
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
    ));
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

  _buildTodayAttendanceChildView(
    String assetName,
    String title,
    String timing,
    String bottomText,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: appStore.isDarkModeOn 
        ? appColorPrimary 
        : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 110,
              offset: const Offset(0, 55))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: appColorPrimary.withOpacity(0.10),
                ),
                padding: const EdgeInsets.all(8),
                width: 34,
                height: 34,
                child: SvgPicture.asset(
                  assetName,
                  width: 18,
                  height: 18,
                ),
              ),
              5.width,
              Text(
                title,
                style: theme.textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w300),
              ),
            ],
          ),
          8.height,
          Text(
            timing,
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          5.height,
          Text(
            bottomText,
            style: theme.textTheme.bodySmall
                ?.copyWith(fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }

  _buildCalendarView() {
    return Container(
      color: Get.isDarkMode ? appColorPrimary : Colors.white,
      child: HorizontalList(
        padding:
            EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20),
        // shrinkWrap: true,
        // scrollDirection: Axis.horizontal,
        itemCount: numberOfDays,
        itemBuilder: (context, index) {
          // Calculate the date for the current index

          // Calculate the date for the current index
          DateTime date = DateTime.now().add(Duration(days: index));

          return Obx(
            () => GestureDetector(
              onTap: () {
                controller.selectDate(date, index);
              },
              child: Container(
                height: 70,
                width: 70, // Adjust the width as needed
                decoration: BoxDecoration(
                  border: Border.all(
                    color: (controller.selectedDateIndex.value == index)
                        ? appColorPrimary
                        : appGreyColor.withOpacity(0.20),
                  ),
                  color: (controller.selectedDateIndex.value == index)
                      ? appColorPrimary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${date.day}',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: (controller.selectedDateIndex.value == index)
                            ? Colors.white
                            : appStore.isDarkModeOn
                                ? Colors.white
                                : appTextColorPrimary,
                      ),
                    ),
                    Text(
                      _getWeekday(date.weekday),
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: (controller.selectedDateIndex.value == index)
                            ? Colors.white
                            : appStore.isDarkModeOn
                                ? Colors.white
                                : appTextColorPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _getWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight + 20),
      child: Container(
        color: Get.isDarkMode ? appColorPrimary : Colors.white,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          trailing: InkWell(
            onTap: () {
              Get.toNamed(OnClocRoutes.onClocUserNotificationScreen);
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.5,
                  color: appGreyColor.withOpacity(0.20),
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                notificationIcon,
                colorFilter: ColorFilter.mode(
                    appStore.isDarkModeOn 
                    ? Colors.white 
                    : appTextColorPrimary,
                    BlendMode.srcIn),
              ),
            ),
          ),
          leading: ClipOval(
            child: onClocCommonCacheImageWidget(
                'https://i.ibb.co/SfGvsWB/Ellipse-110.png', 50,
                width: 50),
          ),
          title: Text(
            'Michael Mitc',
            style: theme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            'Lead UI/UX Designer',
            style: theme.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }

  _buildCheckInOutButtonView() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(
            left: horizontalPadding, right: horizontalPadding, bottom: 20),
        child: ActionSlider.standard(
          height: 56,
          backgroundBorderRadius: BorderRadius.circular(10),
          sliderBehavior: SliderBehavior.stretch,
          rolling: true,
          width: 300.0,
          backgroundColor: controller.isShowCheckInButton.value
              ? appColorPrimary
              : appColorTertiary,
          toggleColor: Colors.transparent,
          iconAlignment: Alignment.centerRight,
          loadingIcon: const SizedBox(
            width: 55,
            child: Center(
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(
                    strokeWidth: 2.0, color: Colors.white),
              ),
            ),
          ),
          successIcon: const SizedBox(
            width: 55,
            child: Center(
              child: Icon(
                Icons.check_rounded,
                color: Colors.white,
              ),
            ),
          ),
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: SvgPicture.asset(
                arrowRightIcon,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                    controller.isShowCheckInButton.value
                        ? appColorPrimary
                        : appColorTertiary,
                    BlendMode.srcIn),
              ),
            ),
          ),
          action: (animatedController) async {
            controller.isShowCheckInButton.value =
                !controller.isShowCheckInButton.value;
            animatedController.loading(); //starts loading animation
            await Future.delayed(const Duration(seconds: 2));
            animatedController.success(); //starts success animation
            await Future.delayed(const Duration(seconds: 1));
            animatedController.reset(); //resets the slider
          },
          child: Text(
            controller.isShowCheckInButton.value ? swipeCheckIn : swipeCheckOut,
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.w300, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
