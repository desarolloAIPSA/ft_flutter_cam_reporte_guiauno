import 'package:flutter/material.dart';

class ExpresionesRegulares extends ChangeNotifier {
  bool esNumericoODecimalPositivo(String valor) {
    const pattern = r'^\d*\.?\d+$';
    final regExp = RegExp(pattern);
    //debugPrint("esNumericoODecimal: ${regExp.hasMatch(valor)}");
    return regExp.hasMatch(valor);
  }
}
