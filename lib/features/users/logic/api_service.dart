import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/user_model.dart';

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  Future<void> updateUser(int id, Map<String, dynamic> data) async {
    print(data);
    print(json.encode(data));
    final response = await http.put(
      Uri.parse('$baseUrl/users/$id'),
      body: json.encode(data),
      // body: {"id":"1","name":"Bhai","email":"Sincere@april.biz"},
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
  }
}
