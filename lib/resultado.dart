import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao <= 8) {
      return 'Lixo';
    } else if (pontuacao <= 12) {
      return 'Não tão lixo';
    } else if (pontuacao < 16) {
      return 'Oloko meu jovenzin';
    } else {
      return 'Lanso a braba fia da puta';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              textStyle: TextStyle(color: Colors.amberAccent),
            ),
            child: Text(
              'Quer ir de novo?',
              style: TextStyle(fontSize: 20, color: Colors.black87),
              textAlign: TextAlign.end,
            ),
            onPressed: quandoReiniciarQuestionario,
          ),
        )
      ],
    );
  }
}
