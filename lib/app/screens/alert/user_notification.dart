import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:on_cloc_mobile/app/controllers/alert/user_notification.dart';
import 'package:on_cloc_mobile/app/controllers/theme/app_theme.dart';
import 'package:on_cloc_mobile/app/models/alert/user_notification.dart';
import 'package:on_cloc_mobile/utilities/app_colors.dart';
import 'package:on_cloc_mobile/utilities/app_constants.dart';
import 'package:on_cloc_mobile/utilities/app_images.dart';
import 'package:on_cloc_mobile/utilities/app_theme.dart';
import 'package:on_cloc_mobile/utilities/app_widgets.dart';

class OnClocUserNotificationScreen extends StatefulWidget{
  const OnClocUserNotificationScreen({super.key});

  @override
  OnClocUserNotificationScreenState createState() => OnClocUserNotificationScreenState();
}

class OnClocUserNotificationScreenState extends State<OnClocUserNotificationScreen>{
  OnClocUserNotificationController controller = Get.put(OnClocUserNotificationController());

  final OnClocThemeController themeController = Get.put(OnClocThemeController());

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = Get.isDarkMode 
    ? OnClocTheme.onClocDarkTheme 
    : OnClocTheme.onClocDarkTheme;
  }

  double horizontalPadding = 15.0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnClocUserNotificationController>(
      init: controller,
      tag: 'on_cloc_notification',
      // theme: theme,
      builder: (controller) {
        return Scaffold(
          appBar: onClocCommonAppBarWidget(
            context,
            titleText: notification,
          ),
          backgroundColor: theme.scaffoldBackgroundColor,
          body: SafeArea(
            child: getNotificationList(),
          ),
        );
      },
    );
  }

  getNotificationList() {
    return Center(
      child: FutureBuilder<List<UserNotification>>(
        future: controller.getNotificationList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: appColorPrimary,
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return controller.listOfNotification.isEmpty
                ? const Text(noDataAvailable)
                : ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: controller.listOfNotification.length,
                    // shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      UserNotification data =
                          controller.listOfNotification[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                (data.notificationTypeId == 'leave')
                                    ? ClipOval(
                                        child: onClocCommonCacheImageWidget(
                                            data.imageUrl, 42,
                                            width: 42))
                                    : _buildIcon(data.notificationTypeId),
                              ],
                            ),
                            title: Text(
                              data.title,
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  data.message,
                                  style: theme.textTheme.bodySmall
                                      ?.copyWith(fontWeight: FontWeight.w300),
                                ),
                                2.height,
                                Text(
                                  data.dateTime.toString(),
                                  style: theme.textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w300,
                                      color: Get.isDarkMode
                                          ? Colors.white
                                          : appGreyColor),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider(
                              color: appGreyColor.withOpacity(0.10),
                            ),
                          ),
                        ],
                      );
                    },
                  );
          }
        },
      ),
    );
  }

  _buildIcon(String notificationType) {
    return Container(
      width: 42,
      height: 42,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: appColorPrimary.withOpacity(0.05), shape: BoxShape.circle),
      child: SvgPicture.asset(
        getAssetIcon(notificationType),
        width: 20,
        height: 20,
        colorFilter: const ColorFilter.mode(appColorPrimary, BlendMode.srcIn),
      ),
    );
  }

  String getAssetIcon(String notificationType) {
    if (notificationType == 'updateProfile') {
      return profileIcon;
    } else if (notificationType == 'password') {
      return lockIcon;
    } else if (notificationType == 'systemUpdate') {
      return mobileIcon;
    }
    return '';
  }

}