import 'dart:convert';
import 'package:appscrip_task/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class UserProvider extends ChangeNotifier {
  List<User> users = [];
  List<User> filteredUsers = [];
  bool isLoading = false;
  bool hasFetchedData = false;
  String? errorMessage;

  Future<void> fetchUsers() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        users = data.map((json) => User.fromJson(json)).toList();
        filteredUsers = List.from(users);
         hasFetchedData = true;
      } else {
        errorMessage = 'Failed to load users';
      }
    } catch (e) {
      errorMessage = 'Something went wrong';
    }

    isLoading = false;
    notifyListeners();
  }

  void filterUsers(String query) {
    if (query.isEmpty) {
      filteredUsers = List.from(users);
    } else {
      filteredUsers = users
          .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}