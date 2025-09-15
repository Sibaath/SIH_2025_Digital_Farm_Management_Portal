import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl = 'http://10.0.2.2:8000/api/'; // Use 10.0.2.2 for Android emulator or your server IP

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${_baseUrl}login/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return {'success': true, 'message': 'Login successful'};
      } else {
        final error = jsonDecode(response.body);
        return {'success': false, 'message': error['detail'] ?? 'Invalid credentials'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Failed to connect to server: $e'};
    }
  }

  Future<Map<String, dynamic>> register(
      String name, String email, String password, String phone, String location) async {
    try {
      final response = await http.post(
        Uri.parse('${_baseUrl}register/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
          'location': location,
        }),
      );

      if (response.statusCode == 201) {
        return {'success': true, 'message': 'Registration successful'};
      } else {
        final error = jsonDecode(response.body);
        return {'success': false, 'message': error['detail'] ?? 'Registration failed'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Failed to connect to server: $e'};
    }
  }
}