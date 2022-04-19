import 'package:flutter/material.dart';
import 'package:viasudeste/library/navigation/routes_info.dart';
import 'package:viasudeste/src/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Via Sudeste',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        fontFamily: 'Cutive Mono',
      ),
      home: SplashScreen(),
      onGenerateRoute: (settings) {
        return RoutesInfo.getRoutes(settings);
      },
    );
  }
}