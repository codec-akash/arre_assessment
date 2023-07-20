import 'package:arre_assessment/utils/keys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ThemeProvider extends StateNotifier<bool> {
  ThemeProvider() : super(true) {
    getDataFromHive();
  }

  Future<void> toggle() async {
    state = !state;
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
    var box = await openHiveBox(Keys.hiveBoxName);
    if (box.containsKey(Keys.themeKeyName)) {
      var data = box.get(Keys.themeKeyName);
      state = data;
    }
  }

  Future<void> updateHive() async {
    var box = await openHiveBox(Keys.hiveBoxName);
    box.put(Keys.themeKeyName, state);
    box.close();
  }
}

final themeProvider =
    StateNotifierProvider<ThemeProvider, bool>((ref) => ThemeProvider());
