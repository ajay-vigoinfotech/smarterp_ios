import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String _keyAuthToken = 'auth_token';
  static const String _keyUserId = 'user_id';
  static const String _keyIsLoggedIn = 'is_logged_in';

  // Save session data
  Future<void> saveSession(String authToken, String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAuthToken, authToken);
    await prefs.setString(_keyUserId, userId);
    await prefs.setBool(_keyIsLoggedIn, true);
  }

  // Retrieve auth token
  Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyAuthToken);
  }

  // Retrieve user ID
  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserId);
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  // Clear session
  Future<void> clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyAuthToken);
    await prefs.remove(_keyUserId);
    await prefs.setBool(_keyIsLoggedIn, false);
  }
}
