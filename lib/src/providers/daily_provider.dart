import 'package:flutter/material.dart';
import 'package:gaviota_app/src/models/daily_model.dart';
import 'package:provider/provider.dart';


class DailyProvider extends ChangeNotifier {
  String _date = DateTime.now().toString().substring(0,10);
  String get Date => _date;
  set Date(String value){
    _date = value;
    notifyListeners();
  }

  bool _loadingData = false;
  bool get LoadingData => _loadingData;
  set LoadingData(bool value){
    _loadingData = value;
    notifyListeners();
  }

  List<DailyModel> _models = [];
  List<DailyModel> get GetModels => _models;
  set GetModels (List<DailyModel>   value){
    _models = value;
  }
  set RemoveModel (DailyModel value){
    _models.remove(value);
    notifyListeners();
  }

  List<DailyModel> _modelsOther = [];
  List<DailyModel> get GetModelsOther => _modelsOther;
  set GetModelsOther (List<DailyModel> value){
    _modelsOther = value;
  }
  set RemoveModelOther (DailyModel value){
    _modelsOther.remove(value);
    notifyListeners();
  }

  bool _isAm = true;
  String get GetTimeString => (GetTime) ? "Am": "Pm";
  bool get GetTime => _isAm;
  set GetTime(bool value){
    _isAm = value;
    notifyListeners();
  }

  List<int> _conteo = [0,0];
  List<int> get conteo => _conteo;
  set conteo(List<int> value){
    int n = 0;
    _models.forEach((element) { if (element.time == "Am"){n++;}});
    conteo[0]= n;
    n =0;
    _models.forEach((element) { if (element.time == "Pm"){n++;}});
    conteo[1]= n;
  }
}