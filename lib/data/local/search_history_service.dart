import 'package:hive/hive.dart';

class SearchHistoryService {
  static const String boxName = 'searchHistoryBox';
  static const int maxItems = 5;

  // 1. Save a new search term
  Future<void> addSearchTerm(String term) async {
    final box = await Hive.openBox<String>(boxName);
    List<String> history = box.values.toList();

    // Remove if already exists (to move it to the front)
    history.remove(term);

    // Add to the start of the list
    history.insert(0, term);

    // Keep only the last 5
    if (history.length > maxItems) {
      history = history.sublist(0, maxItems);
    }

    // Clear and re-save
    await box.clear();
    await box.addAll(history);
  }

  // 2. Retrieve history for the UI
  Future<List<String>> getHistory() async {
    // Use openBox instead of box to ensure it's ready
    var box = await Hive.openBox<String>(boxName);
    return box.values.toList();
  }

  // Inside SearchHistoryService class
  Future<void> clearHistory() async {
    var box = await Hive.openBox<String>(boxName);
    await box.clear();
  }
}
