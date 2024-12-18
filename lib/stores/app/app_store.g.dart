// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnClocAppStore on OnClocAppStoreBase, Store {
  Computed<StatusResponse?>? _$getCurrentStatusComputed;

  @override
  StatusResponse? get getCurrentStatus => (_$getCurrentStatusComputed ??=
          Computed<StatusResponse?>(() => super.getCurrentStatus,
              name: 'OnClocAppStoreBase.getCurrentStatus'))
      .value;
  Computed<Color>? _$appColorPrimaryComputed;

  @override
  Color get appColorPrimary => (_$appColorPrimaryComputed ??= Computed<Color>(
          () => super.appColorPrimary,
          name: 'OnClocAppStoreBase.appColorPrimary'))
      .value;

  late final _$isDarkModeOnAtom =
      Atom(name: 'OnClocAppStoreBase.isDarkModeOn', context: context);

  @override
  bool get isDarkModeOn {
    _$isDarkModeOnAtom.reportRead();
    return super.isDarkModeOn;
  }

  @override
  set isDarkModeOn(bool value) {
    _$isDarkModeOnAtom.reportWrite(value, super.isDarkModeOn, () {
      super.isDarkModeOn = value;
    });
  }

  late final _$selectedLanguageCodeAtom =
      Atom(name: 'OnClocAppStoreBase.selectedLanguageCode', context: context);

  @override
  String get selectedLanguageCode {
    _$selectedLanguageCodeAtom.reportRead();
    return super.selectedLanguageCode;
  }

  @override
  set selectedLanguageCode(String value) {
    _$selectedLanguageCodeAtom.reportWrite(value, super.selectedLanguageCode,
        () {
      super.selectedLanguageCode = value;
    });
  }

  late final _$currentStatusAtom =
      Atom(name: 'OnClocAppStoreBase.currentStatus', context: context);

  @override
  StatusResponse? get currentStatus {
    _$currentStatusAtom.reportRead();
    return super.currentStatus;
  }

  @override
  set currentStatus(StatusResponse? value) {
    _$currentStatusAtom.reportWrite(value, super.currentStatus, () {
      super.currentStatus = value;
    });
  }

  late final _$isStatusCheckLoadingAtom =
      Atom(name: 'OnClocAppStoreBase.isStatusCheckLoading', context: context);

  @override
  bool get isStatusCheckLoading {
    _$isStatusCheckLoadingAtom.reportRead();
    return super.isStatusCheckLoading;
  }

  @override
  set isStatusCheckLoading(bool value) {
    _$isStatusCheckLoadingAtom.reportWrite(value, super.isStatusCheckLoading,
        () {
      super.isStatusCheckLoading = value;
    });
  }

  late final _$appPrimaryColorAtom =
      Atom(name: 'OnClocAppStoreBase.appPrimaryColor', context: context);

  @override
  Color get appPrimaryColor {
    _$appPrimaryColorAtom.reportRead();
    return super.appPrimaryColor;
  }

  @override
  set appPrimaryColor(Color value) {
    _$appPrimaryColorAtom.reportWrite(value, super.appPrimaryColor, () {
      super.appPrimaryColor = value;
    });
  }

  late final _$iconColorAtom =
      Atom(name: 'OnClocAppStoreBase.iconColor', context: context);

  @override
  Color? get iconColor {
    _$iconColorAtom.reportRead();
    return super.iconColor;
  }

  @override
  set iconColor(Color? value) {
    _$iconColorAtom.reportWrite(value, super.iconColor, () {
      super.iconColor = value;
    });
  }

  late final _$backgroundColorAtom =
      Atom(name: 'OnClocAppStoreBase.backgroundColor', context: context);

  @override
  Color? get backgroundColor {
    _$backgroundColorAtom.reportRead();
    return super.backgroundColor;
  }

  @override
  set backgroundColor(Color? value) {
    _$backgroundColorAtom.reportWrite(value, super.backgroundColor, () {
      super.backgroundColor = value;
    });
  }

  late final _$appBarColorAtom =
      Atom(name: 'OnClocAppStoreBase.appBarColor', context: context);

  @override
  Color? get appBarColor {
    _$appBarColorAtom.reportRead();
    return super.appBarColor;
  }

  @override
  set appBarColor(Color? value) {
    _$appBarColorAtom.reportWrite(value, super.appBarColor, () {
      super.appBarColor = value;
    });
  }

  late final _$scaffoldBackgroundAtom =
      Atom(name: 'OnClocAppStoreBase.scaffoldBackground', context: context);

  @override
  Color? get scaffoldBackground {
    _$scaffoldBackgroundAtom.reportRead();
    return super.scaffoldBackground;
  }

  @override
  set scaffoldBackground(Color? value) {
    _$scaffoldBackgroundAtom.reportWrite(value, super.scaffoldBackground, () {
      super.scaffoldBackground = value;
    });
  }

  late final _$backgroundSecondaryColorAtom = Atom(
      name: 'OnClocAppStoreBase.backgroundSecondaryColor', context: context);

  @override
  Color? get backgroundSecondaryColor {
    _$backgroundSecondaryColorAtom.reportRead();
    return super.backgroundSecondaryColor;
  }

  @override
  set backgroundSecondaryColor(Color? value) {
    _$backgroundSecondaryColorAtom
        .reportWrite(value, super.backgroundSecondaryColor, () {
      super.backgroundSecondaryColor = value;
    });
  }

  late final _$appColorPrimaryLightColorAtom = Atom(
      name: 'OnClocAppStoreBase.appColorPrimaryLightColor', context: context);

  @override
  Color? get appColorPrimaryLightColor {
    _$appColorPrimaryLightColorAtom.reportRead();
    return super.appColorPrimaryLightColor;
  }

  @override
  set appColorPrimaryLightColor(Color? value) {
    _$appColorPrimaryLightColorAtom
        .reportWrite(value, super.appColorPrimaryLightColor, () {
      super.appColorPrimaryLightColor = value;
    });
  }

  late final _$iconSecondaryColorAtom =
      Atom(name: 'OnClocAppStoreBase.iconSecondaryColor', context: context);

  @override
  Color? get iconSecondaryColor {
    _$iconSecondaryColorAtom.reportRead();
    return super.iconSecondaryColor;
  }

  @override
  set iconSecondaryColor(Color? value) {
    _$iconSecondaryColorAtom.reportWrite(value, super.iconSecondaryColor, () {
      super.iconSecondaryColor = value;
    });
  }

  late final _$textPrimaryColorAtom =
      Atom(name: 'OnClocAppStoreBase.textPrimaryColor', context: context);

  @override
  Color? get textPrimaryColor {
    _$textPrimaryColorAtom.reportRead();
    return super.textPrimaryColor;
  }

  @override
  set textPrimaryColor(Color? value) {
    _$textPrimaryColorAtom.reportWrite(value, super.textPrimaryColor, () {
      super.textPrimaryColor = value;
    });
  }

  late final _$textSecondaryColorAtom =
      Atom(name: 'OnClocAppStoreBase.textSecondaryColor', context: context);

  @override
  Color? get textSecondaryColor {
    _$textSecondaryColorAtom.reportRead();
    return super.textSecondaryColor;
  }

  @override
  set textSecondaryColor(Color? value) {
    _$textSecondaryColorAtom.reportWrite(value, super.textSecondaryColor, () {
      super.textSecondaryColor = value;
    });
  }

  late final _$toggleColorThemeAsyncAction =
      AsyncAction('OnClocAppStoreBase.toggleColorTheme', context: context);

  @override
  Future<dynamic> toggleColorTheme() {
    return _$toggleColorThemeAsyncAction.run(() => super.toggleColorTheme());
  }

  late final _$changeColorThemeAsyncAction =
      AsyncAction('OnClocAppStoreBase.changeColorTheme', context: context);

  @override
  Future<dynamic> changeColorTheme(Color color) {
    return _$changeColorThemeAsyncAction
        .run(() => super.changeColorTheme(color));
  }

  late final _$toggleDarkModeAsyncAction =
      AsyncAction('OnClocAppStoreBase.toggleDarkMode', context: context);

  @override
  Future<void> toggleDarkMode({bool? value}) {
    return _$toggleDarkModeAsyncAction
        .run(() => super.toggleDarkMode(value: value));
  }

  late final _$setLanguageAsyncAction =
      AsyncAction('OnClocAppStoreBase.setLanguage', context: context);

  @override
  Future<void> setLanguage(String val, {BuildContext? context}) {
    return _$setLanguageAsyncAction
        .run(() => super.setLanguage(val, context: context));
  }

  late final _$OnClocAppStoreBaseActionController =
      ActionController(name: 'OnClocAppStoreBase', context: context);

  @override
  void setCurrentStatus(StatusResponse status) {
    final _$actionInfo = _$OnClocAppStoreBaseActionController.startAction(
        name: 'OnClocAppStoreBase.setCurrentStatus');
    try {
      return super.setCurrentStatus(status);
    } finally {
      _$OnClocAppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkModeOn: ${isDarkModeOn},
selectedLanguageCode: ${selectedLanguageCode},
currentStatus: ${currentStatus},
isStatusCheckLoading: ${isStatusCheckLoading},
appPrimaryColor: ${appPrimaryColor},
iconColor: ${iconColor},
backgroundColor: ${backgroundColor},
appBarColor: ${appBarColor},
scaffoldBackground: ${scaffoldBackground},
backgroundSecondaryColor: ${backgroundSecondaryColor},
appColorPrimaryLightColor: ${appColorPrimaryLightColor},
iconSecondaryColor: ${iconSecondaryColor},
textPrimaryColor: ${textPrimaryColor},
textSecondaryColor: ${textSecondaryColor},
getCurrentStatus: ${getCurrentStatus},
appColorPrimary: ${appColorPrimary}
    ''';
  }
}
