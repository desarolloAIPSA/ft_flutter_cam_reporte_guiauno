// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../../../config/app_theme.dart';

class LabelImageW extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final String value;
  final IconData? icon;
  final double? height;

  const LabelImageW({super.key, this.onPressed, required this.title, required this.value, this.icon, this.height});


  @override
  Widget build(BuildContext context) {
    return Container(
        //height: height,
        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1),
          border: Border.all(
            color: Colors.transparent,
            //width: 1.5,
          ),
          //color: Colors.red.withAlpha(10),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryColor,
              ),
              child: Icon(icon,color: Colors.white,size: 30,)
            ),
            //Container(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    title,
                    style: AppTheme.drawerTitle,
                    maxLines: 2,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Text(
                  value,
                  style: AppTheme.body1,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                )
                ],
              ),
            )
            
          ],
        ));
  }
}
