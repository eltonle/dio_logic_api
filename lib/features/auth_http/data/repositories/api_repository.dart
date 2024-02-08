import 'dart:convert';

import 'package:dio_logic_api/features/auth_http/data/models/login_model.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    print(requestModel);
    var postJson = requestModel.toJson();
    String url = 'https://reqres.in/api/login';
    try {
      var response = await http.post(
        Uri.parse(url),
        body: postJson,
      );
      if (response.statusCode == 200 || response.statusCode == 400) {
        return LoginResponseModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('failed to load data');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
