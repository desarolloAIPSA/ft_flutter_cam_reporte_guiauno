import 'package:flutter/material.dart';
import '../../../config/app_theme.dart';

class HeaderFormW extends StatelessWidget {
  final String title;
  final String descripcion;

  const HeaderFormW({super.key, required this.title, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              title,
              style: AppTheme.title,
              textAlign: TextAlign.start,
            )
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Text(
              descripcion,
              style: AppTheme.body2,
              textAlign: TextAlign.start,
            )
          ),
        ],
      ),
    );
  }
}
