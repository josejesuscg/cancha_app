import 'package:flutter/material.dart';


class TextFieldReservation extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const TextFieldReservation({
    required this.onSaved,
    Key? key, required this.validator, required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onChanged,
        validator: validator,
        onSaved: onSaved,
        style: const TextStyle(fontWeight: FontWeight.bold),
        cursorColor: Colors.green,
        decoration: InputDecoration(
          
          suffixIcon: const Icon(Icons.person, color: Colors.green,),
          // suffixIconColor: Colors.green,
          label: const Text('Nombre',),
          labelStyle: const TextStyle(color: Colors.green),
          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2.0, color: Colors.green,),borderRadius: BorderRadius.circular(20),),
          enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2.0, color: Colors.green),borderRadius: BorderRadius.circular(20),),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
    );
  }
}