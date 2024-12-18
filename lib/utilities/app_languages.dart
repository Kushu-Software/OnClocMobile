import 'package:nb_utils/nb_utils.dart';

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(
        id: 1,
        name: 'English',
        languageCode: 'en',
        fullLanguageCode: 'en-US',
        flag: 'images/flag/ic_us.png'),
    LanguageDataModel(
        id: 2,
        name: 'French',
        languageCode: 'fr',
        fullLanguageCode: 'fr-FR',
        flag: 'images/flag/ic_fr.png'),
    LanguageDataModel(
        id: 3,
        name: 'Spanish',
        languageCode: 'es',
        fullLanguageCode: 'es-ES',
        flag: 'images/flag/ic_es.png'),
  ];
}
