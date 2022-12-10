import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../home_provider.dart';
import '../reservation_provider.dart';

List<SingleChildWidget> getProviderList(){
  return [
    ChangeNotifierProvider(create: (BuildContext context) => HomeProvider(),),
    ChangeNotifierProvider(create: (BuildContext context) => ReservationProvider(),)
  ];
}