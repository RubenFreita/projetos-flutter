// ignore: file_names
import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  Questao(
    this.texto,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 70.0),
      width: double.infinity,
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 30.0,
        ),
      ),
    );
  }
}
