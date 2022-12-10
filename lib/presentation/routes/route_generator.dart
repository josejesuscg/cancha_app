import 'package:cancha_app/presentation/views/home.dart';
import 'package:cancha_app/presentation/views/reservation.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/HomeCourt':
        return MaterialPageRoute(builder: (context) => const HomeCourtPage());
      case '/ReservationCourt':
        return MaterialPageRoute(builder: (context) => const ReservationCourtPage());
       default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }

    
}