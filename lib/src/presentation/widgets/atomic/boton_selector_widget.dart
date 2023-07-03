import 'package:flutter/material.dart';

import '../../../global/colores.dart';

class BotonSelector extends StatelessWidget {
  //final List<String> items;
  final void Function(String?) onChanged;
  final String value;
  final Color pryColor;
  final Color secColor;
  final IconData icon;
  final double? height;
  final List<DropdownMenuItem<String>>? items;

  const BotonSelector({super.key, required this.onChanged, required this.value, required this.pryColor, required this.secColor, required this.icon, this.height, this.items});


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    debugPrint('${size.width}');
    return Container(
      height: height ?? 60,
      margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 15, bottom: 15),
      child: DropdownButtonHideUnderline(
        child: InputDecorator(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: DropdownButton(
            iconDisabledColor: Colors.red,
            focusColor: Colores.verde,
            dropdownColor: secColor,
            iconEnabledColor: pryColor,
            icon: const Icon(
              Icons.arrow_drop_down,
              size: 35,
            ),
            elevation: 8,
            iconSize: 24.0,
            isDense: false,
            borderRadius: BorderRadius.circular(10.0),
            items: items,
            onChanged: onChanged,
            isExpanded: true,
            value: value,
          ),
        ),
      ),
    );
  }
}
