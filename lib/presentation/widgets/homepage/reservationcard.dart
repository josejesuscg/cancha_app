import 'package:cancha_app/domain/models/reservation_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class CardReservationWidget extends StatelessWidget {
  Reservation reservation;
  CardReservationWidget({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        color: Colors.green[400],
        child: Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/cancha-A.jpg',
                width: MediaQuery.of(context).size.width * .20,
                height: MediaQuery.of(context).size.width * .20,
                fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nombre: ${reservation.nameUser}', style: Theme.of(context).textTheme.subtitle2,),
                  Text('Cancha: ${reservation.nameCourt}', style: Theme.of(context).textTheme.subtitle2,),
                  Text('Fecha: ${DateFormat.yMd().format(reservation.date!)}', style: Theme.of(context).textTheme.subtitle2,),
                  
                ],
              ),
               Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Tiempo', style: Theme.of(context).textTheme.subtitle2,),
                  Text('${reservation.weather} ')
                ],
              )
            ],
          ),

        ),
      ),
    );
  }
}