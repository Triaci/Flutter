// ignore_for_file: deprecated_member_use
import './conclusao.dart';
import'./questionario.dart';
import 'package:flutter/material.dart';
main()=> runApp(PerguntaApp());
class _PerguntaAppState extends State<PerguntaApp>{

final _perguntas = const [
    {'texto' : 'Qual é a sua cor favorita ?',
    'resposta' : [
      {'texto' :'Preto',  'nota' : 10},
      {'texto':'Vermelho','nota': 5},
      {'texto':'Verde',   'nota' : 3},
      {'texto':'Branco',  'nota': 1}
      ] } ,
    {'texto' : 'Qual é o seu animal favorita?',
    'resposta' : [
      {'texto':'Coelho', 'nota' : 10},
      {'texto':'Cobra','nota' : 5},
      {'texto':'Elefante', 'nota' : 3},
      {'texto':'Leão','nota': 1}
      ]},
     {'texto' : 'Qual é o seu instrutor Favorito?',
    'resposta' : [{'texto':'Maria','nota' : 10},
    {'texto':'João', 'nota' : 5},
    {'texto':'Leo','nota':3},
    {'texto':'Pedro','nota': 1} 
   ]
   }
   ];



var _perguntaSelecionada = 0;
var _pontuacao_Total = 0;

void _reiniciarQuestionario(){
  setState(() {
    _perguntaSelecionada = 0;
    _pontuacao_Total = 0;
  });
}

  bool get temPerguntaSelecionada{
    return _perguntaSelecionada < _perguntas.length;
  }

 void _responder(int nota){
    print('Pergunta Respondida');
    setState(() {
    _perguntaSelecionada++;
    _pontuacao_Total += nota;  
    });
    print(_perguntaSelecionada);
  }

 
  @override
  Widget build(BuildContext context){
    
 
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada ? Questionario(perguntaSelecionada: _perguntaSelecionada,
            perguntas: _perguntas,
            responder: _responder)
          :Conclusao(_pontuacao_Total, _reiniciarQuestionario)
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget{
  
  _PerguntaAppState createState(){
    return _PerguntaAppState();
  }



}