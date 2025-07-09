import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  User? _currentUser;

  Future<bool> register(User newUser) async {
    final prefs = await SharedPreferences.getInstance();
    final usersData = prefs.getStringList('users') ?? [];

    // Check duplicate email
    for (var u in usersData) {
      final user = User.fromJson(jsonDecode(u));
      if (user.email == newUser.email) {
        return false;
      }
    }

    usersData.add(jsonEncode(newUser.toJson()));
    await prefs.setStringList('users', usersData);
    return true;
  }

  Future<User?> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final usersData = prefs.getStringList('users') ?? [];

    for (var u in usersData) {
      final user = User.fromJson(jsonDecode(u));
      if (user.email == email && user.password == password) {
        _currentUser = user;
        await prefs.setString('loggedInUser', jsonEncode(user.toJson()));
        return user;
      }
    }

    return null;
  }

  Future<User?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('loggedInUser');
    if (userData != null) {
      _currentUser = User.fromJson(jsonDecode(userData));
    }
    return _currentUser;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('loggedInUser');
    _currentUser = null;
  }
}
