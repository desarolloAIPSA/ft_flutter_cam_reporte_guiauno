// ignore_for_file: use_build_context_synchronously

import 'package:reporte_guia/src/presentation/screens/a_registro_qr/registro_manual_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import '../../../config/app_theme.dart';
import '../../../config/constantes.dart';
import '../../../data/controller/validar_form.dart';
import '../../../data/db/tranportista_db.dart';
import '../../../data/functions/local/transportista_local_fun.dart';
import '../../../data/functions/qr_calcs.dart';
import '../../../utils/alert_cards.dart';
import '../../../utils/formatter.dart';
import '../../media/sonido_media.dart';
import '../../providers/environment_provider.dart';
import '../../providers/form_prov.dart';
import '../../widgets/atomic/loading_indicator.dart';
import '../screens.dart';
import '../z_menu/d_tipo_form_screen.dart';
import 'confirmacion_screen.dart';

class RegistroQr extends StatefulWidget {
  const RegistroQr({super.key});

  @override
  State<RegistroQr> createState() => RegistromTransportista1Stat();
}

class RegistromTransportista1Stat extends State<RegistroQr> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final formProv = Provider.of<FormProvider>(context, listen: false);
      formProv.qr = ConstProy.dummyQrRead;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final regisProv = Provider.of<RegisProv>(context, listen: false);
    final enviromentProvider = Provider.of<EnviromentProvider>(context, listen: false);
    final formProv = Provider.of<FormProvider>(context, listen: true);
    final sonido = SonidoMedia();
    final qrCalc = QrCalc();
    final validarFormController = ValidarFormController();
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MenuScreen()));
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              '(A) Registro de Vehículos',
              style: AppTheme.headlineLight,
            ),
            backgroundColor: AppTheme.primaryColor,
            elevation: 0.0,
          ),
          body: formProv.isLoading
              ? const LoadingIndicator(
                  texto: "Validando",
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      decoration: BoxDecoration(color: AppTheme.primaryColor, borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: 150,
                      child: IconButton(
                        onPressed: () async {
                          
                          final barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancelar', true, ScanMode.BARCODE);
                          formProv.isLoading = true;
                          if (barcodeScanRes != '-1') {
                            await sonido.play(filePath: 'assets/sound/beep.mp3');
                            final jsonVal = qrCalc.strToJSON(model: barcodeScanRes);
                            if (jsonVal.tracto.isNotEmpty) {
                              formProv.formCaseOne.tracto = jsonVal.tracto;
                              formProv.formCaseOne.carreta1 = jsonVal.carreta1;
                              formProv.formCaseOne.carreta2 = jsonVal.carreta2;
                              formProv.formCaseOne.brevete = jsonVal.brevete;
                              formProv.formCaseOne.cantidad = jsonVal.cantidad ?? '';
                              final existeReg = await qrCalc.existe(input: formProv.formCaseOne);
                              if (existeReg.estado) {
                                final respuesta = await validarFormController.registroTranportista(environ: enviromentProvider.env, params: formProv.formCaseOne);
                                if (respuesta.estado) {
                                  final formatterU = FormatterU();
                                  List<String> fechActual = formatterU.actual();
                                  formProv.formCaseOne = respuesta.data;
                                  formProv.formCaseOne.fArribo = DateTime.now().toIso8601String();
                                  formProv.formCaseOne.hArribo = fechActual[1];
                                  final tranportistaLocalFun = TranportistaLocalFun();
                                  final insertar = await tranportistaLocalFun.insertarUno(model: formProv.formCaseOne);
                                  debugPrint('TEST insertar: ${insertar.toRawJson()}');
                                  await formProv.cargarTransportistas();
                                  formProv.guiaSize = await TranportistaDb.db.contarAll();
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ConfirmacionScreen()));
                                } else {
                                  alerta(context, estado: false, descripcion: respuesta.mensaje);
                                }
                              } else {
                                alerta(context, estado: false, descripcion: existeReg.mensaje);
                              }
                            } else {
                              alerta(context, estado: false, descripcion: "El formato de QR es incorrecto o no se ha encontrado datos");
                            }
                          }
                          formProv.isLoading = false;
                        },
                        icon: const Row(
                          children: [
                            Icon(
                              Icons.qr_code_2_sharp,
                              size: 125,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: Text(
                                'ESCANEAR QR',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.temaMainLigth,
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      decoration: BoxDecoration(color: AppTheme.primaryColor, borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: 150,
                      child: IconButton(
                          onPressed: () async {
                            formProv.formCaseOne= formProv.formCaseOne.toReset();
                            debugPrint('TEST formProv.formCaseOne: ${ConstProy.dummyRegistro.toRawJson()}');
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegistroManual(formKey: formProv.formKeyRegManual,)));                 
                          },
                          icon: const Row(
                            children: [
                              Icon(
                                Icons.keyboard,
                                size: 125,
                                color: Colors.white,
                              ),
                              Expanded(
                              child: Text(
                                'REGISTRO MANUAL',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTheme.temaMainLigth,
                                textAlign: TextAlign.center,
                              ),
                            )
                            ],
                          )),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
