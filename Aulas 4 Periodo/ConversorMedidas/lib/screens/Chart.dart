import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/screens/dashboard/Conversor.dart';
import 'package:hello_world/screens/flChart.dart';
import 'package:provider/provider.dart';

import '../controllers/ConversaoController.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Conversor de medidas',
        home: Scaffold(
            appBar: AppBar(
              title: Text("Log de conversões",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              backgroundColor: Colors.black38,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Conversor()));
                },
              ),
            ),
            body: Consumer<ConversaoController>(
                builder: (context, conversao, child) {
              return Row(
                children: [
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              btcol_vermelho = btcol_vermelho + 1;
                            },
                            backgroundColor: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              btcol_azul = btcol_azul + 1;
                            },
                            backgroundColor: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              btcol_verde = btcol_verde + 1;
                            },
                            backgroundColor: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              btcol_amarelo = btcol_amarelo + 1;
                            },
                            backgroundColor: Colors.yellow,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              btcol_cinza = btcol_cinza + 1;
                            },
                            backgroundColor: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              btcol_preto = btcol_preto + 1;
                            },
                            backgroundColor: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              btcol_rosa = btcol_rosa + 1;
                            },
                            backgroundColor: Colors.pink,
                          ),
                        ],
                      ),
                    )
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(child: BarChartSample1()),
                  )
                ],
              );
            })));
  }
}
