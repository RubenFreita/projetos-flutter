import 'package:flutter/material.dart';
import 'package:projeto_perguntas/pages/bodypage.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(
          key: key,
        );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Perguntas",
        ),
      ),
      body: const Center(
        child: BodyPage(),
      ),
    );
  }
}
