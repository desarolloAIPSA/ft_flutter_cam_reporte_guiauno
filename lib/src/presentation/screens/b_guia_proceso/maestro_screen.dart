// ignore_for_file: unnecessary_null_comparison

import 'package:reporte_guia/src/data/models/option_model.dart';
import 'package:reporte_guia/src/utils/alert_cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/app_theme.dart';
import '../../../config/constantes.dart';
import '../../../data/models/ora/flujo_datos1_model.dart';
import '../../../utils/formatter.dart';
import '../../providers/form_prov.dart';
import '../../providers/registro_provider.dart';
import '../z_menu/a_menu_screen.dart';
import '../b_formulario.dart';

class MaestroScreen extends StatefulWidget {
  const MaestroScreen({super.key});

  @override
  State<MaestroScreen> createState() => _MaestroScreenState();
}

class _MaestroScreenState extends State<MaestroScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final formProv = Provider.of<FormProvider>(context, listen: false);
      final regisProv = Provider.of<RegisProv>(context, listen: false);

      regisProv.registro = ConstProy.dummyRegistro;
      formProv.localGuiSimp = ConstProy.dummyTranportistaDbModel;
      regisProv.ddbtn2 = Option(label: '', value: '');
      regisProv.ddbtn3 = Option(label: '', value: '');
      debugPrint('TEST localGuiSimp init : ${formProv.localGuiSimp.toRawJson()}');
      formProv.cargarTransportistas().then((value) {
        debugPrint('TEST CARGA value: $value');
      });
      

      
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formProv = Provider.of<FormProvider>(context, listen: true);
    final maestro = formProv.masterTrans;
    final regisProv = Provider.of<RegisProv>(context, listen: true);
    Size size = MediaQuery.of(context).size;
    final formatterU = FormatterU();

    return SafeArea(
        child: WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MenuScreen()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 70,
            title: const Text(
              'Guía en Proceso',
              style: AppTheme.headlineLight,
            ),
            backgroundColor: AppTheme.primaryColor,
            elevation: 0.0),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: maestro.length,
                  itemBuilder: (context, i) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: AppTheme.primaryColor.withAlpha(40), border: Border.all(width: 2, color: AppTheme.primaryColor.withAlpha(50))),
                    child: ListTile(
                      leading: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.book, color: maestro[i].finternet == '0' ? AppTheme.rojo : AppTheme.primaryColor),
                        ],
                      ),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: size.width * 0.3, child: Text("ID: ${maestro[i].id} ", style: const TextStyle(fontSize: 20))),
                          Text(FlujoDatos1Model.fromRawJson(maestro[i].valor).tracto, style: const TextStyle(fontSize: 20)),
                        ],
                      ),
                      subtitle: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(FlujoDatos1Model.fromRawJson(maestro[i].valor).emrpesaTransportista),
                            Text('${formatterU.fechaCaseOne(FlujoDatos1Model.fromRawJson(maestro[i].valor).fArribo!)} ${FlujoDatos1Model.fromRawJson(maestro[i].valor).hArribo}'),
                          ],
                        ),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right, color: AppTheme.primaryColor.withAlpha(200)),
                      onLongPress: () async {
                        debugPrint('TEST onlongproess');
                        confirmar(context, model: maestro[i]);
                      },
                      onTap: () async {
                        formProv.localGuiSimp = maestro[i];
                        regisProv.registro = FlujoDatos1Model.fromRawJson(maestro[i].valor);
                        regisProv.etapa = maestro[i].page!;
                        if (regisProv.registro.tipAlce != null) {
                          regisProv.ddbtn2 = regisProv.listaTipoAlce.firstWhere(
                            (resTpAl) => resTpAl.label == regisProv.registro.tipAlce,
                          );
                        }
                        if (regisProv.registro.maquinaria != '') {
                          regisProv.ddbtn3 = regisProv.listaMaquinaria.firstWhere(
                            (resMaqui) => resMaqui.value == regisProv.registro.maquinaria,
                          );
                        }
                        //FECHAS
                        if (regisProv.registro.fArribo != null) {
                          regisProv.fArriboCampo = DateTime.parse(regisProv.registro.fArribo!);
                        }
                        if (regisProv.registro.fIniAlce != null) {
                          regisProv.fInicioAlce = DateTime.parse(regisProv.registro.fIniAlce!);
                        }
                        if (regisProv.registro.fFinAlce != null) {
                          regisProv.fFinAlce = DateTime.parse(regisProv.registro.fFinAlce!);
                        }
                        if (regisProv.registro.fSalida != null) {
                          regisProv.fSalidaCampo = DateTime.parse(regisProv.registro.fSalida!);
                        }
                        //HORAS
                        if (regisProv.registro.hArribo != null) {
                          regisProv.hArriboCampo = formatterU.stringToTimeofDate(regisProv.registro.hArribo!);
                        }
                        if (regisProv.registro.hIniAlce != null) {
                          regisProv.hInicioAlce = formatterU.stringToTimeofDate(regisProv.registro.hIniAlce!);
                        }
                        if (regisProv.registro.hFinAlce != null) {
                          regisProv.hFinAlce = formatterU.stringToTimeofDate(regisProv.registro.hFinAlce!);
                        }
                        if (regisProv.registro.hSalida != null) {
                          regisProv.hSalidaCampo = formatterU.stringToTimeofDate(regisProv.registro.hSalida!);
                        }

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MultiformPage()));
                      },
                    ),
                  )
                ),
            ),
          ],
        ),
      ),
    ));
  }
}
