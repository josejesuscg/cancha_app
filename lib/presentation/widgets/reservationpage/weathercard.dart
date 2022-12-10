import 'package:flutter/material.dart';
// ignore: must_be_immutable
class WeatherCardWidget extends StatelessWidget {
  int precPorcent;
  WeatherCardWidget({ Key? key, required this.precPorcent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
          height: MediaQuery.of(context).size.width * .25,
          width: MediaQuery.of(context).size.width * .25,
          padding: const EdgeInsets.all(10),
          color: Colors.grey[400],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Probabilidad de lluvia', style: Theme.of(context).textTheme.subtitle1, textAlign: TextAlign.center,),
              Text('% $precPorcent', style: Theme.of(context).textTheme.headline5,)
            ],
          ),
        ),
    );
  }
}