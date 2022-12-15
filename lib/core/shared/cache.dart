abstract class Cache {
  Future setString(String key, String value);

  Future<String?> getString(String key);

  Future setInt(String key, int value);

  Future<int?> getInt(String key);

  Future setBool(String key, bool value);

  Future<bool?> getBool(String key);

  Future remove(String key);
}
