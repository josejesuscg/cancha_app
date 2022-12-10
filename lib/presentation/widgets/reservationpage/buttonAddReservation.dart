import 'package:flutter/material.dart';


class ButtonAddReservation extends StatelessWidget {
  const ButtonAddReservation({Key? key, required this.color, required this.text, required this.onPressed}) : super(key: key);

  final Color color;
  final Text text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: MaterialButton(
        elevation: 0,
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        color: color,
        shape: const StadiumBorder(),
        child: text,
      ),
    );
  }
}