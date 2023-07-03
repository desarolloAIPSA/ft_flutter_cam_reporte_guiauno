// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../config/app_theme.dart';
import '../../../utils/formatter.dart';

class DatePickerComponent extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final double? width;
  final TextEditingController controller;

  const DatePickerComponent({super.key, required this.initialDate, required this.firstDate, required this.lastDate, this.width, required this.controller});


  @override
  _DatePickerComponentState createState() => _DatePickerComponentState();
}

class _DatePickerComponentState extends State<DatePickerComponent> {
  DateTime selectedDate = DateTime(2023);

  get initialDate => widget.initialDate;
  get firstDate => widget.firstDate;
  get lastDate => widget.lastDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppTheme.primaryColor
            ),
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                alwaysUse24HourFormat: false,
              ),
              child: child!,
            ),
          ),
        );
        },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        /* debugPrint("selectedDate: ${selectedDate}");
        debugPrint("selectedDate: ${selectedDate.toIso8601String()}"); */
        widget.controller.text = selectedDate.toIso8601String();
        //"${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    FormatterU formatterU = FormatterU();
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        width: widget.width,
        //margin: const EdgeInsets.all(5),
        height: 60,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.controller.text.isNotEmpty ? formatterU.fechaCaseOne(widget.controller.text) : formatterU.fechaCaseOne(widget.initialDate.toIso8601String()),
                style: AppTheme.body1,
                textAlign: TextAlign.center,
              ),
            ),
            Icon(Icons.calendar_month, size: 30,color: AppTheme.primaryColor,),
          ],
        ),
      ),
    );
  }
}

/* import 'package:flutter/material.dart';

class DatePickerExample extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final String? restorationId;

  const DatePickerExample({super.key, required this.firstDate, required this.lastDate, this.restorationId});

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _DatePickerExampleState extends State<DatePickerExample> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime(2023, 6, 13));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture = RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      debugPrint("navigator.restorablePush");
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    debugPrint("_datePickerRoute");
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2023, 6, 9),
          lastDate: DateTime(2023, 6, 13),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    debugPrint("restoreState");
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(_restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    debugPrint("_selectDate");
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () {
          _restorableDatePickerRouteFuture.present();
        },
        child: const Text('Open Date Picker'),
      ),
    );
  }
}
 */