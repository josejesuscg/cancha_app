import 'package:cancha_app/presentation/widgets/homepage/add_reservation.dart';
import 'package:cancha_app/presentation/widgets/homepage/reservationcard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/provider/reservation_provider.dart';

class HomeCourtPage extends StatefulWidget {

  const HomeCourtPage({Key? key}) : super(key: key);

  

  @override
  State<HomeCourtPage> createState() => _HomeCourtPageState();
}

class _HomeCourtPageState extends State<HomeCourtPage> {
  

  @override
  void initState() {
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ReservationProvider reservs = Provider.of<ReservationProvider>(context, listen: false);
      reservs.cargarReservs();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final reservationProvider = Provider.of<ReservationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Reservas'),
        actions: [
          AddReservationButtonWidget(onPressed: () async {
            await reservationProvider.loadWheather(context);
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushNamed('/ReservationCourt');
          } )
        ],
      ),
      body: reservationProvider.reservations.isEmpty
       ? SizedBox(
                 width: double.infinity,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Image.asset(
                       'assets/jugador.png',
                       width: MediaQuery.of(context).size.width * .50,
                     ),
                     const SizedBox(height: 20),
                     Text(
                       'No hay reservaciones disponibles',
                       style: Theme.of(context).textTheme.headline5
                     ),
                   ],
                 ),
               )
       : ListView.builder(
        itemBuilder: ((context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            background: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.red,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.delete, color: Colors.white,),
                      Text('Desliza para eliminar',style: Theme.of(context).textTheme.subtitle2,)
                    ],
                  ),
                ),
              ),
            ),
            onDismissed: (direction) {
              //Llamamos a provider con funcion para borrar de base de datos
              reservationProvider.borrarReserv(reservationProvider.reservations[index].id!);
            },
          child: CardReservationWidget(
            reservation: reservationProvider.reservations[index],
          ));
        }),
        itemCount: reservationProvider.reservations.length,
        )
    );
  }
}
