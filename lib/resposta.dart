import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() qndSelecionado;

  Resposta(this.texto, this.qndSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.red,
            textStyle: TextStyle(color: Colors.amberAccent)),
        child: Text(texto,
            style: TextStyle(
              color: Colors.white,
            )),
        onPressed: qndSelecionado,
      ),
    );
  }
}
