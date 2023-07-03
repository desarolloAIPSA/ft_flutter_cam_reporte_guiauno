
import 'package:flutter/material.dart';

class SimpleLabelW extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const SimpleLabelW({super.key, required this.icon, required this.label, required this.value});

  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),width: 40,child: Icon(icon)),
        Container(margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),width: 40,child: Text(label)),
        Expanded(child: Container(margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),child: Text(": $value")))
      ],
    );
  }
}