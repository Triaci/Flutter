import 'package:flutter/material.dart';

class SalvaLog {
  static List<String>? _valoresLog = [];
  static String? _logString = "";
  static String? _medConversao = "";
  static String? _medConversao2 = "";

  List<String>? get valoresLog => _valoresLog;
  String? get logString => _logString;
  String? get medConversao => _medConversao;
  String? get medConversao2 => _medConversao2;
  

  static void setValoreslog(String value) {
    _valoresLog!.add(value);
  }

  void set valoresLog(List<String>? valoresLog) {
    _valoresLog!.addAll(valoresLog!);
  }

  void set logString(String? logString) {
    _logString = logString;
  }

  static void setMedidaConversao(String? medConversao) {
    _medConversao = medConversao;
  }

  static void setMedidaConversao2(String? medConversao2) {
    _medConversao2 = medConversao2;
  }

  void limpaLog() {
    _valoresLog!.clear();
  }
}
