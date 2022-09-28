import 'package:aco/src/screens/login.dart';
import 'package:aco/src/splash/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aco app',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 255, 61, 2),
        backgroundColor: Color.fromARGB(255, 233, 233, 233),
        primaryColorDark: Color.fromARGB(255, 51, 60, 82),
        disabledColor: Colors.grey,
        cardColor: Color.fromARGB(31, 255, 61, 2),
        errorColor: Color.fromARGB(255, 217, 14, 0),
      ),
      initialRoute: '/',
      routes: {
        "/": (BuildContext context) => LoginScreen(),
      },
    );
  }
}