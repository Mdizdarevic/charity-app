import 'package:hive/hive.dart';

class SearchHistoryService {
  static const String boxName = 'searchHistoryBox';
  static const int maxItems = 5;

  Future<void> addSearchTerm(String term) async {
    final box = await Hive.openBox<String>(boxName);
    List<String> history = box.values.toList();

    history.remove(term);
    history.insert(0, term);

    if (history.length > maxItems) {
      history = history.sublist(0, maxItems);
    }
    await box.clear();
    await box.addAll(history);
  }

  Future<List<String>> getHistory() async {
    var box = await Hive.openBox<String>(boxName);
    return box.values.toList();
  }

  Future<void> clearHistory() async {
    var box = await Hive.openBox<String>(boxName);
    await box.clear();
  }
}
