import 'package:reporte_guia/src/config/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../utils/formatter.dart';
import '../atomic/date_picker_widget.dart';
import '../atomic/time_picker_widget.dart';

class DateHourPickerW extends StatelessWidget {
  final String title;
  final double width;
  final DateTime initialDate;
  final TimeOfDay initialHour;
  final TextEditingController hourController;
  final TextEditingController dateController;

  const DateHourPickerW({super.key, required this.title, required this.width, required this.initialDate, required this.initialHour, required this.hourController, required this.dateController});

  @override
  Widget build(BuildContext context) {
    FormatterU formatterU = FormatterU();
    DateTime today = DateTime.now();
    DateTime yesterday =formatterU.substractDias(today, 1);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              margin: const EdgeInsets.only(top: 2, bottom: 5),
              width: double.infinity,
              child: Text(
                title,
                style: AppTheme.labelTitle,
              )),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                child: DatePickerComponent(
                  width: width * 0.65,
                  controller: dateController,
                  firstDate: yesterday,
                  lastDate: today,
                  initialDate: initialDate,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                child: TimePickerOptions(
                  width: width * 0.35,
                  controller: hourController,
                  initialHour: initialHour,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
