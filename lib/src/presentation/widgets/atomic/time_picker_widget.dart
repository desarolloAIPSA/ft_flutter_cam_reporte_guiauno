// ignore_for_file: unnecessary_null_comparison

/* import 'package:flutter/material.dart';

class TimePiackerW extends StatelessWidget {
  const TimePiackerW({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const Placeholder();
  }
} */

import 'package:flutter/material.dart';

import '../../../config/app_theme.dart';
import '../../../utils/formatter.dart';

class TimePickerOptions extends StatefulWidget {
  
  final TimeOfDay initialHour;
  final TextEditingController controller;
  final double? width;

  const TimePickerOptions({super.key, required this.initialHour, required this.controller, this.width});
  @override
  State<TimePickerOptions> createState() => _TimePickerOptionsState();
}

class _TimePickerOptionsState extends State<TimePickerOptions> {
  TimeOfDay? selectedTime;
  TimePickerEntryMode entryMode = TimePickerEntryMode.dial;
  Orientation? orientation=Orientation.portrait;
  TextDirection textDirection = TextDirection.ltr;
  MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;
  bool use24HourTime = false;
  FormatterU formatterU= FormatterU();


  Future<void> _selectDate(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: widget.initialHour,
      initialEntryMode: entryMode,
      orientation: orientation,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            materialTapTargetSize: tapTargetSize,
            colorScheme: ColorScheme.light(
              primary: AppTheme.primaryColor
            ),
          ),
          child: Directionality(
            textDirection: textDirection,
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                alwaysUse24HourFormat: false,
                navigationMode: NavigationMode.directional

              ),
              child: child!,
            ),
          ),
        );
        },
    );
    
    if (time!= null ) {
      setState(() {
      selectedTime = time;
      widget.controller.text = time.format(context);      
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        //margin: const EdgeInsets.all(5),
        height: 60,
        width: widget.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
              widget.controller.text.isNotEmpty ? widget.controller.text : formatterU.timeOfDateToString(widget.initialHour),
              style: AppTheme.body1,
                textAlign: TextAlign.center,
              )
            ),
            Icon(Icons.more_time_sharp, size: 30,color: AppTheme.primaryColor,),
          ],
        ),
      ),
    );
  }
}
