import 'package:flutter/material.dart';

class LabelV5W extends StatelessWidget {
  final IconData icon;
  final String value;
  final Color color;

  const LabelV5W({super.key, required this.icon, required this.value, required this.color});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          Expanded(
            child: Text(
              value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: color),
            ),
          ),
        ],
      ),
    );
  }
}
