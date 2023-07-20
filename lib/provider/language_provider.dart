import 'package:arre_assessment/model/language_model.dart';
import 'package:arre_assessment/repository/language_repo.dart';
import 'package:arre_assessment/utils/keys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LanguageNotifier extends StateNotifier<List<Language>> {
  LanguageNotifier(this.languageRepo) : super([]) {
    getLanguages();
  }

  LanguageRepo languageRepo;
  String? selectedLanguage;

  Future<void> getLanguages() async {
    languageRepo.fetchLanguage().then((value) {
      state = value;
    });
    getDataFromHive();
  }

  Future<void> updateLanguage(String selectedLan) async {
    selectedLanguage = selectedLan;
    await updateHive();
  }

  Future<Box> openHiveBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      var path = (await getApplicationDocumentsDirectory()).path;
      Hive.init(path);
    }

    return await Hive.openBox(boxName);
  }

  Future<void> getDataFromHive() async {
    var box = await openHiveBox(Keys.hiveLanBox);
    if (box.containsKey(Keys.languageKeyName)) {
      var data = box.get(Keys.languageKeyName);
      selectedLanguage = data;
    }
    box.close();
  }

  Future<void> updateHive() async {
    var box = await openHiveBox(Keys.hiveLanBox);
    box.put(Keys.languageKeyName, selectedLanguage);
    box.close();
  }
}

final languageProvider =
    StateNotifierProvider<LanguageNotifier, List<Language>>(
        (ref) => LanguageNotifier(LanguageRepo()));
