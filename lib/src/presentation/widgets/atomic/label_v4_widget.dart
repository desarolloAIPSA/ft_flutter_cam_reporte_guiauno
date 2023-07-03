import 'package:flutter/material.dart';

class LabelV4W extends StatelessWidget {
  final String title;
  final String value;

  const LabelV4W({super.key, required this.title, required this.value});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
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
          Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.black.withAlpha(255),
              letterSpacing: 2,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}
