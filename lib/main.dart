import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './questionario.dart';
import './resultado.dart';
// import './pontuador.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor que você mais gosta?',
      'respostas': [
        {'texto': 'Preto', 'pontuação': 10},
        {'texto': 'Vermelho', 'pontuação': 5},
        {'texto': 'Verde', 'pontuação': 3},
        {'texto': 'Branco', 'pontuação': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuação': 10},
        {'texto': 'Cobra', 'pontuação': 5},
        {'texto': 'Elefante', 'pontuação': 3},
        {'texto': 'Leão', 'pontuação': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Leo', 'pontuação': 10},
        {'texto': 'Maria', 'pontuação': 5},
        {'texto': 'João', 'pontuação': 3},
        {'texto': 'Pedro', 'pontuação': 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // for (String textoResp in respostas) {
    //   widget.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }

  // Widget mostrarPontuacao(int _pontuacaoTotal) {
  //   return Text(
  //     'Pontuação: $_pontuacaoTotal'
  //   );
  // }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

/*

possibilidade de um onpress retornar uma funcao, apenas chamando um void que 
possura uma funcao dentro

  void Function() funcaoQueRetornaOutraFuncao() {
    return () {
      print('Pergunta respondida #02!!!');
    };
  }
*/
