// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../../../config/app_theme.dart';

class LabelContainerW extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final String value;
  final IconData? icon;
  final double? height;

  const LabelContainerW({super.key, this.onPressed, required this.title, required this.value, this.icon, this.height});


  @override
  Widget build(BuildContext context) {
    return Container(
        //height: height,
        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: AppTheme.primaryColor.withAlpha(50),
            width: 1.5,
          ),
          color: AppTheme.primaryColor.withAlpha(15),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: 50,
              //decoration: BoxDecoration(
              //  shape: BoxShape.circle,
              //  color: AppTheme.primaryColor,
              //),
              child: Icon(icon,color: AppTheme.primaryColor,size: 30,)
            ),
            //Container(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  value,
                  style:TextStyle(wordSpacing: 0,color: AppTheme.primaryColor,fontWeight: FontWeight.w500,fontSize: 17),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    title,
                    style: TextStyle(wordSpacing: 1,color: AppTheme.primaryColor.withAlpha(200),fontSize: 15),
                    maxLines: 2,
                    textAlign: TextAlign.justify,
                  ),
                ),
                
                ],
              ),
            )
            
          ],
        ));
  }
}
