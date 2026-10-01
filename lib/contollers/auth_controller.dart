import 'package:shared_preferences/shared_preferences.dart';

import '../data/dummy_data.dart';

class AuthController {
  // LOGIN
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    final inputEmail = email.trim().toLowerCase();
    final inputPassword = password.trim();

    final user = dummyUsers.firstWhere(
      (user) =>
          user['email']?.toString().toLowerCase() ==
              inputEmail &&
          user['password']?.toString() ==
              inputPassword,
      orElse: () => {},
    );

    if (user.isEmpty) {
      return false;
    }

    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setBool(
      'is_logged_in',
      true,
    );

    return true;
  }

  // CEK APAKAH USER SUDAH LOGIN
  static Future<bool> isLoggedIn() async {
    final prefs =
        await SharedPreferences.getInstance();

    return prefs.getBool(
          'is_logged_in',
        ) ??
        false;
  }

  // LOGOUT
  static Future<void> logout() async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setBool(
      'is_logged_in',
      false,
    );
  }

  // CEK APAKAH ONBOARDING SUDAH PERNAH DILIHAT
  static Future<bool> isOnboardingSeen() async {
    final prefs =
        await SharedPreferences.getInstance();

    return prefs.getBool(
          'onboarding_seen',
        ) ??
        false;
  }

  // SIMPAN STATUS ONBOARDING
  static Future<void> completeOnboarding() async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setBool(
      'onboarding_seen',
      true,
    );
  }
}