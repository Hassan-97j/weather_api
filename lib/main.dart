import 'package:flutter/material.dart';
import 'package:weather_api/Weather.dart';
import 'themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0A0F25),
        scaffoldBackgroundColor: Color(0xFF0A0F25),
        appBarTheme: AppBarTheme(
          color: primaryColor,
          textTheme: TextTheme(
            title: TextStyle(
            color: Colors.blueGrey,
              fontSize: 24,
            )
          )
        )
      ),
      title: 'Weather',
      home: Home(),
    );
  }
}
