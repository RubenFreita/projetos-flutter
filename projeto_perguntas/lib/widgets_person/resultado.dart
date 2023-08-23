import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Resultado extends StatelessWidget {
  Resultado({
    required this.pontuacao,
    Key? key,
    required this.resetando,
  }) : super(key: key);
  void Function() resetando;
  int pontuacao;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "A sua Nota é: $pontuacao,",
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
        const Center(
          child: Text(
            "Parabéns!!!",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
        GestureDetector(
          child: const Text(
            "Responder novamente...",
            style: TextStyle(
              color: Colors.deepPurpleAccent,
            ),
          ),
          onTap: resetando,
        ),
      ],
    );
  }
}
