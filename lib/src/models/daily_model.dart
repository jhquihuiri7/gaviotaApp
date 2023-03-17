import 'dart:convert';

class DailyModels {
   List<DailyModel> Models (List<dynamic> json){
     List<DailyModel> models = [];
     json.forEach((element) {
      DailyModel modelTemp = DailyModel.fromJson(element);
      models.add(modelTemp);
    });
   return models;
  }
}

DailyModel dailyModelFromJson(String str) => DailyModel.fromJson(json.decode(str));

String dailyModelToJson(DailyModel data) => json.encode(data.toJson());

class DailyModel {
  DailyModel({
    required this.id,
    required this.reserve,
    required this.passenger,
    required this.reference,
    required this.user,
    required this.age,
    required this.date,
    required this.time,
    required this.passport,
    required this.country,
    required this.price,
    required this.ship,
    required this.route,
    required this.isConfirmed,
    required this.isPayed,
    required this.notes,
  });

  String id;
  String reserve;
  String passenger;
  String reference;
  String user;
  int age;
  DateTime date;
  String time;
  String passport;
  String country;
  int price;
  String ship;
  String route;
  bool isConfirmed;
  bool isPayed;
  String notes;

  factory DailyModel.fromJson(Map<String, dynamic> json) => DailyModel(
    id: json["id"],
    reserve: json["reserve"],
    passenger: json["passenger"],
    reference: json["reference"],
    user: json["user"],
    age: json["age"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
    passport: json["passport"],
    country: json["country"],
    price: json["price"],
    ship: json["ship"],
    route: json["route"],
    isConfirmed: json["isConfirmed"],
    isPayed: json["isPayed"],
    notes: json["notes"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reserve": reserve,
    "passenger": passenger,
    "reference": reference,
    "user": user,
    "age": age,
    "date": date.toIso8601String(),
    "time": time,
    "passport": passport,
    "country": country,
    "price": price,
    "ship": ship,
    "route": route,
    "isConfirmed": isConfirmed,
    "isPayed": isPayed,
    "notes":notes,
  };
}
