

import 'package:cancha_app/domain/provider/reservation_provider.dart';
import 'package:cancha_app/presentation/widgets/reservationpage/buttonAddReservation.dart';
import 'package:cancha_app/presentation/widgets/reservationpage/dropdowncourt.dart';
import 'package:cancha_app/presentation/widgets/reservationpage/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/reservationpage/datePicker.dart';
import '../widgets/reservationpage/weathercard.dart';

class ReservationCourtPage extends StatefulWidget {
  const ReservationCourtPage({Key? key}) : super(key: key);
 
  @override
  State<ReservationCourtPage> createState() => _ReservationCourtPageState();
}
class _ReservationCourtPageState extends State<ReservationCourtPage> {
  @override
  Widget build(BuildContext context) {
    final reservationProvider = Provider.of<ReservationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear reservación'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: reservationProvider.formKey,
              child: Column(
                children: [
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: DropDownButtonCourt(
                      onChanged: reservationProvider.selectCourt,
                      validator: (input) => input!.isEmpty ? 'Seleccione una cancha' : null,
                      onSaved: (input) => reservationProvider.reservation!.nameCourt = input,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: TextFieldReservation(
                      onChanged: reservationProvider.onChangedName,
                      validator: (input) => input!.isEmpty ? 'Ingresa un nombre' : null,
                      onSaved: (value) => reservationProvider.reservation!.nameUser = value
                      ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                   child: DatePickerFieldReservation(
                      //ignore: unnecessary_null_comparison
                     onSelected: reservationProvider.selectDate,
                     validator: (input) => input == null ?  'Seleccione una fecha' : null,
                     onSaved: (input) => reservationProvider.reservation!.date = input),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                     child: Visibility(
                      visible: reservationProvider.dateTimeSelected != null,
                      child: WeatherCardWidget(
                        precPorcent: reservationProvider.rainPorcent!,
                      ),
                  ),
                   ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ButtonAddReservation(
                      color: Colors.green, 
                      text: Text('Reservar', 
                      style: Theme.of(context).textTheme.headline2,), 
                      onPressed: () async {
                        reservationProvider.reservationSave(context);
                      }),
                  ),
                ],
              ),
            ),
          ],
        )),
    );
   
  }
}

