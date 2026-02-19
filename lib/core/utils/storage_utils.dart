import 'package:get_storage/get_storage.dart';

class StorageUtils {
  static final GetStorage _box = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
  }

  static T? read<T>(String key) {
    return _box.read<T>(key);
  }

  static Future<void> write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  static Future<void> remove(String key) async {
    await _box.remove(key);
  }

  static Future<void> clear() async {
    await _box.erase();
  }

  static bool hasKey(String key) {
    return _box.hasData(key);
  }

  static List<String> getKeys() {
    return _box.getKeys().cast<String>().toList();
  }

  static void listen(String key, void Function(dynamic) callback) {
    _box.listenKey(key, callback);
  }
}
