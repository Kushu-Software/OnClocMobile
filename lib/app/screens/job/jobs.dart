import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:on_cloc_mobile/app/controllers/job/job_card.dart';
import 'package:on_cloc_mobile/app/models/job/job_card.dart';
import 'package:on_cloc_mobile/app/models/job/job_category.dart';
import 'package:on_cloc_mobile/main.dart';
import 'package:on_cloc_mobile/utilities/app_colors.dart';
import 'package:on_cloc_mobile/utilities/app_constants.dart';
import 'package:on_cloc_mobile/utilities/app_images.dart';
import 'package:on_cloc_mobile/utilities/app_routes.dart';
import 'package:on_cloc_mobile/utilities/app_theme.dart';
import 'package:on_cloc_mobile/utilities/app_widgets.dart';
import 'package:on_cloc_mobile/widgets/button_with_icon.dart';

class OnClocJobScreen extends StatefulWidget {
  const OnClocJobScreen({super.key});

  @override
  State<OnClocJobScreen> createState() => OnClocJobScreenState();
}

class OnClocJobScreenState extends State<OnClocJobScreen> {
  OnClocJobCardController controller = Get.put(OnClocJobCardController());

  final appBarHeight = AppBar().preferredSize.height;
  final jobsOpenCount = 12;
  final jobsAssignedCount = 10;
  final jobsPendingCount = 20;
  final jobsClosedCount = 25;

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = appStore.isDarkModeOn
        ? OnClocTheme.onClocDarkTheme
        : OnClocTheme.onClocLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnClocJobCardController>(
        init: controller,
        tag: 'job card',
        builder: (controller) {
          return Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            appBar: onClocCommonAppBarWidget(
              context,
              titleText: 'Jobs',
              isTitleCenter: false,
              leadingWidth: 0,
              leadingWidget: const Wrap(),
              isback: false,
              actionWidget: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useSafeArea: true,
                    builder: (BuildContext context) {
                      return jobFilterBottomSheetItem();
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 20.0),
                  child: SvgPicture.asset(
                    filterIcon,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                        appStore.isDarkModeOn
                            ? Colors.white
                            : appTextColorPrimary,
                        BlendMode.srcIn),
                  ),
                ),
              ),
            ),
            body: SafeArea(
              child: DefaultTabController(
                  length: 3,
                  child: NestedScrollView(
                      headerSliverBuilder: (context, isScrolled) {
                        return [
                          SliverToBoxAdapter(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: jobCardTopView(
                                              jobsOpen,
                                              jobsOpenCount.toString(),
                                              appColorPrimary)),
                                      10.width,
                                      Expanded(
                                          child: jobCardTopView(
                                              jobsAssigned,
                                              jobsAssignedCount.toString(),
                                              appColorSecondary))
                                    ],
                                  ),
                                  10.height,
                                  Row(
                                    children: [
                                      Expanded(
                                          child: jobCardTopView(
                                              jobsPending,
                                              jobsPendingCount.toString(),
                                              appColorTertiary)),
                                      10.width,
                                      Expanded(
                                          child: jobCardTopView(
                                              jobsClosed,
                                              jobsClosedCount.toString(),
                                              appColorOptional))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SliverPersistentHeader(
                            pinned: true,
                            delegate: StickyTabBarDelegate(
                              child: TabBar(
                                dividerColor: Colors.transparent,
                                indicatorSize: TabBarIndicatorSize.tab,
                                labelStyle: theme.textTheme.bodyMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w300,
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : appTextColorPrimary),
                                labelColor: Colors.white,
                                indicator: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    color: appColorPrimary),
                                tabs: const [
                                  Tab(text: assignedText),
                                  Tab(text: pastText),
                                  Tab(text: openText),
                                ],
                              ),
                            ),
                          )
                        ];
                      },
                      body: TabBarView(children: [
                        showJobCardList(
                            controller.getAssignedJobCardsList(), false),
                        showJobCardList(
                            controller.getPastJobCardsList(), false),
                        showJobCardList(controller.getOpenJobCardsList(), true),
                      ]))),
            ),
          );
        });
  }

  Widget jobFilterBottomSheetItem() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? appDarkColorPrimary : Colors.white,
          borderRadius: BorderRadius.circular(30)),
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  filter,
                  style: theme.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    closeCircleIcon,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                        Get.isDarkMode ? Colors.white : appTextColorPrimary,
                        BlendMode.srcIn),
                  ),
                ),
              ],
            ),
            20.height,
            Text(
              jobType,
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.jobTypes.length,
              itemBuilder: (context, index) {
                final status = controller.jobTypes[index];
                return Obx(
                  () => InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              activeColor: appColorPrimary,
                              value: status.isSelected.value,
                              onChanged: (bool? value) {
                                controller.toggleJobType(index);
                              },
                            ),
                          ),
                          10.width,
                          Text(
                            status.name,
                            style: theme.textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      controller.toggleJobType(index);
                    },
                  ),
                );
              },
            ),
            15.height,
            Divider(
              color: appGreyColor.withOpacity(0.10),
            ),
            15.height,
            Text(
              status,
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.jobStatuses.length,
              itemBuilder: (context, index) {
                final jobStatus = controller.jobStatuses[index];
                return Obx(
                  () => InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              activeColor: appColorPrimary,
                              value: jobStatus.isSelected.value,
                              onChanged: (bool? value) {
                                controller.toggleJobStatus(index);
                              },
                            ),
                          ),
                          10.width,
                          Text(
                            jobStatus.status,
                            style: theme.textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      controller.toggleJobStatus(index);
                    },
                  ),
                );
              },
            ),
            15.height,
            Divider(
              color: appGreyColor.withOpacity(0.10),
            ),
            15.height,
            Text(
              serviceDesk,
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            20.height,
            Obx(
              () => Container(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: controller.selectedJobCategory.value.isEmptyOrNull
                          ? appGreyColor.withOpacity(0.20)
                          : appColorPrimary),
                  color: Get.isDarkMode ? appDarkColorPrimary : Colors.white,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    isExpanded: true,
                    // Makes the dropdown take full width
                    value: controller.selectedJobCategory.value,
                    icon: SvgPicture.asset(
                      arrowDownIcon,
                      width: 8,
                      height: 8,
                      colorFilter: ColorFilter.mode(
                          Get.isDarkMode ? Colors.white : appTextColorPrimary,
                          BlendMode.srcIn),
                    ),
                    // Currently selected category
                    hint: Text(
                      selectServiceTicket,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    items: controller.jobCategories.map((JobCategory jobCategory) {
                      return DropdownMenuItem<String>(
                        value: jobCategory.jobCategoryId.toString(),
                        child: Text(
                          jobCategory.name,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      controller.selectJobCategory(newValue); // Update the category in the controller
                    },
                  ),
                ),
              ),
            ),
            20.height,
          ],
        ),
      ),
    );
  }

  jobCardTopView(String title, String count, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          Text(
            count,
            style: theme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w500, color: color),
          ),
        ],
      ),
    );
  }

  showJobCardList(Future<List<JobCard>> jobCards, bool isOpenJobCard) {
    return FutureBuilder<List<JobCard>>(
      future: jobCards,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: appColorPrimary,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return controller.listOfJobCardsAssigned.isEmpty
              ? const Text(noDataAvailable)
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.listOfJobCardsAssigned.length,
                  itemBuilder: (context, index) {
                    final jobCard = controller.listOfJobCardsAssigned[index];
                    if (isOpenJobCard) {
                      return showOpenJobCardItem(jobCard);
                    } else {
                      return showJobCardItem(jobCard);
                    }
                  },
                );
        }
      },
    );
  }

  showOpenJobCardItem(JobCard jobCard) {
    return InkWell(
      onTap: () {
        Get.toNamed(OnClocRoutes.onClocJobCardDetailScreen, arguments: jobCard);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: appStore.isDarkModeOn
              ? appGreyColor.withOpacity(0.05)
              : Colors.white,
          border: Border.all(
              color: appStore.isDarkModeOn
                  ? appGreyColor.withOpacity(0.10)
                  : Colors.white),
          boxShadow: [
            if (!appStore.isDarkModeOn)
              BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 110,
                  offset: const Offset(0, 55))
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: onClocCommonCacheImageWidget(jobCard.jobLocation, 40,
                      width: 40),
                ),
                10.height,
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Date',
                        style: theme.textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.w300),
                      ),
                      2.height,
                      Text(
                        '${DateFormat('MMM dd, yyyy').format(jobCard.startDate!)} - ${DateFormat('MMM dd, yyyy').format(jobCard.endDate!)}',
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: OnClocButtonWithIcon(
                    height: 40,
                    filter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    bgColor: appColorTertiary,
                    onPressed: () {},
                    text: reject,
                    iconName: closeCircleIcon,
                    borderRadius: 8,
                    textStyle: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400, color: Colors.white),
                  ),
                ),
                10.width,
                Expanded(
                  child: OnClocButtonWithIcon(
                    height: 40,
                    filter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    bgColor: appColorOptional,
                    onPressed: () {},
                    text: accept,
                    borderRadius: 8,
                    iconName: tickCircleIcon,
                    textStyle: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showJobCardItem(JobCard jobCard) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? appDarkColorPrimary : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: appColorPrimary.withOpacity(0.10),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Date',
                      style: theme.textTheme.bodySmall
                          ?.copyWith(fontWeight: FontWeight.w300),
                    ),
                    2.height,
                    Text(
                      '${DateFormat('MMM dd, yyyy').format(jobCard.startDate!)} - ${DateFormat('MMM dd, yyyy').format(jobCard.endDate!)}',
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: (jobCard.isPrimaryTechnician)
                      ? appColorTertiary.withOpacity(0.05)
                      : appColorOptional.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  jobCard.jobNumber,
                  style: theme.textTheme.bodySmall
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          10.height,
          Divider(
            color: appGreyColor.withOpacity(0.10),
          ),
          10.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showJobCardText('Subject:', jobCard.jobSubject),
              showJobCardText('Description:', jobCard.jobDescription),
              showJobCardText('Due Date:', jobCard.scheduledDate.toString())
            ],
          ),
        ],
      ),
    );
  }

  showJobCardText(String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          subtitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Get.isDarkMode ? appIconColor : appBgColorLight,
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
