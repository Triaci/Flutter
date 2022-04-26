// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Conclusao  extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  
  Conclusao(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado{
    if(pontuacao < 8){
      return 'Parabéns! ';
    }else if(pontuacao < 12 ){
      return 'Você é Bom !';
    }else if(pontuacao < 16){
      return 'Impressionante';
    }else{
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(fraseResultado,
                  style: TextStyle(fontSize: 28),
                  ),
                ),
              FlatButton(
                child: Text('Reinciar',
                style: TextStyle(fontSize: 18),),
                textColor: Colors.blue,
                onPressed: quandoReiniciarQuestionario,
              )
              ],
            ),
          );
  }
}