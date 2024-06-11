import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static const String tokenName = 'token-name';
  static const String tokenPassword = 'token-password';

  Future<bool> init() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final uid = pref.getString(tokenName);
    log('uid: $uid');
    if (uid != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> readData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final password = pref.getString(tokenPassword);
    log('password: $password');
    if (password != null) {
      return password;
    } else {
      return '';
    }
  }

  Future<void> setData(WitchToken witchToken, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (witchToken == WitchToken.uid) {
      await pref.setString(tokenName, value);
    } else {
      await pref.setString(tokenPassword, value);
    }
  }

  Future<void> removeData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(tokenName);
    await pref.remove(tokenPassword);
  }
}

enum WitchToken { uid, password }

final tokenService = TokenService();
