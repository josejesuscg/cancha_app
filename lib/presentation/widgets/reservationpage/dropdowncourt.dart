import 'package:flutter/material.dart';
import 'package:cancha_app/domain/models/contents/court_contents.dart';

class DropDownButtonCourt extends StatefulWidget {
  // ignore: unnecessary_question_mark
  final void Function(dynamic?)? onSaved;
  // ignore: unnecessary_question_mark
  final String? Function(dynamic?)? validator;
  // ignore: unnecessary_question_mark
  final Function(dynamic?) onChanged;
  
  const DropDownButtonCourt({Key? key, required this.onSaved, required this.validator, required this.onChanged,}) : super(key: key);

  @override
  State<DropDownButtonCourt> createState() => _DropDownButtonCourtState();

}

class _DropDownButtonCourtState extends State<DropDownButtonCourt> {
  String? _selected;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.green),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonFormField<dynamic>(
                  validator: widget.validator,
                  onSaved: widget.onSaved,
                  hint: const Text('Seleccione una cancha', style:  TextStyle(color: Colors.green),),
                  value: _selected,
                  decoration: const InputDecoration(border: InputBorder.none),
                  items: courtsData.map((courtItem) {
                    return DropdownMenuItem<dynamic>(
                      value: courtItem.name,
                      child: Row(
                        children: [
                          Image.asset(
                            courtItem.imgCancha!,
                            width: 60,
                            ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(courtItem.name!, style: const TextStyle(color: Colors.green),),
                          )
                        ],
                      ));
                  }).toList(),
                  onChanged: widget.onChanged
                  ),
              )
            ) 
          )
        ],
      ),
    );
  }
}
