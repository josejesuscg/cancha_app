import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerFieldReservation extends StatefulWidget {
  final void Function(DateTime?)? onSaved;
  final String? Function(DateTime?)? validator;
  final dynamic Function(DateTime) onSelected;
  const DatePickerFieldReservation({required this.onSaved, Key? key, required this.validator, required this.onSelected,
  }) : super(key: key);

  @override
  State<DatePickerFieldReservation> createState() =>
      _DatePickerFieldReservationState();
}

class _DatePickerFieldReservationState extends State<DatePickerFieldReservation> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? selectedDate;
  final format = DateFormat('dd-MM-yyy');

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      format: format,
      readOnly: true,
      controller: _dateController,
      validator: widget.validator,
      onSaved: widget.onSaved,
      onShowPicker: (context, currentValue) async  {
        DateTime? picked;
         picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2024));
         if (picked != null){
          setState(() {
            selectedDate = picked;
          _dateController.text = DateFormat.yMd().format(selectedDate!);
        });
        }
        
         return widget.onSelected(selectedDate!);
           
      },
      style: const TextStyle(fontWeight: FontWeight.bold),
      cursorColor: Colors.green,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2.0,
            color: Colors.green,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2.0, color: Colors.green),
          borderRadius: BorderRadius.circular(20),
        ),
        label: const Text('Fecha'),
        labelStyle: const TextStyle(color: Colors.green),
        suffixIcon: const Icon(
          Icons.date_range,
          color: Colors.green,
        ),
        // suffixIconColor: Colors.green,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
  
}
