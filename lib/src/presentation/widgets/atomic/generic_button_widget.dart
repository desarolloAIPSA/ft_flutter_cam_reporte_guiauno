import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final String title;
  final double width;
  final void Function()? onPressed;
  final Color color;
  final double? height;

  const GenericButton({super.key, required this.title, required this.width, this.onPressed, required this.color, this.height});



  @override
  Widget build(BuildContext context) {
    return Container(
      height: height??45,
      width: width,
      margin: const EdgeInsets.only(left: 5,right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Agrega el radio de borde deseado
        border: Border.all(
          color: color,
          width: 1.5,
        ),
        color: color
      ),
      child: Center(
        child: TextButton(
          onPressed: onPressed,
          //data: const TextButtonThemeData(style: ButtonStyle(alignment: Alignment.center)),
          child: Text(title,style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
