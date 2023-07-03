// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final void Function()? onPressed;
  final double width;
  final String title;
  final IconData icon;
  final Color color;

  const ImageButton({super.key, this.onPressed, required this.width, required this.title, required this.icon, required this.color});



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: width,
      margin: const EdgeInsets.only(top: 7,bottom: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: color,
          width: 1.5,
        ),
        color: color,
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide.none),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 40, child: Icon(icon, color: Colors.white)),
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
