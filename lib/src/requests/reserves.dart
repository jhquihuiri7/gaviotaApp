import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../variables/variables.dart';

class Reserves {
  Future<String> DeleteReserve (String id)async{
    var url = Uri.parse("${Variables().baseUrl}/api/deleteReserve");
    final Map<String, dynamic> body = {
      'id': id,
    };
    List<Map<String, dynamic>> listBody = [];
    listBody.add(body);
    final Map<String, String> headers = {
      HttpHeaders.authorizationHeader: token,
    };
    final response = await http.post(url, body: json.encode(listBody), headers: headers);
    final decodedResp = jsonDecode(response.body);
    return decodedResp["succes"];
  }
}