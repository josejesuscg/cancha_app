import 'package:cancha_app/data/remote/weather_service.dart';
import 'package:cancha_app/domain/models/reservation_model.dart';
import 'package:cancha_app/domain/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cancha_app/domain/models/contents/court_contents.dart';

import '../models/court_model.dart';
import '../../data/local/db_provider.dart';

class ReservationProvider extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  Reservation? reservation = Reservation();
  List<Reservation> reservations = [];
  Weather? weather;
  PageController pageController =PageController(viewportFraction: 0.8);
  final  formKey = GlobalKey<FormState>();
  List<Court> courtsList = [];
  DateTime? dateTimeSelected;
  String? courtSelected;
  String? name;
  Climate? climate;
  int? rainPorcent = 0;



  void reservationSave(BuildContext context) async {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
    }
    var response = await checkAvailability();
    if (response) {
      var canchaTemp = courtsList.firstWhere((e) => e.name == courtSelected);
      await DBProvider.db.nuevaReserv(
        Reservation(
          date: dateTimeSelected!,
          nameUser: name!,
          weatherIcon: climate!.icon,
          weather: climate!.description,
          nameCourt: courtSelected!,
          address: canchaTemp.address,
          imgCourt: canchaTemp.imgCancha,
        ),
      );
      notifyListeners();
      // ignore: use_build_context_synchronously
      Navigator.popAndPushNamed(context, '/HomeCourt');

    }
  }
  Future<void> loadWheather(BuildContext context) async {
    var resp = await _weatherService.getWeather();
    if(resp.data != null){
      weather = resp;
    }
    initCourts();
  }
  
  void initCourts() {
    courtsList.addAll(courtsData);
    notifyListeners();
  }

  Future<List<Reservation>>cargarReservs() async {
    final reservations = await DBProvider.db.getAllReservs();
    this.reservations = [...reservations!];
    notifyListeners();
    return reservations;
  }

  borrarReserv(int id,) async {
     await DBProvider.db.deleteReserv(id);
  }

   Future<bool> checkAvailability() async {
     reservations = await cargarReservs();
     var resp = reservations.where((e) {
       return DateFormat.yMd().format(e.date!) == DateFormat.yMd().format(dateTimeSelected!) &&
           e.nameCourt == courtSelected;
     });
     if (resp.length <= 2) {
       return true;
     } else {
       return false;
     }
   }

   void selectDate(DateTime date)  {
    dateTimeSelected = date;
    // ignore: unrelated_type_equality_checks
    var _day = weather!.data.firstWhere((e) => e.datetime == date,
      orElse: () => weather!.data.last,
    );
    climate = _day.weather;
    rainPorcent = _day.precPorcent;
    notifyListeners();
  }

   // ignore: unnecessary_question_mark
   void selectCourt(dynamic? value) {
    courtSelected = value;
    notifyListeners();
  }

   void onChangedName(String value) {
    name = value;
    notifyListeners();
  }
  

}

