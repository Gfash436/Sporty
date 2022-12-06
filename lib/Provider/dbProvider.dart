import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sporty/Screens/Authentication/loginPage.dart';

import '../../Utilities/routers.dart';

class DatabaseProvider extends ChangeNotifier {
  final Future<SharedPreferences> _ref = SharedPreferences.getInstance();

  String _emailToken = '';
  String _token = '';
  String _userId = '';

  String get emailToken => _emailToken;
  String get token => _token;
  String get userId => _userId;

  void saveEmailToken(String emailToken) async {
    SharedPreferences value = await _ref;

    value.setString('emailToken', emailToken);
  }

  void saveToken(String token) async {
    SharedPreferences value = await _ref;

    value.setString('token', token);
  }

  void saveUserId(String id) async {
    SharedPreferences value = await _ref;

    value.setString('id', id);
  }

  Future<String> getEmailToken() async {
    SharedPreferences value = await _ref;

    if (value.containsKey('emailToken')) {
      String data = value.getString('emailToken')!;
      _emailToken = data;
      notifyListeners();
      return data;
    } else {
      _emailToken = '';
      notifyListeners();
      return '';
    }
  }

  Future<String> getToken() async {
    SharedPreferences value = await _ref;

    if (value.containsKey('token')) {
      String data = value.getString('token')!;
      _token = data;
      notifyListeners();
      return data;
    } else {
      _token = '';
      notifyListeners();
      return '';
    }
  }

  Future<String> getUserId() async {
    SharedPreferences value = await _ref;

    if (value.containsKey('userId')) {
      String data = value.getString('userId')!;
      _userId = data;
      notifyListeners();
      return data;
    } else {
      _userId = '';
      notifyListeners();
      return '';
    }
  }

  void logOut(BuildContext context) async {
    final value = await _ref;

    value.clear();
    PageNavigator(ctx: context).nextPageOnly(page: const LoginPage());
  }
}
