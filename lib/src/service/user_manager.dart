import 'package:shared_preferences/shared_preferences.dart';

class UserManage {
  late final SharedPreferences preferences;

  static const String uidKey = "uid-key";

  Future<bool> init() async {
    preferences = await SharedPreferences.getInstance();
    final uid = preferences.getString(uidKey);
    return uid != null;

    // if (uid !=null) {
    //   return true;
    // }else {
    //   return false;
    // }
  }

  Future<void> setUid(String uid) async {
    await preferences.setString(uidKey, uid);
  }

  Future<void> removeUid() async {
    await preferences.remove(uidKey);
  }
}

final userManage = UserManage();
