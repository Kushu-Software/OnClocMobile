import 'package:flutter_guid/flutter_guid.dart';
import 'package:get/get.dart';

import 'package:on_cloc_mobile/app/models/profile/user_profile.dart';
import 'package:on_cloc_mobile/services/profile/user_profile.dart';

class OnClocUserProfileController extends GetxController {
  final currentUserProfileId = Guid('d1b3b3b3-3b3b-3b3b-3b3b-3b3b3b3b3b3b');
  final OnClocUserProfileService userProfileService = Get.find<OnClocUserProfileService>();

  final Rx<UserProfile> userProfile = UserProfile(userProfileId: Guid.defaultValue).obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  void fetchUserProfile() async {
    try {
      isLoading.value = true;
      userProfile.value = await OnClocUserProfileService.getUserProfileById(currentUserProfileId);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
