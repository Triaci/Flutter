import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/controllers/ConversaoController.dart';
import 'package:hello_world/models/Conversao.dart';
import 'package:hello_world/models/SalvaLog.dart';
import 'package:hello_world/screens/Chart.dart';
import 'package:hello_world/screens/dashboard/Log.dart';
import 'package:provider/provider.dart';

class Conversor extends StatelessWidget {
  @override
  String dropdownValue = 'Milhas';
  String dropdownValue2 = 'Quilômetros';
  double top = 0.0;
  double valorConversao = 0;
  int _selectedIndex = 0;

  List<String> imperiais = ["Milhas", "Jardas"];

  Conversao C = new Conversao();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Conversor de Medidas",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Conversor de Medidas",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              backgroundColor: Color.fromARGB(255, 85, 49, 248),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                tooltip: 'Log',
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Log()));
                  Provider.of<ConversaoController>(context, listen: false)
                      .valorConvertido = 0;
                },
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'Log',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart_sharp),
                  label: 'Gráfico',
                ),
              ],
              currentIndex: 0,
              selectedItemColor: Colors.black87,
              unselectedItemColor: Colors.black87,
              backgroundColor: Colors.white,
              onTap: (int index) {
                switch (index) {
                  case 0:
                    if (_selectedIndex == index) {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Log()));
                      Provider.of<ConversaoController>(context, listen: false)
                          .valorConvertido = 0;
                    }
                    break;
                  case 1:
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Chart()));
                    break;
                }
                _selectedIndex = index;
              },
            ),
            body: Consumer<ConversaoController>(
                builder: (context, conversao, child) {
              return Column(
                children: [
                  TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Valor"),
                    onSubmitted: (String value) {
                      conversao.valorPassado = double.parse(value);
                    },
                    onChanged: (String value) {
                      conversao.valorPassado = double.parse(value);
                    },
                  ),
                  Column(
                    children: [
                      Text(
                        "Converter de",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 400,
                        child: Container(
                          color: Colors.white,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: conversao.dropDownValue,
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            elevation: 16,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            underline: Container(
                              height: 2,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            onChanged: (String? newValue) {
                              conversao.dropDownValue = newValue!;
                              dropdownValue = newValue;
                            },
                            items: <String>['Milhas', 'Jardas']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Text(
                        "Para",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 400,
                        child: Container(
                          color: Colors.white,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: conversao.dropDownValue2,
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            elevation: 16,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            underline: Container(
                              height: 2,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            onChanged: (String? newValue) {
                              conversao.dropDownValue2 = newValue!;
                              dropdownValue2 = newValue;
                            },
                            items: <String>['Quilômetros', 'Centímetros']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 85, 49, 248),
                              elevation: 15,
                              shadowColor: Colors.green),
                          child: Text(
                            'Converter',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            if (dropdownValue2.contains('Quilômetros') &&
                                dropdownValue.contains('Milhas')) {
                              valorConversao =
                                  conversao.getConversao.converteMilhaKm();
                              conversao.valorConvertido = valorConversao;

                              SalvaLog.setValoreslog(valorConversao.toString());
                              SalvaLog.setMedidaConversao(
                                  dropdownValue.toString());
                              SalvaLog.setMedidaConversao2(
                                  dropdownValue2.toString());
                              valorConversao = dropdownValue as double;
                            } else if (dropdownValue2.contains('Quilômetros') &&
                                dropdownValue.contains('Jardas')) {
                              valorConversao =
                                  conversao.getConversao.converteJardaKm();
                              conversao.valorConvertido = valorConversao;
                              SalvaLog.setValoreslog(valorConversao.toString());
                              SalvaLog.setMedidaConversao(
                                  dropdownValue.toString());
                              SalvaLog.setMedidaConversao2(
                                  dropdownValue2.toString());
                              valorConversao = dropdownValue as double;
                            } else if (dropdownValue2.contains('Centímetros') &&
                                dropdownValue.contains('Milhas')) {
                              valorConversao =
                                  conversao.getConversao.converteMilhaCm();
                              conversao.valorConvertido = valorConversao;
                              SalvaLog.setValoreslog(valorConversao.toString());
                              SalvaLog.setMedidaConversao(
                                  dropdownValue.toString());
                              SalvaLog.setMedidaConversao2(
                                  dropdownValue2.toString());
                              valorConversao = dropdownValue as double;
                            } else if (dropdownValue2.contains('Centímetros') &&
                                dropdownValue.contains('Jardas')) {
                              valorConversao =
                                  conversao.getConversao.converteJardaCm();
                              conversao.valorConvertido = valorConversao;
                              SalvaLog.setValoreslog(valorConversao.toString());
                              SalvaLog.setMedidaConversao(
                                  dropdownValue.toString());
                              SalvaLog.setMedidaConversao2(
                                  dropdownValue2.toString());
                              valorConversao = dropdownValue as double;
                            }
                          },
                        ),
                      ),
                      Text(
                        "Valor convertido: " +
                            conversao.getConversao.valorConvertido!
                                .toStringAsFixed(3),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              );
            })));
  }
}
