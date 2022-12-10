import 'package:cancha_app/domain/provider/config/providers.dart';
import 'package:cancha_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:cancha_app/presentation/routes/route_generator.dart';
import 'package:provider/provider.dart';
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getProviderList(),
      child: MaterialApp(
        title: 'Cancha App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: '/HomeCourt',
        theme: getThemeData(),
      ),
    );
  }
}
