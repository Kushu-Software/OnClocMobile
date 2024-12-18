import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:on_cloc_mobile/locale/language_en.dart';
import 'package:on_cloc_mobile/locale/language_fr.dart';
import 'package:on_cloc_mobile/locale/languages.dart';

class OnClocLocalizations extends LocalizationsDelegate<BaseLanguage>{
  const OnClocLocalizations();

  @override
  Future<BaseLanguage> load(Locale locale) async {
    switch(locale.languageCode){
      case 'en':
        return LanguageEn();
      case 'fr':
        return LanguageFr();
      default:
        return LanguageEn();
    }
  }

  @override
  bool isSupported(Locale locale) => LanguageDataModel.languages().contains(locale.languageCode);

  @override 
  bool shouldReload(LocalizationsDelegate<BaseLanguage> old) => false;
}