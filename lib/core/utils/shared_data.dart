import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void saveToken({required String token}) async {
    await prefs?.setString('token', token);
  }

  static void saveUserId({required String userId}) async {
    await prefs?.setString('userId', userId);
  }

  static void saveLocalUserImage({required String userLocalImage}) async {
    await prefs?.setString('userLocalImage', userLocalImage);
  }
  static void saveUserImage({required String userImage}) async {
    await prefs?.setString('userImage', userImage);
  }

  static void saveUserPhone({required String userPhone}) async {
    await prefs?.setString('userPhone', userPhone);
  }

  static void saveUserName({required String userName}) async {
    await prefs?.setString('userName', userName);
  }

  static void saveLan({required String lan}) async {
    await prefs?.setString('lan', lan);
  }

  static void saveUserEmail({required String userEmail}) async {
    await prefs?.setString('userEmail', userEmail);
  }

  static void saveIsLogin({required bool isLogin}) async {
    await prefs?.setBool('isLogin', isLogin);
  }

  static String? getToken() {
    return prefs?.getString('token');
  }

  static String? getUserId() {
    return prefs?.getString('userId');
  }

  static String? getLocalUserImage() {
    return prefs?.getString('userLocalImage');
  }
  static String? getUserImage() {
    return prefs?.getString('userImage');
  }

  static String? getUserPhone() {
    return prefs?.getString('userPhone');
  }

  static String? getUserName() {
    return prefs?.getString('userName');
  }

  static String? getUserLan() {
    return prefs?.getString('lan');
  }

  static String? getUserEmail() {
    return prefs?.getString('userEmail');
  }

  static int? getUserAge() {
    return prefs?.getInt('userAge');
  }

  static bool? getIsLogin() {
    return prefs?.getBool('isLogin');
  }

  static Future<bool>? removeData(String key) {
    return prefs?.remove(key);
  }
}
