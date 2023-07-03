// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:reporte_guia/src/config/app_theme.dart';
import 'package:reporte_guia/src/config/target_info_flutter.dart';
import 'package:reporte_guia/src/data/functions/qr_calcs.dart';
import 'package:reporte_guia/src/utils/alert_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import '../../../data/controller/validar_form.dart';
import '../../../utils/formato_texto.dart';
import '../../providers/device_provider.dart';
import '../../providers/environment_provider.dart';
import '../../providers/registro_provider.dart';
import '../../widgets/atomic/input_widget.dart';
import '../../widgets/compuesto/header_forms.dart';
import 'package:another_flushbar/flushbar.dart';

class FormEtapa1 extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const FormEtapa1({super.key, required this.formKey});

  @override
  State<FormEtapa1> createState() => _FormEtapa1State();
}

class _FormEtapa1State extends State<FormEtapa1> {
  @override
  Widget build(BuildContext context) {
    final regisProv = Provider.of<RegisProv>(context, listen: true);
    final enviromentProvider = Provider.of<EnviromentProvider>(context, listen: false);
    final devicePro = Provider.of<DevicePro>(context, listen: true);

    void _onFinish() {
      final flush = Flushbar(
        message: '¡Las placas son incorrectas!',
        flushbarStyle: FlushbarStyle.FLOATING,
        margin: const EdgeInsets.all(8.0),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        icon: const Icon(
          Icons.check_circle_outline_outlined,
          size: 28.0,
          color: Colors.green,
        ),
        duration: const Duration(seconds: 2),
        leftBarIndicatorColor: Colors.green,
      );
      flush.show(context);
    }

    return Column(
      children: [
        const HeaderFormW(title: "REGISTRO DE VEHÍCULO", descripcion: "La placa de vehículo es OBLIGATORIA \nLa placa de los Tractos 1 y 2 son opcionales"),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              height: 600,
              margin: const EdgeInsets.only(right: 10, left: 10),
              color: Colors.amber.withOpacity(0),
              child: Form(
                key: widget.formKey,
                child: Column(
                  children: <Widget>[
                    InputW(
                      labelText: 'Tracto',
                      hintText: 'Escriba la placa aquí ...',
                      hintStyle: AppTheme.hintStyle(),
                      initialValue: regisProv.registro.tracto,
                      onChanged: (value) {
                        regisProv.registro.tracto = value;
                        regisProv.validar1 = false;
                      },
                      maxLength: 6,
                      inputFormatters: [UpperCaseTextFormatter()],
                      style: AppTheme.estiloInput,
                    ),
                    InputW(
                      labelText: 'Carreta 1',
                      hintText: 'Escriba la placa aquí ...',
                      hintStyle: AppTheme.hintStyle(),
                      initialValue: regisProv.registro.carreta1,
                      onChanged: (value) {
                        regisProv.registro.carreta1 = value;
                        regisProv.validar1 = false;
                      },
                      maxLength: 6,
                      inputFormatters: [UpperCaseTextFormatter()],
                      style: AppTheme.estiloInput,
                    ),
                    InputW(
                      labelText: 'Carreta 2',
                      hintText: 'Escriba la placa aquí ...',
                      hintStyle: AppTheme.hintStyle(),
                      initialValue: regisProv.registro.carreta2,
                      onChanged: (value) {
                        regisProv.registro.carreta2 = value;
                        regisProv.validar1 = false;
                      },
                      maxLength: 6,
                      inputFormatters: [UpperCaseTextFormatter()],
                      style: AppTheme.estiloInput,
                    ),
                    if (devicePro.device == DeviceName.android)
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: 200,
                        height: 200,
                        child: IconButton(
                            onPressed: () async {
                              final qrCalc = QrCalc();
                              final validarFormController = ValidarFormController();
                              final barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.BARCODE);
                              regisProv.loading = true;
                              if (barcodeScanRes.isNotEmpty) {
                                regisProv.textLoading = 'Validando Placa(s)';
                                final jsonVal = qrCalc.strToJSON(model: barcodeScanRes);
                                if (jsonVal.tracto.isNotEmpty) {
                                  regisProv.registro.tracto = jsonVal.tracto;
                                  regisProv.registro.carreta1 = jsonVal.carreta1;
                                  regisProv.registro.carreta2 = jsonVal.carreta2;
                                  regisProv.registro.brevete = jsonVal.brevete;
                                  final respuesta = await validarFormController.validar(environ: enviromentProvider.env, params: regisProv.registro, etapa: 1);
                                  if (respuesta.estado) {
                                    regisProv.textLoading = 'Validando Brevete';
                                    regisProv.etapa = 2;
                                    regisProv.registro = respuesta.data;
                                    final respuesta2 = await validarFormController.validar(environ: enviromentProvider.env, params: regisProv.registro, etapa: 2);
                                    if (respuesta2.estado) {
                                      regisProv.etapa = 3;
                                      regisProv.registro = respuesta2.data;
                                    }
                                    debugPrint("TEST respuesta: ${regisProv.registro.toRawJson()}");
                                  } else {
                                    regisProv.etapa = 1;
                                    //_onFinish();
                                    /* MaterialApp(
                                      title: 'MyApp',
                                      onGenerateRoute: generateRoute,
                                      navigatorKey: regisProv.navigatorKey,
                                    ); */
                                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MultiformPage()));
                                  }
                                } else {
                                  alerta(context, estado: false, descripcion: "El formato de QR es incorrecto o no se ha encontrado datos");
                                }
                              }
                              regisProv.loading = false;
                            },
                            icon: Column(
                              children: [
                                Icon(
                                  Icons.qr_code_2_sharp,
                                  size: 150,
                                  color: AppTheme.primaryColor,
                                ),
                                Text(
                                  'QR',
                                  style: AppTheme.temaMain(AppTheme.primaryColor),
                                )
                              ],
                            )),
                      )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
