import 'package:get/get.dart';

import 'package:on_cloc_mobile/app/screens/alert/user_notification.dart';
import 'package:on_cloc_mobile/app/screens/auth/forgot_password.dart';
import 'package:on_cloc_mobile/app/screens/auth/login.dart';
import 'package:on_cloc_mobile/app/screens/auth/otp_verification.dart';
import 'package:on_cloc_mobile/app/screens/auth/reset_password.dart';
import 'package:on_cloc_mobile/app/screens/job/jobs.dart';
import 'package:on_cloc_mobile/app/screens/profile/user_activity.dart';
import 'package:on_cloc_mobile/app/screens/start/home.dart';
import 'package:on_cloc_mobile/app/screens/start/more_menu.dart';
import 'package:on_cloc_mobile/app/screens/start/navigation.dart';
import 'package:on_cloc_mobile/app/screens/start/onboarding.dart';
import 'package:on_cloc_mobile/app/screens/start/splash.dart';
import 'package:on_cloc_mobile/app/screens/ticket/service_ticket.dart';
import 'package:on_cloc_mobile/app/screens/travel/travel_schedule.dart';

// import 'package:on_cloc_mobile/screens/account/account_screen.dart';
// import 'package:on_cloc_mobile/screens/banned/banned_screen.dart';
// import 'package:on_cloc_mobile/screens/base/more_screen.dart';
// import 'package:on_cloc_mobile/screens/base/navigation_screen.dart';
// import 'package:on_cloc_mobile/screens/base/privacy_policy_screen.dart';
// import 'package:on_cloc_mobile/screens/base/server_unreachable_screen.dart';
// import 'package:on_cloc_mobile/screens/base/status_screen.dart';
// import 'package:on_cloc_mobile/screens/base/terms_condition_screen.dart';
// import 'package:on_cloc_mobile/screens/cart/cart_screeen.dart';
// import 'package:on_cloc_mobile/screens/chat/team_chat_screen.dart';
// import 'package:on_cloc_mobile/screens/client/client_create_screen.dart';
// import 'package:on_cloc_mobile/screens/client/client_list_screen.dart';
// import 'package:on_cloc_mobile/screens/device/device_verification_screen.dart';
// import 'package:on_cloc_mobile/screens/document/create_document_request_screen.dart';
// import 'package:on_cloc_mobile/screens/document/document_request_screen.dart';
// import 'package:on_cloc_mobile/screens/expense/expense_create_screen.dart';
// import 'package:on_cloc_mobile/screens/expense/expense_list_screen.dart';
// import 'package:on_cloc_mobile/screens/forms/forms_screen.dart';
// import 'package:on_cloc_mobile/screens/holiday/holiday_list_screen.dart';
// import 'package:on_cloc_mobile/screens/job/job_detail_screen.dart';
// import 'package:on_cloc_mobile/screens/job/job_card_list_screen.dart';
// import 'package:on_cloc_mobile/screens/language/language_selection_screen.dart';
// import 'package:on_cloc_mobile/screens/leave/leave_request_screen.dart';
// import 'package:on_cloc_mobile/screens/leave/leave_screen.dart';
// import 'package:on_cloc_mobile/screens/loan/loan_request_screen.dart';
// import 'package:on_cloc_mobile/screens/loan/loan_screen.dart';
// import 'package:on_cloc_mobile/screens/notice/notice_board_screen.dart';
// import 'package:on_cloc_mobile/screens/offline/offline_mode_screen.dart';
// import 'package:on_cloc_mobile/screens/order/order_history_screen.dart';
// import 'package:on_cloc_mobile/screens/order/orders_screen.dart';
// import 'package:on_cloc_mobile/screens/password/change_password_screen.dart';
// import 'package:on_cloc_mobile/screens/payment/collect_payment_screen.dart';
// import 'package:on_cloc_mobile/screens/payment/payment_collection_screen.dart';
// import 'package:on_cloc_mobile/screens/permission/activity_permission_screen.dart';
// import 'package:on_cloc_mobile/screens/permission/ios_permission_screen.dart';
// import 'package:on_cloc_mobile/screens/permission/location_permission_screen.dart';
// import 'package:on_cloc_mobile/screens/permission/permissions_screen.dart';
// import 'package:on_cloc_mobile/screens/product/product_categories_screen.dart';
// import 'package:on_cloc_mobile/screens/profile/my_profile_screen.dart';
// import 'package:on_cloc_mobile/screens/profile/profile_screen.dart';
// import 'package:on_cloc_mobile/screens/scanner/qr_scanner_screen.dart';
// import 'package:on_cloc_mobile/screens/schedule/attendance_detail_screen.dart';
// import 'package:on_cloc_mobile/screens/settings/modules_screen.dart';
// import 'package:on_cloc_mobile/screens/settings/settings_screen.dart';
// import 'package:on_cloc_mobile/screens/support/support_screen.dart';
// import 'package:on_cloc_mobile/screens/task/task_screen.dart';
// import 'package:on_cloc_mobile/screens/team/team_members_screen.dart';
// import 'package:on_cloc_mobile/screens/travel/apply_travel_screen.dart';
// import 'package:on_cloc_mobile/screens/visits/visits_history_screen.dart';
// import 'package:on_cloc_mobile/screens/visits/visits_screen.dart';

