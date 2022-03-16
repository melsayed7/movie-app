import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPreferences;

  static init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData({
    required String key,
    required int value,
  }) async
  {
    return await sharedPreferences!.setInt(key, value);
  }

  static int? getData({
    required String key,
  })
  {
    return sharedPreferences!.getInt(key);
  }
}