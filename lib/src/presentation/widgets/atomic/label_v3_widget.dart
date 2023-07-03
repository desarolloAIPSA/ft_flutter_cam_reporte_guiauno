import 'package:flutter/material.dart';

import '../../../config/app_theme.dart';

class LabelV3W extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const LabelV3W({super.key, required this.title, required this.value, required this.icon});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 50,
                //margin: EdgeInsets.symmetric(horizontal: ),
                child: Icon(
                  icon,
                  color: AppTheme.primaryColor,
                  size: 40,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withAlpha(150),
                  letterSpacing: -0.5,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.only(left: 50),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.black.withAlpha(255),
                  letterSpacing: 2,
                  fontFamily: 'Roboto',
                ),
              )),
        ],
              ),
    );
  }
}