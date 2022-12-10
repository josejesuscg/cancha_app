import 'package:intl/intl.dart';
class Weather {
  List<Day> data;

  Weather({required this.data});
  
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        data: List<Day>.from(json["data"].map((e) => Day.fromJson(e))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data' : List<dynamic>.from(data.map((e) => e.toJson()))
    };
  }
}
class Day {
  DateTime datetime;
  int precPorcent;
  Climate weather;


  Day({ required this.datetime, required this.weather, required this.precPorcent});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
        datetime: DateTime.parse(json["datetime"]),
        precPorcent: json["pop"],
        weather: json['weather'] != null ? Climate.fromJson(json['weather']) : Climate.fromJson({}),
      );
    }

  Map<String, dynamic> toJson() {
    return {
        "datetime" : datetime,
        "weather"  : weather,
        "pop"      :  precPorcent
    };
  }
}

 class Climate {
  String description;
  String icon;

   Climate({ required this.icon, required this.description,});

   factory Climate.fromJson(Map<String, dynamic> json) {
   return Climate(
         icon: json["icon"],
         description: json["description"],
       );
   }

   Map<String, dynamic> toJson() {
   return {
         "icon": icon,
         "description": description,
       };
  }
 }