import 'dart:convert';
import 'dart:io';
import 'package:gaviota_app/main.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../variables/variables.dart';
import '../models/daily_model.dart';

class DailyReserves {
  Future<List<DailyModel>> Daily (DateTime date, String ship)async{
    var url = Uri.parse("${Variables().baseUrl}/api/getReservesDaily?book=${ship}");
    final format = DateFormat('yyyy-MM-dd');

    final Map<String, dynamic> body = {
      'date': "${format.format(date)}T00:00:00.000+00:00".replaceAll("/", "-"),
    };
    final Map<String, String> headers = {
      HttpHeaders.authorizationHeader: token,
    };
    final response = await http.post(url, body: json.encode(body), headers: headers);
    final decodedResp = jsonDecode(response.body);
    List<DailyModel> models = DailyModels().Models(decodedResp);
    return models;
  }
}
