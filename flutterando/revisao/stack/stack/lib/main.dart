import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Curso Flutter'),
        ),
        body: Center(
          child: Stack(children: [
            Builder(
              builder: (context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/imgs/berserk.jpg',
                    fit: BoxFit.cover,
                  ),
                );
              }
            ),
          ]),
        ),
      ),
    );
  }
}
