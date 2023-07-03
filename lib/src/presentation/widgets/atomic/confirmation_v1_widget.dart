import 'package:flutter/material.dart';

import '../../../config/app_theme.dart';
import 'icon_button_widget.dart';

class ConfirmationW extends StatelessWidget {
  final String title;
  final Widget widget;
  final void Function()? onPressed;
  final IconData icon;
  final String textButon;
  final double? width;

  const ConfirmationW({super.key, required this.title, required this.widget, this.onPressed, required this.icon, required this.textButon, this.width});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(margin: const EdgeInsets.symmetric(vertical: 10), child: Image.asset('assets/images/cheque.png', scale: 4)),
        Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Text(
              title,
              style: AppTheme.labelTitle,
            )),
        widget,
        ImageButton(
          onPressed: onPressed,
          icon: icon,
          color: AppTheme.primaryColor,
          title: textButon,
          width: width??300,
        )
      ],
    );
  }
}
