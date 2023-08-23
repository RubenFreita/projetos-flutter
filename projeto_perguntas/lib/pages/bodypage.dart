import 'package:flutter/material.dart';
import 'package:projeto_perguntas/widgets_person/questionario.dart';
import 'package:projeto_perguntas/widgets_person/resultado.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  int _idPergunta = 0;
  int _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      "pergunta": "Qual seu animal favorito?",
      "respostas": [
        {"texto": "Gato", "nota": 10},
        {"texto": "Rato", "nota": 5},
        {"texto": "Frango", "nota": 3},
        {"texto": "Leão", "nota": 1},
      ],
    },
    {
      "pergunta": "Qual a sua cor favorita?",
      "respostas": [
        {"texto": "Azul", "nota": 10},
        {"texto": "Vermelho", "nota": 5},
        {"texto": "Cinza", "nota": 3},
        {"texto": "Amarelo", "nota": 1},
      ],
    },
    {
      "pergunta": "Qual o seu time?",
      "respostas": [
        {"texto": "Vasco", "nota": 10},
        {"texto": "Palmeiras", "nota": 5},
        {"texto": "São Paulo", "nota": 3},
        {"texto": "Flamengo", "nota": 1},
      ],
    }
  ];

  bool _temPerguntaValida() {
    return _idPergunta < _perguntas.length;
  }

  void _respondendo(int pontuacao) {
    setState(
      () {
        _idPergunta++;
        _pontuacaoTotal = pontuacao + _pontuacaoTotal;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _temPerguntaValida()
        ? Questionario(
            perguntas: _perguntas,
            respondendo: _respondendo,
            idPergunta: _idPergunta,
          )
        : Resultado(
            pontuacao: _pontuacaoTotal,
            resetando: () => setState(
              () {
                _idPergunta = 0;
                _pontuacaoTotal = 0;
              },
            ),
          );
  }
}
