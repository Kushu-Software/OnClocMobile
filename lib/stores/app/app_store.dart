import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:on_cloc_mobile/app/models/alert/status_response.dart';
import 'package:on_cloc_mobile/locale/app_localization.dart';
import 'package:on_cloc_mobile/locale/languages.dart';
import 'package:on_cloc_mobile/main.dart';
import 'package:on_cloc_mobile/utilities/app_colors.dart';
import 'package:on_cloc_mobile/utilities/app_constants.dart';

part 'app_store.g.dart';

class OnClocAppStore = OnClocAppStoreBase with _$OnClocAppStore;

abstract class OnClocAppStoreBase with Store {
  @observable
  bool isDarkModeOn = false;

  @observable
  String selectedLanguageCode = defaultLanguage;

  @observable
  StatusResponse? currentStatus = StatusResponse();

  @observable
  bool isStatusCheckLoading = true;

  @observable
  Color appPrimaryColor = opPrimaryColor;

  @observable
  Color? iconColor;

  @observable
  Color? backgroundColor;

  @observable
  Color? appBarColor;

  @observable
  Color? scaffoldBackground;

  @observable
  Color? backgroundSecondaryColor;

  @observable
  Color? appColorPrimaryLightColor;

  @observable
  Color? iconSecondaryColor;

  @observable
  Color? textPrimaryColor;

  @observable
  Color? textSecondaryColor;

  @computed
  StatusResponse? get getCurrentStatus => currentStatus;
  
  @computed
  Color get appColorPrimary => appPrimaryColor;

  @action
  Future toggleColorTheme() async {
    var colorPref = getStringAsync(appColorPrimaryPref);
    if (colorPref.isNotEmpty) {
      appPrimaryColor = Color(int.parse(colorPref, radix: 16));
    } else {
      appPrimaryColor = opPrimaryColor;
    }
    setValue(appColorPrimaryPref, appPrimaryColor.toHex());
  }

  @action
  Future changeColorTheme(Color color) async {
    appPrimaryColor = color;
    setValue(appColorPrimaryPref, appPrimaryColor.toHex());
  }

  @action
  Future<void> toggleDarkMode({bool? value}) async {
    isDarkModeOn = value ?? !isDarkModeOn;

    if(isDarkModeOn){
      appBarColor = cardBackgroundBlackDark;
      appStore.appColorPrimaryLightColor = cardBackgroundBlackDark;
      backgroundColor = Colors.white;
      backgroundSecondaryColor = Colors.white;
      iconColor = iconColorPrimary;
      iconSecondaryColor = iconColorSecondary;
      scaffoldBackground = appBackgroundColorDark;
      shadowColorGlobal = appShadowColorDark;
      textPrimaryColor = whiteColor;
      textSecondaryColor = Colors.white54;
      textPrimaryColorGlobal = whiteColor;
      textSecondaryColorGlobal = Colors.white54;
    }
    else {
      appBarColor = Colors.white;
      appStore.appColorPrimaryLightColor = appColorPrimaryLight;
      backgroundColor = Colors.black;
      backgroundSecondaryColor = appSecondaryBackgroundColor;
      iconColor = iconColorPrimaryDark;
      iconSecondaryColor = iconColorSecondaryDark;
      scaffoldBackground = scaffoldLightColor;
      shadowColorGlobal = appShadowColor;
      textPrimaryColor = appTextColorPrimary;
      textSecondaryColor = appTextColorSecondary;
      textPrimaryColorGlobal = appTextColorPrimary;
      textSecondaryColorGlobal = appTextColorSecondary;
    }
  }

  @action
  void setCurrentStatus(StatusResponse status) {
    isStatusCheckLoading = true;
    currentStatus = status;
    isStatusCheckLoading = false;
  }

  @action
    Future<void> setLanguage(String val, {BuildContext? context}) async {
    selectedLanguageCode = val;
    if (context != null) language = BaseLanguage.of(context);
    await setValue(SELECTED_LANGUAGE_CODE, selectedLanguageCode);
    selectedLanguageDataModel = getSelectedLanguageModel();
    language = await const OnClocLocalizations().load(Locale(selectedLanguageCode));
  }
}
