import 'package:flutter/material.dart';

import '../atomic/header_widget.dart';

class CarSuperior extends StatelessWidget {
  final String name;
  final double? width;
  final double? height;

  const CarSuperior({super.key, required this.name, this.width, this.height});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(),
        HeaderRedondeadoW(width: width, height: height),
        Positioned(
          top: 40,
          left: 110,
          child: SizedBox(
            height: 100,
            child: Image.asset(name,),
          ),
        )
      ],
    );
  }
}
