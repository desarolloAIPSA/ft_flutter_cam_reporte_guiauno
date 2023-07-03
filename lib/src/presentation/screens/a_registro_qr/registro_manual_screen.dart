// ignore_for_file: use_build_context_synchronously
import 'package:reporte_guia/src/presentation/screens/a_registro_qr/registro_qr_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/app_theme.dart';
import '../../../data/controller/validar_form.dart';
import '../../../data/db/tranportista_db.dart';
import '../../../data/functions/local/transportista_local_fun.dart';
import '../../../data/functions/qr_calcs.dart';
import '../../../utils/alert_cards.dart';
import '../../../utils/formato_texto.dart';
import '../../../utils/formatter.dart';
import '../../providers/environment_provider.dart';
import '../../providers/form_prov.dart';
import '../../providers/loading_provider.dart';
import '../../widgets/atomic/icon_button_widget.dart';
import '../../widgets/atomic/input_widget.dart';
import '../../widgets/atomic/loading_indicator.dart';
import 'confirmacion_screen.dart';

class RegistroManual extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const RegistroManual({super.key, required this.formKey});

  @override
  State<RegistroManual> createState() => _ForTransportistaState();
}

class _ForTransportistaState extends State<RegistroManual> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enviromentProvider = Provider.of<EnviromentProvider>(context, listen: false);
    final formProv = Provider.of<FormProvider>(context, listen: true);
    final loadProv = Provider.of<LoadProv>(context, listen: true);
    final validarFormController = ValidarFormController();
    final formatterU = FormatterU();
    final qrCalc = QrCalc();
    final tranportistaLocalFun = TranportistaLocalFun();
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegistroQr()));
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
              title: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Registro Manual',
                    style: AppTheme.headlineLight,
                    textAlign: TextAlign.center,
                  )),
              backgroundColor: AppTheme.primaryColor,
              elevation: 0.0),
          body: loadProv.regManualPage
              ? const LoadingIndicator(
                  texto: "Validando",
                )
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: GestureDetector(
                          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            height: 800,
                            margin: const EdgeInsets.only(right: 10, left: 10),
                            color: Colors.amber.withOpacity(0),
                            child: Form(
                              key: widget.formKey,
                              child: Column(
                                children: <Widget>[
                                  InputW(
                                    labelText: 'Tracto',
                                    hintText: 'Escriba la placa aquí',
                                    hintStyle: AppTheme.hintStyle(),
                                    initialValue: formProv.formCaseOne.tracto,
                                    onChanged: (value) async {
                                      formProv.formCaseOne.tracto = value;
                                      loadProv.trigger = false;
                                    },
                                    maxLength: 6,
                                    inputFormatters: [UpperCaseTextFormatter()],
                                    style: AppTheme.estiloInput,
                                  ),
                                  InputW(
                                    labelText: 'Carreta 1',
                                    hintText: 'Escriba la placa aquí',
                                    hintStyle: AppTheme.hintStyle(),
                                    initialValue: formProv.formCaseOne.carreta1,
                                    onChanged: (value) async {
                                      formProv.formCaseOne.carreta1 = value;
                                      loadProv.trigger = false;
                                    },
                                    maxLength: 6,
                                    inputFormatters: [UpperCaseTextFormatter()],
                                    style: AppTheme.estiloInput,
                                  ),
                                  InputW(
                                    labelText: 'Carreta 2',
                                    hintText: 'Escriba la placa aquí',
                                    hintStyle: AppTheme.hintStyle(),
                                    initialValue: formProv.formCaseOne.carreta2,
                                    onChanged: (value) async {
                                      formProv.formCaseOne.carreta2 = value;
                                      loadProv.trigger = false;
                                    },
                                    maxLength: 6,
                                    inputFormatters: [UpperCaseTextFormatter()],
                                    style: AppTheme.estiloInput,
                                  ),
                                  InputW(
                                    labelText: 'Brevete',
                                    hintText: 'Escriba el brevete aquí',
                                    hintStyle: AppTheme.hintStyle(),
                                    initialValue: formProv.formCaseOne.brevete,
                                    onChanged: (value) async {
                                      formProv.formCaseOne.brevete = value;
                                      loadProv.trigger = false;
                                    },
                                    maxLength: 10,
                                    inputFormatters: [UpperCaseTextFormatter()],
                                    style: AppTheme.estiloInput,
                                  ),
                                  InputW(
                                    labelText: 'Cantidad de Caña',
                                    hintText: 'Escriba el peso aprox. aquí',
                                    hintStyle: AppTheme.hintStyle(),
                                    initialValue: formProv.formCaseOne.cantidad,
                                    onChanged: (value) async {
                                      formProv.formCaseOne.cantidad = value;
                                      loadProv.trigger = false;
                                    },
                                    maxLength: 15,
                                    inputFormatters: [UpperCaseTextFormatter()],
                                    style: AppTheme.estiloInput,
                                    keyboardType: TextInputType.number,
                                  ),
                                  ImageButton(
                                      color: AppTheme.primaryColor,
                                      width: 400,
                                      icon: Icons.save_outlined,
                                      title: "Registrar",
                                      onPressed: () async {
                                        loadProv.regManualPage = true;
                                        final existeReg = await qrCalc.existe(input: formProv.formCaseOne);
                                        if (existeReg.estado) {
                                          final respuesta = await validarFormController.registroTranportista(environ: enviromentProvider.env, params: formProv.formCaseOne);
                                          if (respuesta.estado) {
                                            List<String> fechActual = formatterU.actual();
                                            formProv.formCaseOne = respuesta.data;
                                            formProv.formCaseOne.fArribo = DateTime.now().toIso8601String();
                                            formProv.formCaseOne.hArribo = fechActual[1];
                                            final insertar = await tranportistaLocalFun.insertarUno(model: formProv.formCaseOne);
                                            debugPrint('TEST insertar: ${insertar.toRawJson()}');
                                            await formProv.cargarTransportistas();
                                            formProv.guiaSize = await TranportistaDb.db.contarAll();
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ConfirmacionScreen()));
                                          } else {
                                            alerta(context, estado: false, descripcion: respuesta.mensaje);
                                          }
                                        } else {
                                          alerta(context, estado: false, descripcion: existeReg.mensaje);
                                        }

                                        loadProv.regManualPage = false;
                                      }),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
