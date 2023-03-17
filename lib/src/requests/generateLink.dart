import 'dart:convert';
import 'dart:io';

import 'package:gaviota_app/src/variables/variables.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class GenerateLink {
  Future<String> GenerateSellLink () async {
    var url = Uri.parse("${Variables().baseUrl}/api/generateLink");
    final Map<String, String> headers = {
      HttpHeaders.authorizationHeader: token,
    };
    final response = await http.get(url, headers: headers);
    final decodedResp = jsonDecode(response.body);
    print(decodedResp);
    if (decodedResp["succes"] != "") {
      return decodedResp["succes"];
    }else {
      return decodedResp["error"];
    }
  }
}