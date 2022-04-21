import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_2/home_controller.dart';

import 'home_page.dart';

class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key : key);
  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeController(
      child: HomePage(),
    ),
    );
  }
}