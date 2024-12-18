import 'package:on_cloc_mobile/services/job/job_card.dart';
import 'package:on_cloc_mobile/services/profile/user_profile.dart';

class OnClocDataInitializer {
  
  static void seedDatabase() async {
    // Seed User Profiles
    final userProfiles = OnClocUserProfileService.getSeedUserProfiles();
    for (var userProfile in userProfiles) {
      await OnClocUserProfileService.createUserProfile(userProfile);
    }
    // Seed Job Cards
    final jobCards = JobCardService.getSeedJobCards();
    for (var jobCard in jobCards) {
      await JobCardService.createJobCard(jobCard);
    }
  }
}
