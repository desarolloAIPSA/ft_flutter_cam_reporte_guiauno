// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers, use_build_context_synchronously, sized_box_for_whitespace, unused_element, depend_on_referenced_packages

import 'package:reporte_guia/src/presentation/providers/z_providers.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:provider/provider.dart';
import '../../data/controller/save_case1_controller.dart';
import '../../data/controller/validar_form.dart';
import '../../data/functions/set_parametros_tabla_fun.dart';
import '../../data/models/ora/empresa_model.dart';
import '../../utils/alert_cards.dart';
import '../widgets/atomic/loading_indicator.dart';
import '../widgets/compuesto/footer_buttons.dart';
import 'b_guia_proceso/maestro_screen.dart';
import 'b_guia_proceso/c_guia_simple/confirmacion_cloud_screen.dart';
import 'b_guia_proceso/c_guia_simple/simple_etapa3.dart';
import 'b_guia_proceso/c_guia_simple/simple_etapa4.dart';
import 'b_guia_proceso/c_guia_simple/simple_etapa5.dart';

class MultiformPage extends StatefulWidget {
  final String? title;

  const MultiformPage({super.key, this.title});

  @override
  State<MultiformPage> createState() => _MultiformPageState();
}

class _MultiformPageState extends State<MultiformPage> {
  //final _formKey1 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  String? selectedRole = 'Writer';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ParameterTable parameterTable = ParameterTable();
      final regisProv = Provider.of<RegisProv>(context, listen: false);
      final casosProv = Provider.of<CasosProv>(context, listen: false);
      casosProv.paramCase1 = parameterTable.setParametersCaso1(listParametros: regisProv.listParam);
    });
    super.initState();
    //fetchData(); // Llamado a la función asíncrona desde initState()
  }

  Future<void> fetchData() async {
    //ChargeEnvironmet chargeEnvironmet = ChargeEnvironmet();
    //await chargeEnvironmet.seleccionarParams();
  }

  @override
  Widget build(BuildContext context) {
    ValidarFormController validarFormController = ValidarFormController();
    final regisProv = Provider.of<RegisProv>(context, listen: true);
    final enviromentProvider = Provider.of<EnviromentProvider>(context, listen: false);
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final casosProv = Provider.of<CasosProv>(context, listen: false);
    final formProv = Provider.of<FormProvider>(context, listen: true);

    void _onFinish() {
      final flush = Flushbar(
        message: '¡Formulario terminado!',
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

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MaestroScreen()));
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: regisProv.loading
              ? LoadingIndicator(
                  texto: regisProv.textLoading,
                )
              : Container(
                  color: Colors.white,
                  //child: stepper,
                  child: Column(
                    children: [
                      /* if (regisProv.etapa == 1)
                        Expanded(
                            child: Container(
                          height: 500,
                          child: FormGuiSimpleEt1(formKey: _formKey1),
                        )),
                      if (regisProv.etapa == 2)
                        Expanded(
                            child: Container(
                          height: 500,
                          child: FormGuiSimpleEt2(formKey: regisProv.formKey2),
                        )), */
                      if (regisProv.etapa == 1)
                        Expanded(
                            child: Container(
                          height: 500,
                          child: FormGuiSimpleEt3(formKey: _formKey3),
                        )),
                      if (regisProv.etapa == 2)
                        Expanded(
                            child: Container(
                          height: 500,
                          child: FormGuiSimpleEt4(formKey: regisProv.formKey4),
                        )),
                      if (regisProv.etapa == 3)
                        Expanded(
                            child: Container(
                          height: 500,
                          child: FormGuiSimpleEt5(formKey: _formKey5),
                        )),
                      SizedBox(
                          height: 80,
                          child: FooterButtonW(
                            etapa: regisProv.etapa,
                            maxEtapa: 5,
                            onPrev: () {
                              regisProv.etapa--;
                              //debugPrint("onPrev: ${regisProv.etapa}");
                            },
                            onNext: () async {
                              regisProv.loading = true;
                              if (regisProv.etapa == 1) {
                                regisProv.textLoading = 'Validando Orden de Cosecha';
                              } else if (regisProv.etapa == 2) {
                                regisProv.textLoading = 'Validando Información de Guía';
                              } else if (regisProv.etapa == 3) {
                                regisProv.textLoading = 'Enviando datos a la NUBE';
                              }

                              if (regisProv.registro.ordenCosecha.isNotEmpty) {
                                String valor = validarFormController.completeLeadingZeros(regisProv.registro.ordenCosecha, 10);
                                regisProv.registro.ordenCosecha = valor;
                              }

                              //final respuesta = await validarFormController.guiaSimple(environ: enviromentProvider.env, params: regisProv.registro, etapa: regisProv.etapa);
                              //debugPrint("TEST respuesta: ${respuesta.toRawJson()}");
                              //debugPrint("TEST contador: ${regisProv.etapa}");
                              if (regisProv.etapa == 3) {
                                //final respuesta = await validarFormController.guiaSimple(environ: enviromentProvider.env, params: regisProv.registro, etapa: 3);
                                SaveCase1Con saveCase1Con = SaveCase1Con();
                                
                                EmpresaOraModel empresaEncontrada = regisProv.listEmp.firstWhere(
                                  (empresa) {
                                    debugPrint('TEST empresa: ${empresa.toRawJson()}');
                                    debugPrint('TEST  loginProvider.modelo.empresa.value: ${loginProvider.modelo.empresa.value}');
                                    empresa.nombre == loginProvider.modelo.empresa.value;
                                    return true;
                                  },
                                  //orElse: () => null,
                                );
                                //debugPrint(" empresaEncontrada: ${empresaEncontrada.toRawJson()}");
                                final grabarRpt = await saveCase1Con.guardar(
                                    input: enviromentProvider.env, params: regisProv.registro, empresa: empresaEncontrada, paramsTable: casosProv.paramCase1, auth: loginProvider.auth);
                                if (grabarRpt.estado) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ConfirmacionCloudScreen(
                                                data: grabarRpt.data,
                                                update: formProv.localGuiSimp,
                                              )));
                                } else {
                                  alerta(context, descripcion: grabarRpt.mensaje, estado: false);
                                }
                              }

                              if (regisProv.etapa == 2) {
                                if (!(await regisProv.isvalidForm4())) {
                                  debugPrint('TEST punto 1');
                                  regisProv.loading = false;
                                  return;
                                }
                                final respuesta = await validarFormController.guiaSimple(environ: enviromentProvider.env, params: regisProv.registro, etapa: 2);

                                if (respuesta.estado) {
                                  regisProv.registro = respuesta.data;
                                  debugPrint('TEST punto 2');
                                  regisProv.etapa++;
                                } else {
                                  debugPrint('TEST punto 3');
                                  alerta(context, descripcion: respuesta.mensaje, estado: false);
                                }
                              }

                              if (regisProv.etapa == 1) {
                                final respuesta = await validarFormController.guiaSimple(environ: enviromentProvider.env, params: regisProv.registro, etapa: 1);
                                if (respuesta.estado) {
                                  regisProv.registro.descripcion = respuesta.data.descripcion;
                                  regisProv.etapa++;
                                } else {
                                  alerta(context, descripcion: respuesta.mensaje, estado: false);
                                }
                              }

                              debugPrint("TEST FIN Etapa: ${regisProv.etapa}");

                              regisProv.loading = false;
                            },
                          )),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

/*
if (regisProv.etapa == 1) {
  regisProv.textLoading = 'Validando Placas';
} else if (regisProv.etapa == 2) {
  regisProv.textLoading = 'Validando Brevete';
} else if (regisProv.etapa == 3) {
  regisProv.textLoading = 'Validando Orden de Cosecha';
} else if (regisProv.etapa == 4) {
  regisProv.textLoading = 'Validando Información de Guía';
} else if (regisProv.etapa == 5) {
  regisProv.textLoading = 'Enviando datos a la NUBE';
}

if (regisProv.etapa == 2) {
                              final respuesta = await validarFormController.guiaSimple(environ: enviromentProvider.env, params: regisProv.registro, etapa: 2);
                              if (respuesta.estado) {
                                regisProv.registro.breveteName = respuesta.data.breveteName;
                                regisProv.etapa++;
                              } else {
                                alerta(context, descripcion: respuesta.mensaje, estado: false);
                              }
                            }

                            if (regisProv.etapa == 1) {
                              final respuesta = await validarFormController.guiaSimple(environ: enviromentProvider.env, params: regisProv.registro, etapa: 1);
                              if (respuesta.estado) {
                                regisProv.registro.emrpesaTransportista = respuesta.data.emrpesaTransportista;
                                regisProv.registro.codEmrpesaTransportista = respuesta.data.codEmrpesaTransportista;
                                regisProv.etapa++;
                                //debugPrint("SUCCESS Etapa 1: ${regisProv.etapa}");
                              } else {
                                //debugPrint("Error Etapa 1: ${regisProv.etapa}");
                                alerta(context, descripcion: respuesta.mensaje, estado: false);
                              }
                            }
 */