import 'package:arre_assessment/model/language_model.dart';

class LanguageRepo {
  Future<List<Language>> fetchLanguage() async {
    List<Language> languages =
        (lanJson).map((json) => Language.fromJson(json)).toList();

    return languages;
  }

  var lanJson = [
    {
      "title": "English",
      "titleEnglish": "",
    },
    {
      "title": "हिन्दी",
      "titleEnglish": "(Hindi)",
    },
    {
      "title": "ગુજરાતી",
      "titleEnglish": "(Gujrati)",
    },
    {
      "title": "বাংলা",
      "titleEnglish": "(Bangla)",
    },
    {
      "title": "తెలుగు",
      "titleEnglish": "(Telugu)",
    },
    {
      "title": "മലയാളം",
      "titleEnglish": "(Malayalam)",
    },
    {
      "title": "मराठी",
      "titleEnglish": "(Marathi)",
    },
    {
      "title": "தமிழ்",
      "titleEnglish": "(Tamil)",
    },
  ];
}
