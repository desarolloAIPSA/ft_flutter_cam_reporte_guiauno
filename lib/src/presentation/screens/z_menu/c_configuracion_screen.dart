import 'package:reporte_guia/src/presentation/widgets/atomic/generic_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../utils/formatter.dart';

class ConfiguracionScreen extends StatelessWidget {
  const ConfiguracionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.green,
          ),
          GenericButton(
            title: 'title',
            width: 300,
            color: Colors.pink,
            onPressed: () {
              final formatterU = FormatterU();
              final res = formatterU.fecHorQueryORa(DateTime.now());
              debugPrint('TEST res: ${res}');
            },
          )
        ],
      ),
    );
  }
}
