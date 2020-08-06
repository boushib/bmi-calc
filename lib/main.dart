import 'package:bmi_calculator/views/profile.dart';
import 'package:bmi_calculator/views/result.dart';
import 'package:flutter/material.dart';
import 'views/home-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff314047),
        accentColor: Colors.indigoAccent,
        fontFamily: 'Roboto',
        backgroundColor: Colors.indigo,
        scaffoldBackgroundColor: Color(0xff263140),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/results': (context) => ResultPage(),
      },
    );
  }
}
