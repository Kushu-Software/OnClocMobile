import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:on_cloc_mobile/app/controllers/theme/app_theme.dart';
import 'package:on_cloc_mobile/locale/app_localization.dart';
import 'package:on_cloc_mobile/locale/languages.dart';
import 'package:on_cloc_mobile/stores/app/app_store.dart';
import 'package:on_cloc_mobile/utilities/app_constants.dart';
import 'package:on_cloc_mobile/utilities/app_languages.dart';
import 'package:on_cloc_mobile/utilities/app_routes.dart';
import 'package:on_cloc_mobile/utilities/app_theme.dart';

OnClocAppStore appStore = OnClocAppStore();

late BaseLanguage language;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await initialize(aLocaleLanguageList: languageList());
  await appStore.setLanguage(getStringAsync(SELECTED_LANGUAGE_CODE, defaultValue: defaultLanguage));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(const OnClocMobileApp()));
}

class OnClocMobileApp extends StatefulWidget {
  const OnClocMobileApp({super.key});

  @override
  OnClocMobileAppState createState() => OnClocMobileAppState();
}

class OnClocMobileAppState extends State<OnClocMobileApp> {
  OnClocThemeController controller = Get.put(OnClocThemeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Get.isDarkMode
      ? Brightness.light 
      : Brightness.dark,
      statusBarIconBrightness: Get.isDarkMode
          ? Brightness.light 
          : Brightness.dark,
    ));
    return Obx(
      () {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: '$mainAppName${!isMobile ? ' ${platformName()}' : ''}',
          theme: controller.isDarkMode
              ? OnClocTheme.onClocDarkTheme
              : OnClocTheme.onClocLightTheme,
          getPages: OnClocRoutes.routes,
          navigatorKey: navigatorKey,
          scrollBehavior: SBehavior(),
          supportedLocales: LanguageDataModel.languageLocales(),
          localizationsDelegates: const [
            OnClocLocalizations(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) => locale,
          locale: Locale(appStore.selectedLanguageCode),
          initialRoute: OnClocRoutes.onClocSplashScreen,
        );
      },
    );
  }
}