class OnClocRoutes {
  static const onClocUserNotificationScreen = '/user_notification';
  static const onClocForgotPasswordScreen = '/forgot_password';
  static const onClocLoginScreen = '/login_screen';
  static const onClocOtpVerificationScreen = '/otp_verification';
  static const onClocResetPasswordScreen = '/reset_password';
  static const onClocJobScreen = '/job_screen';
  static const onClocJobCardDetailScreen = '/job_card_details/:jobCard';
  static const onClocUserActivityScreen = '/user_activity_screen';
  static const onClocHomeScreen = '/home_screen';
  static const onClocNavigationScreen = '/navigation_screen';
  static const onClocMoreMenuScreen = '/more_menu_screen';
  static const onClocOnboardingScreen = '/onboarding_creen';
  static const onClocSplashScreen = '/splash_screen';
  static const onClocServiceTicketScreen = '/service_ticket';
  static const onClocTravelScheduleScreen = '/travel_schedule';

  // static const onClocAccountScreen = '/Account';
  // static const onClocBannedScreen = '/Banned';
  // static const onClocNavigationScreen = '/Navigation';  
  // static const onClocPrivacyPolicyScreen = '/PrivacyPolicy';
  // static const onClocServerUnreachableScreen = '/ServerUnreachable';
  // static const onClocStatusScreen = '/Status';
  // static const onClocTermConditionScreen = '/TermsConditions';
  // static const onClocCartScreen = '/Cart';
  // static const onClocTeamChatScreen = '/TeamChat';
  // static const onClocClientCreateScreen = '/ClientCreate';
  // static const onClocClientDetailsScreen = '/ClientDetails';
  // static const onClocClientListScreen = '/ClientList';
  // static const onClocDeviceVerificationScreen = '/DeviceVerification';
  // static const onCreateDocumentRequestScreen = '/CreateDocumentRequest';
  // static const onClocDocumentRequestScreen = '/DocumentRequest';
  // static const onClocExpenseCreateScreen = '/CreateExpense';
  // static const onClocExpenseListScreen = '/ExpenseList';
  // static const onClocFormsScreen = '/Forms';
  // static const onClocHolidayListScreen = '/HolidayList';
  // static const onClocJobDetailScreen = '/JobDetails';
  // static const onClocJobCardListScreen = '/JobCardList';
  // static const onClocLanguageSelectScreen = '/SelectLanguage';
  // static const onClocLeaveRequestScreen = '/LeaveRequest';
  // static const onClocLeaveScreen = '/ListLeave';
  // static const onClocLoanRequestScreen = '/LoanRequest';
  // static const onClocLoanScreen = '/LoanList';
  // static const onClocMapScreen = '/Map';
  // static const onClocNoticeBoardScreen = '/NoticeBoard';
  // static const onClocNotificationScreen = '/Notification';
  // static const onClocOfflineModeScreen = '/OfflineMode';
  // static const onClocOrderDetailsScreen = '/OrderDetails';
  // static const onClocOrderHistoryScreen = '/OrderHistory';
  // static const onClocOrdersScreen = '/OrdersList';
  // static const onClocChangePasswordScreen = '/ChangePassword';
  // static const onClocCollectPaymentScreen = '/CollectPayment';
  // static const onClocPaymentCollectionScreen = '/PaymentCollection';
  // static const onClocActivityPermissionScreen = '/ActivityPermission';
  // static const onClocIosPermissionScreen = '/IosPermission';
  // static const onClocLocationPermissionScreen = '/LocationPermission';
  // static const onClocPermissionsScreen = '/PermissionsList';
  // static const onClocProductCategoriesScreen = '/ProductCategories';
  // static const onClocProductScreen = '/ProductList';
  // static const onClocMyProfileScreen = '/ProfileDetails';
  // static const onClocProfileScreen = '/Profile';
  // static const onClocQrScannerScreen = '/QrScanner';
  // static const onClocActivityListScreen = '/Activity';
  // static const onClocAttendanceDetailScreen = '/AttendanceDetail';
  // static const onClocModulesScreen = '/ModuleList';
  // static const onClocSettingsScreen = '/Settings';
  // static const onClocSupportScreen = '/Support';
  // static const onClocTaskScreen = '/TaskList';
  // static const onClocTaskUpdateScreen = '/TaskUpdate';
  // static const onClocTaskUpdateItemScreen = '/TaskUpdateItem';
  // static const onClocTeamMembersScreen = '/TeamMembers';
  // static const onClocApplyTravelScreen = '/TravelRequest';
  // static const onClocViewImageScreen = '/ViewImage';
  // static const onClocViewPdfScreen = '/ViewPdf';
  // static const onClocVisitsHistoryScreen = '/VisitsHistory';
  // static const onClocVisitsScreen = '/VisitsList';

