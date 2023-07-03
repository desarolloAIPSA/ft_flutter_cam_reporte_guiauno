// ignore_for_file: use_build_context_synchronously

import 'package:reporte_guia/src/presentation/screens/screens.dart';
import 'package:reporte_guia/src/presentation/screens/tabla/data_table_screen.dart';
import 'package:reporte_guia/src/utils/alert_cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/app_theme.dart';
import '../../config/target_info_flutter.dart';
import '../../data/controller/validar_form.dart';
import '../../data/db/tranportista_db.dart';
import '../../data/functions/local/all_local_fun.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../../data/services/a_ora_service.dart';
import '../../utils/formatter.dart';
import '../providers/a_login_provider.dart';
import '../providers/device_provider.dart';
import '../providers/environment_provider.dart';
import '../providers/form_prov.dart';
import '../providers/registro_provider.dart';
import '../widgets/atomic/icon_button_widget.dart';
import '../widgets/atomic/input_icon_widget.dart';
import '../widgets/atomic/input_password_widget.dart';
import '../widgets/atomic/loading_indicator.dart';
import '../widgets/compuesto/fondo_superior_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FocusNode focusNode1;
  late FocusNode focusNode2;

  @override
  void initState() {
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode2.addListener(() {
      setState(() {});
    });
    focusNode1.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: true);
    final envProvider = Provider.of<EnviromentProvider>(context, listen: false);
    final regisProv = Provider.of<RegisProv>(context, listen: false);
    final deviceProv = Provider.of<DevicePro>(context, listen: false);
    final formProv = Provider.of<FormProvider>(context, listen: false);

    AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();
    final validarFormController = ValidarFormController();
    final enviromentProvider = Provider.of<EnviromentProvider>(context, listen: false);

    final oraService = OraService();
    final allLocalFun = AllLocalFun();
    final formatterU = FormatterU();


    return SafeArea(
      child: WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SelectEmpresa()));
        return true;
      },
      child: Scaffold(
        body: loginProvider.loading
            ? const LoadingIndicator(
                texto: "Autenticando",
              )
            : SingleChildScrollView(
                child: GestureDetector(
                onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
                behavior: HitTestBehavior.opaque,
                  child: Column(
                    children: [
                      FondoSup(version: deviceProv.package.version),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Form(
                          child: Column(
                          children: [
                            InputIconW(
                                style: const TextStyle(letterSpacing: 2,fontSize: 20),
                                maxLength: 6,
                                prefixIcon: Icons.person,
                                focusNode: focusNode1,
                                fillColor: focusNode1.hasFocus ? Colors.white : Colors.grey.withAlpha(10),
                                initialValue: loginProvider.modelo.usuario,
                                labelText: "Usuario",
                                onChanged: (value) {
                                  loginProvider.modelo.usuario = value;
                                  loginProvider.diparadorLoginProvider = true;
                                },
                                height: 70.0,
                                ),
                            InputPasswordW(
                                style: const TextStyle(letterSpacing: 2, fontSize: 20),
                                obscureText: loginProvider.controlPass,
                                height: 70,
                                maxLength: 10,
                                prefixIcon: Icons.lock,
                                focusNode: focusNode2,
                                fillColor: focusNode2.hasFocus ? Colors.white : Colors.grey.withAlpha(1),
                                initialValue: loginProvider.modelo.password,
                                labelText: "Contraseña",
                                suffixIcon: GestureDetector(
                                  onTap: () => loginProvider.controlPass = !loginProvider.controlPass,
                                  child: Icon(
                                    loginProvider.controlPass ? Icons.visibility_off : Icons.visibility,
                                    size: 23.0,
                                    color: loginProvider.controlPass ? Colors.black45 : AppTheme.primaryColor,
                                  ),
                                ),
                                onChanged: (value) {
                                  loginProvider.modelo.password = value;
                                  loginProvider.diparadorLoginProvider = true;
                                }),
                            /* DropDownButtonW(
                              height: 60,
                              items: regisProv.listOpcionEmpresa,
                              value: loginProvider.modelo.empresa,
                              vacio: 'Seleccione Empresa',
                              color: Colors.grey,
                              onChanged: (value) {
                                if (value != null) {
                                  debugPrint("TEST value: ${value.toString()}");
                                  loginProvider.modelo.empresa = value;
                                  loginProvider.diparadorLoginProvider = false;
                                  AppTheme.setPrimaryColor(loginProvider.modelo.empresa);
                                }
                              },
                            ), */
                            ImageButton(
                                color: AppTheme.primaryColor,
                                width: 400,
                                icon: Icons.login,
                                title: "Ingresar",
                                onPressed: () async {
                                  loginProvider.loading = true;
                                  if (loginProvider.modelo.usuario != '' && loginProvider.modelo.password != '') {
                                    final consulta = await authRepositoryImpl.login(envProvider.env, loginProvider.modelo);
                                    if (consulta.data.estado) {
                                      loginProvider.auth = consulta.data;
                
                                      final parametrosTabla = await oraService.consultarParametros(envProvider.env);
                                      regisProv.listaMaquinaria = await validarFormController.listaMaquinaria(environ: enviromentProvider.env);
                                      regisProv.listaTipoAlce = await validarFormController.listaTipoAlce(environ: enviromentProvider.env);
                                      regisProv.listParam = parametrosTabla.data;
                                      regisProv.etapa = 1;
                                      //local DB
                                      if (deviceProv.device == DeviceName.android){
                                        await allLocalFun.iniciarDB();
                                        formProv.guiaSize = await TranportistaDb.db.contarAll();
                                      }
                                      //final reporte = await oraService.listaReporte(input: enviromentProvider.env, queryParam: {'fechaIni': formatterU.fecHorQueryORa( formatterU.substractHoras(DateTime.now(),24)), 'fechaFin':formatterU.fecHorQueryORa(DateTime.now())});
                                      final reporte = await oraService.listaReporte(input: enviromentProvider.env, queryParam: {'fechaIni': '20230701T00:00:00', 'fechaFin':formatterU.fecHorQueryORa(DateTime.now())});
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DataTable2SimpleDemo(
                                        data: reporte.data,
                                      )));
                                    } else {
                                      alerta(context, estado: false, descripcion: consulta.mensaje);
                                    }
                                  }
                                  await Future.delayed(const Duration(milliseconds: 1500));
                                  loginProvider.loading = false;
                                }),
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    ));
  }
}
