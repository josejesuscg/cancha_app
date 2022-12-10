import 'package:flutter/material.dart';

class AddReservationButtonWidget extends StatelessWidget {
  const AddReservationButtonWidget({required this.onPressed, Key? key,}) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
   return MaterialButton(
      elevation: 1,
      onPressed: onPressed,
      child: const Icon(Icons.add, size: 35, color: Colors.green,),
    );
  }
}
