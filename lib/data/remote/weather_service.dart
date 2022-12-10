// ignore: depend_on_referenced_packages
import 'dart:convert';
import 'package:cancha_app/api/api_config.dart';
import 'package:cancha_app/domain/models/weather_model.dart';
import 'package:http/http.dart' as http;
class WeatherService {
  //api key weatherbit
  //9b563b9b19174a4fadc0b33e53a488e7

  Future<Weather> getWeather() async {
    try {
      final queryParams = {
        'key' : '9b563b9b19174a4fadc0b33e53a488e7',
        'lat' : '10.500',
        'lon' : '-66.916',
        'lang': 'es'
    };
      final uri = Uri.https(ApiConfig.baseUrl, '/v2.0/forecast/daily', queryParams);
      final response = await http.get(uri);
      if(response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));

      } else {
          throw Exception('Can not get weather');
        }
    }
    catch(e){
      rethrow;
      
    }
    
  }
}