  static final routes = [
    GetPage(name: onClocUserNotificationScreen, page: () => OnClocUserNotificationScreen()),
    GetPage(name: onClocForgotPasswordScreen, page: () => OnClocForgotPasswordScreen()),
    GetPage(name: onClocLoginScreen, page: () => OnClocLoginScreen()),
    GetPage(name: onClocOtpVerificationScreen, page: () => OnClocOtpVerificationScreen()),
    GetPage(name: onClocResetPasswordScreen, page: () => OnClocResetPasswordScreen()),
    GetPage(name: onClocJobScreen, page: () => OnClocJobScreen()),
    GetPage(name: onClocUserActivityScreen, page: () => OnClocUserActivityScreen()),
    GetPage(name: onClocHomeScreen, page: () => OnClocHomeScreen()),
    GetPage(name: onClocNavigationScreen, page: () => OnClocNavigationScreen()), 
    GetPage(name: onClocMoreMenuScreen, page: () => OnClocMoreMenuScreen()),
    GetPage(name: onClocOnboardingScreen, page: () => OnClocOnboardingScreen()),
    GetPage(name: onClocSplashScreen, page: () => OnClocSplashScreen()),
    GetPage(name: onClocServiceTicketScreen, page: () => OnClocServiceTicketScreen()),
    GetPage(name: onClocTravelScheduleScreen, page: () => OnClocTravelScheduleScreen()),

    // GetPage(name: onClocAccountScreen, page: () => OnClocAccountScreen()),
    // GetPage(name: onClocBannedScreen, page: () => OnClocBannedScreen()),
    // GetPage(name: onClocNavigationScreen, page: () => OnClocNavigationScreen()),
    // GetPage(name: onClocPrivacyPolicyScreen, page: () => OnClocPrivacyPolicyScreen()),
    // GetPage(name: onClocServerUnreachableScreen, page: () => OnClocServerUnreachableScreen()),
    // GetPage(name: onClocStatusScreen, page: () => OnClocStatusScreen()),
    // GetPage(name: onClocTermConditionScreen, page: () => OnClocTermsConditionsScreen()),
    // GetPage(name: onClocCartScreen, page: () => OnClocCartScreen()),
    // GetPage(name: onClocTeamChatScreen, page: () => OnClocTeamChatScreen()),
    // GetPage(name: onClocClientCreateScreen, page: () => OnClocClientCreateScreen()),
    // GetPage(name: onClocClientListScreen, page: () => OnClocClientListScreen()),
    // GetPage(name: onClocDeviceVerificationScreen, page: () => OnClocDeviceVerificationScreen()),
    // GetPage(name: onCreateDocumentRequestScreen, page: () => OnClocCreateDocumentRequestScreen()),
    // GetPage(name: onClocDocumentRequestScreen, page: () => OnClocDocumentRequestScreen()),
    // GetPage(name: onClocExpenseCreateScreen, page: () => OnClocExpenseCreateScreen()),
    // GetPage(name: onClocExpenseListScreen, page: () => OnClocExpenseListScreen()),
    // GetPage(name: onClocFormsScreen, page: () => OnClocFormsScreen()),
    // GetPage(name: onClocHolidayListScreen, page: () => OnClocHolidayListScreen()),
    // GetPage(name: onClocJobCardListScreen, page: () => OnClocJobCardListScreen()),
    // GetPage(name: onClocLanguageSelectScreen, page: () => OnClocLanguageSelectScreen()),
    // GetPage(name: onClocLeaveRequestScreen, page: () => OnClocLeaveRequestScreen()),
    // GetPage(name: onClocLeaveScreen, page: () => OnClocLeaveScreen()),
    // GetPage(name: onClocLoanRequestScreen, page: () => OnClocLoanRequestScreen()),
    // GetPage(name: onClocLoanScreen, page: () => OnClocLoanScreen()),
    // GetPage(name: onClocNoticeBoardScreen, page: () => OnClocNoticeBoardScreen()),
    // GetPage(name: onClocNotificationScreen, page: () => OnClocNotificationScreen()),
    // GetPage(name: onClocOfflineModeScreen, page: () => OnClocOfflineModeScreen()),
    // GetPage(name: onClocOrderHistoryScreen, page: () => OnClocOrderHistoryScreen()),
    // GetPage(name: onClocOrdersScreen, page: () => OnClocOrdersScreen()),
    // GetPage(name: onClocChangePasswordScreen, page: () => OnClocChangePasswordScreen()),
    // GetPage(name: onClocForgotPasswordScreen, page: () => OnClocForgotPasswordScreen()),
    // GetPage(name: onClocCollectPaymentScreen, page: () => OnClocCollectPaymentScreen()),
    // GetPage(name: onClocPaymentCollectionScreen, page: () => OnClocPaymentCollectionScreen()),
    // GetPage(name: onClocActivityPermissionScreen, page: () => OnClocActivityPermissionScreen()),
    // GetPage(name: onClocIosPermissionScreen, page: () => OnClocIosPermissionScreen()),
    // GetPage(name: onClocLocationPermissionScreen, page: () => OnClocLocationPermissionScreen()),
    // GetPage(name: onClocPermissionsScreen, page: () => OnClocPermissionsScreen()),
    // GetPage(name: onClocProductCategoriesScreen, page: () => OnClocProductCategoriesScreen()),
    // GetPage(name: onClocMyProfileScreen, page: () => OnClocMyProfileScreen()),
    // GetPage(name: onClocProfileScreen, page: () => OnClocProfileScreen()),
    // GetPage(name: onClocQrScannerScreen, page: () => OnClocQrScannerScreen()),
    // GetPage(name: onClocActivityListScreen, page: () => OnClocActivityListScreen()),
    // GetPage(name: onClocAttendanceDetailScreen, page: () => OnClocAttendanceDetailScreen()),
    // GetPage(name: onClocModulesScreen, page: () => OnClocModulesScreen()),
    // GetPage(name: onClocSettingsScreen, page: () => OnClocSettingsScreen()),
    // GetPage(name: onClocSupportScreen, page: () => OnClocSupportScreen()),
    // GetPage(name: onClocTaskScreen, page: () => OnClocTaskScreen()),
    // GetPage(name: onClocTeamMembersScreen, page: () => OnClocTeamMembersScreen()),
    // GetPage(name: onClocApplyTravelScreen, page: () => OnClocApplyTravelScreen()),
    // GetPage(name: onClocVisitsHistoryScreen, page: () => OnClocVisitsHistoryScreen()),
    // GetPage(name: onClocVisitsScreen, page: () => OnClocVisitsScreen()),
  ];
}