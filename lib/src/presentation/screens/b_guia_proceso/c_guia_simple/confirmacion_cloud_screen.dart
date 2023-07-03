// ignore_for_file: use_build_context_synchronously

import 'package:reporte_guia/src/presentation/screens/b_guia_proceso/maestro_screen.dart';
import 'package:reporte_guia/src/presentation/widgets/atomic/confirmation_v1_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/app_theme.dart';
import '../../../../data/db/tranportista_db.dart';
import '../../../../data/functions/local/transportista_local_fun.dart';
import '../../../../data/models/db/transportista_db_model.dart';
import '../../../../data/models/ora/guia1_model.dart';
import '../../../providers/form_prov.dart';

class ConfirmacionCloudScreen extends StatelessWidget {
  final Guia1OraModel data;
  final TranportistaDbModel update;

  const ConfirmacionCloudScreen({super.key, required this.data, required this.update});

  @override
  Widget build(BuildContext context) {
    final formProv = Provider.of<FormProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: ConfirmationW(
          title: 'Envio de datos Correcto',
          widget: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: const Text(
                  'Número de Guía:',
                  style: TextStyle(wordSpacing: 0, color: AppTheme.primary1, fontWeight: FontWeight.w500, fontSize: 17),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 20),
                child: Text(
                  '${data.grNroGuia}',
                  style: TextStyle(wordSpacing: 0, color: AppTheme.primaryColor, fontWeight: FontWeight.w500, fontSize: 20),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
          icon: Icons.navigate_next,
          textButon: 'Continuar',
          onPressed: () async {
            final tranportistaLocalFun = TranportistaLocalFun();
            await tranportistaLocalFun.actualizarPorFlagInternet(model: update);
            await tranportistaLocalFun.eliminar();
            await formProv.cargarTransportistas();
            formProv.guiaSize = await TranportistaDb.db.contarAll();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MaestroScreen()));
          },
        ),
      ),
    );
  }
}
