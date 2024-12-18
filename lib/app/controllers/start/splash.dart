import 'package:get/get.dart';
//import 'package:nb_utils/nb_utils.dart';

import 'package:on_cloc_mobile/utilities/app_routes.dart';

class OnClocSplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    await Future.delayed(const Duration(seconds: 3));
    // try{
    //   final connectivityResult = await (Connectivity().checkConnectivity());
    //   bool isAnyConnection = connectivityResult.any((element) =>
    //       element == ConnectivityResult.mobile ||
    //       element == ConnectivityResult.wifi);
    // if (isAnyConnection) {
    //   await sharedHelper.refreshAppSettings();
    //   await moduleService.refreshModuleSettings();
    //   if (getBoolAsync(isLoggedInPref)) {
    //     if (getBoolAsync(isDeviceVerifiedPref)) {
    //       if (moduleService.isOfflineTrackingModuleEnabled()) {
    //         var count = await offlineSyncService.getSyncCount();
    //         if (count != 0) {
    //           await offlineSyncService.Sync();
    //         }
    //       }
    //       if (!mounted) return;
    //       //const HomeScreen().launch(context, isNewTask: true);
    //       const NavigationScreen().launch(context, isNewTask: true);
    //     } else {
    //       if (!mounted) return;
    //       const DeviceVerificationScreen().launch(context, isNewTask: true);
    //     }
    //   } else {
    //     if (moduleService.isOfflineTrackingModuleEnabled()) {
    //       var count = await offlineSyncService.getSyncCount();
    //       if (count != 0) {
    //         await offlineSyncService.Sync();
    //       }
    //     }
    //     if (!mounted) return;
    //     const LoginScreen().launch(context, isNewTask: true);
    //   }
    // } else {
    //   if (!mounted) return;
    //   const NoInternetScreen().launch(context, isNewTask: true);
    // }
    // }
    // catch(e){
    //   if (!mounted) return;
    //   if (getBoolAsync(isLoggedInPref) && getBoolAsync(isTrackingOnPref)) {
    //     const NoInternetScreen().launch(context, isNewTask: true);
    //   } else {
    //     const ServerUnreachableScreen().launch(context, isNewTask: true);
    //   }
    // }
    goToWelcomeScreen();
  }

  void goToWelcomeScreen() {
    Get.offNamed(OnClocRoutes.onClocOnboardingScreen);
  }
}
