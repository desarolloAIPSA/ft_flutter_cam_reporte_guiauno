import 'package:reporte_guia/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/formatter.dart';
import '../../providers/a_login_provider.dart';
import '../../providers/environment_provider.dart';
import '../../providers/form_prov.dart';
import '../../widgets/atomic/card_menu_widget.dart';
import '../b_guia_proceso/maestro_screen.dart';
import '../a_registro_qr/registro_qr_screen.dart';
import '../c_guia_terminada/maestro_gt_screen.dart';

class TipoFormScreen extends StatelessWidget {
  const TipoFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formProv = Provider.of<FormProvider>(context, listen: true);
    final envProv = Provider.of<EnviromentProvider>(context, listen: false);
    final loginProv = Provider.of<LoginProvider>(context, listen: false);
    final formatterU = FormatterU();
    //final res = formatterU.fecHorQueryORa(DateTime.now());
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const SizedBox(
              width: double.infinity,
              child: Text(
                'Menu',
                style: AppTheme.headlineLight,
                textAlign: TextAlign.center,
              )),
          backgroundColor: AppTheme.primaryColor,
          elevation: 0.0
        ),
      body: Column(
        children: [
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistroQr())),
            child: MenuCardW(
              imageUrl: 'assets/images/camion.png',
              subtitle: '',
              title: 'Registro de Vehículos',
              angle: 100.3,
              color: AppTheme.rojo.withAlpha(70),
              letra: 'A',
            ),
          ),
          InkWell(
            onTap: () {
              debugPrint('TEST 2');
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MaestroScreen()));
            },
            child: MenuCardW(
              imageUrl: 'assets/images/nota2.png',
              subtitle: '${formProv.guiaSize}',
              title: 'Guias en proceso',
              angle: -6.45,
              color: AppTheme.accent1.withAlpha(70),
              imgWidth: 165,
              letra: 'B',
            ),
          ),
          InkWell(
            onTap: () {
              debugPrint('TEST 2');
              //Navigator.push(context, MaterialPageRoute(builder: (context) => MaestroGTScreen(input: envProv.env, queryParam: {'operador': loginProv.auth.nrodoc, 'fechaIni': formatterU.fecHorQueryORa( formatterU.substractHoras(DateTime.now(),24)), 'fechaFin':formatterU.fecHorQueryORa(DateTime.now())})));
              Navigator.push(context, MaterialPageRoute(builder: (context) => MaestroGTScreen(input: envProv.env, queryParam: {'operador': loginProv.auth.nrodoc, 'fechaIni': '20230628T00:00:00', 'fechaFin':formatterU.fecHorQueryORa(DateTime.now())})));
            },
            child: MenuCardW(
              imageUrl: 'assets/images/medalla.png',
              subtitle: '',
              title: 'Guias Terminadas',
              angle: -6.45,
              color: AppTheme.accent2.withAlpha(70),
              imgWidth: 165,
              letra: 'C',
              //scale: 3.5,
            ),
          ),
        ],
      ),
    );
  }
}
