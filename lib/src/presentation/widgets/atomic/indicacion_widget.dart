import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../config/app_theme.dart';

class IndicacionW extends StatelessWidget {
  final String text;
  final String subText;
  final IconData icon;

  const IndicacionW({super.key, required this.text, required this.subText, required this.icon});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 1,
      height: 100,
      /* decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(color: Colors.blue, style: BorderStyle.solid, width: 1.0),
      ), */
      child: Stack(
        children: [
          Positioned(
          top: 15,
          left:(size.width-350)/2,
          child: Container(
            width: 350,
            height: 65,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              color: AppTheme.primaryColor.withAlpha(40),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.white70, style: BorderStyle.solid, width: 1.0),
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 20),
                    //width: 120,
                    child: RichText(
                    overflow:TextOverflow.ellipsis,
                    maxLines: 2,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: text,style: AppTheme.textBody3(AppTheme.primaryColor),),
                        TextSpan(text: subText,style: AppTheme.textBody3Bold(AppTheme.primaryColor)),
                      ],
                    ),
                  ),
                  ),
                  
                  
                ],
              ),
            ),
          ),
        ),
          Positioned(
          top: 0,
          left: 30,
          child: Align(
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: -math.pi *0.15,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white60
                  ),
                    alignment: Alignment.center,
                    child: Icon(icon,size: 60,color: AppTheme.primaryColor,),),
              )),
        ),
        ],
      ),
    );
  }
}