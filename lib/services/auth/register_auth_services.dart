import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/authentication.dart';

Future<User?> register(
    String name, String email, String password, String confirmationPass) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ApiResponse apiResponse = ApiResponse();

  Map<String, String> header = {
    'Postman-Token': '<calculated when request is sent>',
  };

  try {
    final response =
        await http.post(Uri.parse(registerURL), headers: header, body: {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmationPass
    });

    final responseConverted =
        Authentication.fromJson(jsonDecode(response.body));

    String token = responseConverted.token;
    pref.setString('token', token);
    if (kDebugMode) {
      print('token $token');
    }

    return responseConverted.user;
  } catch (e) {
    if (kDebugMode) {
      print('Terjadi kesalahan!');
      print('Exception : $e');
    }
  }

  return null;
}