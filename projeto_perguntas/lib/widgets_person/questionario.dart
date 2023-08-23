import 'package:flutter/material.dart';

import 'Questao.dart';
import 'Resposta.dart';

// ignore: must_be_immutable
class Questionario extends StatelessWidget {
  Questionario({
    required this.idPergunta,
    required this.perguntas,
    required this.respondendo,
    Key? key,
  }) : super(key: key);

  int idPergunta;
  void Function(int) respondendo;
  bool temPerguntaValida() {
    return idPergunta < perguntas.length;
  }

  List<Map<String, Object>> perguntas;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        temPerguntaValida() ? perguntas[idPergunta].cast()["respostas"] : [];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Questao(
          perguntas[idPergunta]["pergunta"].toString(),
        ),
        ...respostas
            .map((res) => Resposta(
                () => respondendo(
                      res["nota"] as int,
                    ),
                texto: res["texto"].toString()))
            .toList(),
      ],
    );
  }
}
