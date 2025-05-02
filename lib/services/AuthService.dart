import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthResponse {
  final int statusCode;
  final dynamic data;
  final String? message;

  AuthResponse({
    required this.statusCode,
    required this.data,
    this.message,
  });
}

class AuthService {
  Future<AuthResponse> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.51.174:3000/authentification/login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      
      final body = jsonDecode(response.body);
      
      return AuthResponse(
        statusCode: response.statusCode,
        data: body,
        message: body['message'],
      );
    } catch (e) {
      print("Erreur: $e");
      return AuthResponse(
        statusCode: 500,
        data: null,
        message: "Une erreur s'est produite: $e",
      );
    }
  }

  Future<AuthResponse> signup(
    String email,
    String password,
    String firstname,
    String lastname,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.51.174:3000/authentification/signup"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'firstname': firstname,
          'lastname': lastname,
        }),
      );
      
      final body = jsonDecode(response.body);
      
      return AuthResponse(
        statusCode: response.statusCode,
        data: body,
        message: body['message'],
      );
    } catch (e) {
      print("Erreur: $e");
      return AuthResponse(
        statusCode: 500,
        data: null,
        message: "Une erreur s'est produite: $e",
      );
    }
  }
}