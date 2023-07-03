import 'package:flutter/material.dart';

class FormatterU extends ChangeNotifier {
  //INP:
  //OUT: 2023-06-13T20:38:01.165Z
  String fechaOracleSave() {
    DateTime fecha = DateTime.now().toUtc();
    return fecha.toIso8601String();
  }

  //IN :2023-06-11T00:00:00.000
  //OUT:11/06/2023
  String fechaCaseOne(String input) {
    List<String> list1 = input.split('T');
    List<String> list2 = list1[0].split('-');
    return '${list2[2]}/${list2[1]}/${list2[0]}';
  }

  TimeOfDay stringToTimeofDate(String input) {
    //debugPrint("input: $input");
    List<String> parts = input.split(":");
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    return TimeOfDay(hour: hours, minute: minutes);
  }

  String timeOfDateToString(TimeOfDay input) => '${input.hour.toString().padLeft(2, '0')}:${input.minute.toString().padLeft(2, '0')}';

  String obtenerFechaString(DateTime fecha) {
    String fechaString = fecha.toIso8601String();
    return fechaString;
  }

  List<String> actual() {
    List<String> date = DateTime.now().toIso8601String().split('T');
    List<String> fech = date[0].split('-');
    return ['${fech[2]}/${fech[1]}/${fech[0]}', date[1].substring(0, 8)];
  }

  DateTime fechaHora(String fecha, String tiempo) {
    List<String> date = fecha.split('T');
    List<String> time = tiempo.split(':');
    String hora = time[0].toString().padLeft(2, '0');
    String completo = '${date[0]}T$hora:${time[1]}:00';
    return DateTime.parse(completo);
  }

  //OUT: 2023-06-19T17:30:46.201+00:00
  //REAL:2023-06-21T20:58:00.000+00:00
  String fecHorStrToORA(String fecha, String tiempo) {
    List<String> date = fecha.split('T');
    List<String> time = tiempo.split(':');
    String hora = time[0].toString().padLeft(2, '0');

    String completo = '${date[0]}T$hora:${time[1]}:00';
    DateTime dateTime = DateTime.parse(completo);
    //String finalTime = dateTime.toUtc().toIso8601String();
    //String finalTime = dateTime.toIso8601String();
    return dateTime.toIso8601String();
  }

  DateTime fechaOracleDate() {
    DateTime fecha = DateTime.now().toUtc();
    return fecha;
  }

  DateTime addDias(DateTime input, int days) => input.add(Duration(days: days));
  DateTime addHoras(DateTime input, int hours) => input.add(Duration(hours: hours));
  DateTime substractHoras(DateTime input, int hours) => input.subtract(Duration(hours: hours));
  DateTime substractDias(DateTime input, int days) => input.subtract(Duration(days: days));

  //20230627T18:29:00
  String fecHorQueryORa(DateTime date) {
    String strDate = date.toIso8601String();
    List<String> lista = strDate.split('T');
    List<String> lisFe = lista[0].split('-');
    return '${lisFe[0]}${lisFe[1]}${lisFe[2]}T${lista[1].substring(0,8)}';
  }
}
