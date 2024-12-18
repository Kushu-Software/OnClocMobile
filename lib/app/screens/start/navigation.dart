import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:on_cloc_mobile/app/controllers/start/navigation.dart';
import 'package:on_cloc_mobile/app/screens/start/home.dart';
import 'package:on_cloc_mobile/app/screens/job/jobs.dart';
import 'package:on_cloc_mobile/app/screens/ticket/service_ticket.dart';
import 'package:on_cloc_mobile/app/screens/travel/travel_schedule.dart';
import 'package:on_cloc_mobile/app/screens/start/more_menu.dart';
import 'package:on_cloc_mobile/main.dart';
import 'package:on_cloc_mobile/utilities/app_colors.dart';
import 'package:on_cloc_mobile/utilities/app_images.dart';
import 'package:on_cloc_mobile/utilities/app_theme.dart';

class OnClocNavigationScreen extends StatefulWidget {
  static String tag = '/OnClocNavigationScreen';
  const OnClocNavigationScreen({super.key});

  @override
  OnClocNavigationScreenState createState() => OnClocNavigationScreenState();
}

class OnClocNavigationScreenState extends State<OnClocNavigationScreen>
    with TickerProviderStateMixin {
  OnClocNavigationController controller = Get.put(OnClocNavigationController());

  late TabController tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    controller = Get.put(OnClocNavigationController());
    tabController = TabController(length: 5, vsync: this);
    ever(controller.currentIndex, (_) {
      tabController.animateTo(controller.currentIndex.value);
    });

    theme = Get.isDarkMode
    ? OnClocTheme.onClocDarkTheme 
    : OnClocTheme.onClocLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnClocNavigationController>(
      init: controller,
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor:
              appStore.isDarkModeOn 
              ? appColorPrimary 
              : Colors.white,
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: appColorPrimary,
            onPressed: () {
              tabController.index = 2;
              controller.currentIndex.value = 2;
            },
            child: SvgPicture.asset(ticketIcon),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            notchMargin: 6,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 53,
            // height: 80,
            color: appStore.isDarkModeOn
                ? appDarkColorPrimary
                : Colors.white.withOpacity(0.80),
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: _buildBottomInnerView(0, homeIcon),
                ),
                Flexible(
                  child: _buildBottomInnerView(1, jobIcon),
                ),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                  child: _buildBottomInnerView(3, travelIcon),
                ),
                Flexible(
                  child: _buildBottomInnerView(4, moreIcon),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                OnClocHomeScreen(),
                OnClocJobScreen(),
                OnClocServiceTicketScreen(),
                OnClocTravelScheduleScreen(),
                OnClocMoreMenuScreen(),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildBottomInnerView(int index, String icon) {
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 30,
            height: 4,
            decoration: BoxDecoration(
              color: appColorPrimary,
              borderRadius: BorderRadius.circular(20),
            ),
          ).visible((controller.currentIndex.value == index)),
          IconButton(
            icon: SvgPicture.asset(icon,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                    (controller.currentIndex.value == index)
                        ? appColorPrimary
                        : appStore.isDarkModeOn
                            ? Colors.white
                            : appTextColorPrimary,
                    BlendMode.srcIn)),
            onPressed: () {
              controller.changeTabIndex(index);
            },
          ),
        ],
      ),
    );
  }
}
