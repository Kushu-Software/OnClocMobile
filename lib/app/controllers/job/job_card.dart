import 'package:flutter_guid/flutter_guid.dart';
import 'package:get/get.dart';
import 'package:on_cloc_mobile/app/controllers/profile/user_profile.dart';
import 'package:on_cloc_mobile/app/models/job/job_card.dart';
import 'package:on_cloc_mobile/app/models/job/job_category.dart';
import 'package:on_cloc_mobile/app/models/job/job_status.dart';
import 'package:on_cloc_mobile/app/models/job/job_type.dart';
import 'package:on_cloc_mobile/services/job/job_card.dart';
import 'package:on_cloc_mobile/services/job/job_category.dart';
import 'package:on_cloc_mobile/services/job/job_status.dart';
import 'package:on_cloc_mobile/services/job/job_type.dart';

class OnClocJobCardController extends GetxController {
  List<JobCard> listOfJobCardsAssigned = [];
  List<JobCard> listOfJobCardsPast = [];
  List<JobCard> listOfJobCardsOpen = [];

  Future<List<JobCard>> getAssignedJobCardsList() async {
    listOfJobCardsAssigned.clear();
    OnClocUserProfileController onClocUserProfileController =
        Get.find<OnClocUserProfileController>();

    await Future.delayed(const Duration(seconds: 1));

    Guid userProfileId = onClocUserProfileController.currentUserProfileId;
    dynamic data =
        await JobCardService.getAssignedJobCardsByProfileId(userProfileId);
    List<dynamic> jsonArray = data['assigned_job_cards'];
    for (int i = 0; i < jsonArray.length; i++) {
      listOfJobCardsAssigned.add(JobCard.fromJson(jsonArray[i]));
    }
    return listOfJobCardsAssigned;
  }

  Future<List<JobCard>> getPastJobCardsList() async {
    listOfJobCardsPast.clear();
    OnClocUserProfileController onClocUserProfileController =
        Get.find<OnClocUserProfileController>();

    await Future.delayed(const Duration(seconds: 1));

    Guid userProfileId = onClocUserProfileController.currentUserProfileId;
    dynamic data =
        await JobCardService.getPastJobCardsByProfileId(userProfileId);
    List<dynamic> jsonArray = data['past_job_cards'];
    for (int i = 0; i < jsonArray.length; i++) {
      listOfJobCardsPast.add(JobCard.fromJson(jsonArray[i]));
    }
    return listOfJobCardsPast;
  }

  Future<List<JobCard>> getOpenJobCardsList() async {
    listOfJobCardsOpen.clear();
    OnClocUserProfileController onClocUserProfileController =
        Get.find<OnClocUserProfileController>();

    await Future.delayed(const Duration(seconds: 1));

    Guid userProfileId = onClocUserProfileController.currentUserProfileId;
    dynamic data =
        await JobCardService.getOpenJobCardsByProfileId(userProfileId);
    List<dynamic> jsonArray = data['open_job_cards'];
    for (int i = 0; i < jsonArray.length; i++) {
      listOfJobCardsOpen.add(JobCard.fromJson(jsonArray[i]));
    }
    return listOfJobCardsOpen;
  }

  final jobStatuses = JobStatusService().getJobStatuses() as RxList<JobStatus>;

  void toggleJobStatus(int index) {
    jobStatuses[index].isSelected.value = !jobStatuses[index].isSelected.value;
  }

  final jobTypes = JobTypeService().getJobTypes() as RxList<JobType>;

  void toggleJobType(int index) {
    jobTypes[index].isSelected.value = !jobTypes[index].isSelected.value;
  }

  final jobCategories =
      JobCategoryService().getJobCategories() as RxList<JobCategory>;

  var selectedJobCategory = Rxn<String>();

  void selectJobCategory(String? category) {
    selectedJobCategory.value = category;
  }
}
