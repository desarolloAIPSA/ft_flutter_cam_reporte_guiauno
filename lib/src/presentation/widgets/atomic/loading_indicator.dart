import 'package:flutter/material.dart';

import '../../../utils/loading_status.dart';

class LoadingIndicator extends StatelessWidget {
  final String texto;

  const LoadingIndicator({super.key, required this.texto});


  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    LoadingStatus estados = LoadingStatus();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        estados.cargando(),
        Container(
            margin: const EdgeInsets.only(bottom: 20, top: 20),
            child: Center(child: Text(texto,style: const TextStyle(letterSpacing: 2,fontSize: 21),))),
      ],
    );
  }
}