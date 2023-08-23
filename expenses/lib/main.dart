import './pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main(List<String> args) {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  ExpensesApp({Key? key}) : super(key: key);
  final tema = ThemeData(brightness: Brightness.light);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: tema.textTheme.copyWith(
          headline6: const TextStyle(
              fontSize: 20,
              fontFamily: "OpenSans",
              fontWeight: FontWeight.bold,
              color: Colors.black),
          headline1: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 18,
            color: Color(0xFF4A148C),
            fontWeight: FontWeight.bold,
          ),
          headline4: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 16,
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: tema.appBarTheme.copyWith(
          titleTextStyle: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
