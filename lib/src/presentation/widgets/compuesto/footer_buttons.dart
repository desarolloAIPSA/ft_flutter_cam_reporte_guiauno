import 'package:flutter/material.dart';

import '../atomic/icon_button_widget.dart';

class FooterButtonW extends StatelessWidget {
  final void Function() onNext;
  final void Function() onPrev;
  final int etapa;
  final int maxEtapa;

  const FooterButtonW({super.key, required this.onNext, required this.onPrev, required this.etapa, required this.maxEtapa});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      if(etapa>1)ImageButton(
        title: 'Volver',
        width: 140,
        color: Colors.red,
        onPressed: onPrev, 
        icon: Icons.arrow_circle_left_outlined,
      ),
      Expanded(child: Container()),
      if(maxEtapa>=etapa)ImageButton(
        title: 'Siguiente',
        width: 140,
        color: Colors.green,
        onPressed: onNext,
        icon: Icons.arrow_circle_right,
      )
    ]);
  }
}
