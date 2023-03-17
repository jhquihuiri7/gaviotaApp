import 'package:gaviota_app/src/variables/variables.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/login_model.dart';
class Authentication {

  Future<LoginModel> Login (String user , String password)async{
    var url = Uri.parse("${Variables().baseUrl}api/login");
    final Map<String, dynamic> authData = {
      'user': user,
      'password': password,
    };
    final response = await http.post(url, body: json.encode(authData));

    final decodedResp = jsonDecode(response.body);

    return LoginModel.fromJson(decodedResp);
  }
  Future<LoginModel> ValidateToken (String token)async{
    var url = Uri.parse("${Variables().baseUrl}api/validateToken");
    final Map<String, String> headersData = {
      'Authorization': token,
    };
    final response = await http.get(url, headers: headersData);

    final decodedResp = jsonDecode(response.body);

    return LoginModel.fromJson(decodedResp);
  }
}