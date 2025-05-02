import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.124.174:3000/authentification/login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      print(" Voici le statusCode: ${response.statusCode}");
      if (response.statusCode == 201) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        final body = jsonDecode(response.body);
        return {"message": body['message']};
      } else {
        print("Aiza le dev flutter confirmé e");
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> signup(
    String email,
    String password,
    String firstname,
    String lastname,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.124.174:3000/authentification/signup"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
          'firstname': firstname,
          'lastname': lastname,
        }),
      );
      if (response.statusCode == 201) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
