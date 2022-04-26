// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import './main.dart';
class  Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
                child: Text(texto),
                onPressed:quandoSelecionado,
              )
    );
  }
}