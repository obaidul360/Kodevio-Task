import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class ApiService {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
