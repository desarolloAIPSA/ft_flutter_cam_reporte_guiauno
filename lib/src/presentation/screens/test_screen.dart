//import 'package:reporte_guia/src/presentation/widgets/atomic/generic_button_widget.dart';
// ignore_for_file: unused_local_variable

import 'package:reporte_guia/src/presentation/widgets/compuesto/alert_cards_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/target_info_flutter.dart';
import '../../data/services/a_ora_service.dart';
import '../../utils/formatter.dart';
//import '../providers/environment_provider.dart';
import '../providers/registro_provider.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  FormatterU formatterU = FormatterU();
  OraService oraService = OraService();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final dateProvider = Provider.of<RegisProv>(context, listen: false);
      TargetInfoC targetInfoC = TargetInfoC();
      targetInfoC.getTarget();
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final regisProv = Provider.of<RegisProv>(context, listen: true);
    //Size size = MediaQuery.of(context).size;
    //final enviromentProvider = Provider.of<EnviromentProvider>(context, listen: false);
    return const SafeArea(
      child: Scaffold(
        body: Column(children: [AlertCardW(title: 'title', descripcion: 'descripcion', width: 500, estado: false)]),
      ),
    );
  }
}
