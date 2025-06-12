import 'dart:convert';
import 'package:http/http.dart' as http;

class UtilsResponse {
  final int statusCode;
  final dynamic data;
  final String? message;

  UtilsResponse({required this.statusCode, required this.data, this.message});
}

class Utilsservice {
  Future<UtilsResponse> sendOtp(String email) async {
    try {
      return UtilsResponse(statusCode: 201, data: null, message: "");
    } catch (e) {
      return UtilsResponse(
        statusCode: 500,
        data: null,
        message: "Erreur serveur",
      );
    }
  }

  Future<UtilsResponse> sendMail(String to, String subject, String text) async {
    try {
      return UtilsResponse(statusCode: 201, data: null, message: "");
    } catch (e) {
      return UtilsResponse(
        statusCode: 500,
        data: null,
        message: "Erreur serveur",
      );
    }
  }
}
