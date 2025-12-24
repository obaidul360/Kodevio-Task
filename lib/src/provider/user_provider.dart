import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../service/api_service.dart';

class UserProvider extends ChangeNotifier {
  List<User> _users = [];
  List<User> filteredUsers = [];
  bool isLoading = false;
  String? error;

  List<User> get users => filteredUsers;

  Future<void> loadUsers() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      _users = await ApiService.fetchUsers();
      filteredUsers = _users;
    } catch (e) {
      error = 'Failed to load users';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void search(String query) {
    filteredUsers = _users
        .where((u) =>
        u.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
