import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() add;
  const Resposta(
    this.add, {
    this.texto = "resposta",
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 10.0),
      width: double.infinity,
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: Colors.blueAccent,
        child: Text(
          texto,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: add,
      ),
    );
  }
}
