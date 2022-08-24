// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chamados/models/Chamado.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => (runApp(AppChamados()));

class AppChamados extends StatefulWidget {
  @override
  State<AppChamados> createState() => _AppChamadosState();
}

class _AppChamadosState extends State<AppChamados> {
  List<String> materiais = ["Notebook", "HD", "Crimpador", "Multimetro"];
  List<String> tipo = ["Concerto", "Instalacao", "Manutencao"];
  List<Chamado> chamados = [];

  late Chamado chamado;

  void refreshBasics(
      {String? nome,
      String? descricao,
      DateTime? dia,
      TimeOfDay? hora,
      double? duracao,
      String? tipo,
      bool? importante}) {
    chamado.nome = nome != null ? nome : chamado.nome;
    chamado.descricao = descricao != null ? descricao : chamado.descricao;
    chamado.dia = dia != null ? dia : chamado.dia;
    chamado.hora = hora != null ? hora : chamado.hora;
    chamado.duracao = duracao != null ? duracao : chamado.duracao;
    chamado.tipo = tipo != null ? tipo : chamado.tipo;
    chamado.importante = importante != null ? importante : chamado.importante;

    setState(() {
      chamado = Chamado();
      chamados = [];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    chamado = Chamado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    chamado = Chamado();
    return MaterialApp(
        title: "Chamados",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Chamados"),
            ),
            body: Builder(builder: (context) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(label: Text("Nome")),
                      onChanged: (_nome) {
                        refreshBasics(nome: _nome);
                      },
                    ),
                    TextField(
                      minLines: 3,
                      maxLines: 5,
                      decoration: InputDecoration(
                          hintText: "Insira a descrição do chamado",
                          label: Text("Descrição")),
                      onChanged: (_descricao) {
                        refreshBasics(descricao: _descricao);
                      },
                    ),
                    Text(
                      "Horarios",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(children: [
                      ElevatedButton(
                          child: Text("Hora do chamado"),
                          onPressed: () async {
                            TimeOfDay? _hora = await showTimePicker(
                                context: context, initialTime: TimeOfDay.now());

                            if (_hora != null) {
                              refreshBasics(hora: _hora);
                            }
                          }),
                      Text((chamado.hora != null)
                          ? '${chamado.hora.toString()}'
                          : "O chamado nao tem data")
                    ]),
                    Row(children: [
                      ElevatedButton(
                          child: Text("Dia do chamado"),
                          onPressed: () async {
                            DateTime? _dia = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            if (_dia != null) {
                              refreshBasics(dia: _dia);
                            }
                          }),
                      Text((chamado.dia != null)
                          ? '${chamado.dia!.day}/${chamado.dia!.month}/${chamado.dia!.year}'
                          : "O chamado nao tem data")
                    ]),
                    Text(
                      "Materiais",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: materiais.length,
                        itemBuilder: (context, index) {
                          String _material = materiais[index];
                          // bool? _selecionado
                          return Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              Text(_material)
                            ],
                          );
                        }),
                    Text(
                      "Tipo",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    DropdownButton(
                        isExpanded: true,
                        items: tipo.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (tipo) {
                          refreshBasics(tipo: tipo.toString());
                        }),
                    Text((chamado.tipo != null)
                        ? '${chamado.tipo!.toString()}'
                        : "O chamado não tem tipo"),
                    Row(children: [
                      Text("Importante"),
                      Switch(
                          value: chamado.importante,
                          onChanged: (importante) {
                            refreshBasics(importante: importante);
                          })
                    ]),
                    Text("Duração"),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("Cadastrar")),
                  ],
                ),
              );
            })));
  }

  void cadastrar() {
    chamados.add(chamado);
    setState(() {
      chamado = Chamado();
      chamados = chamados;
    });
  }
}
