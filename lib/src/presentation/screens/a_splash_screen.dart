// ignore_for_file: library_prefixes, library_private_types_in_public_api

import 'package:reporte_guia/src/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/target_info_flutter.dart';
import '../../data/controller/validar_form.dart';
import '../../data/services/a_ora_service.dart';
import '../providers/device_provider.dart';
import '../providers/environment_provider.dart';
import '../providers/registro_provider.dart';
import 'a_login.dart';

class SplashScreenP extends StatefulWidget {
  final String logo;
  final String empresa;

  const SplashScreenP({super.key, required this.logo, required this.empresa});

  @override
  _SplashScreenPState createState() => _SplashScreenPState();
}

class _SplashScreenPState extends State<SplashScreenP> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  /*  late Animation<double> rotacion;

  late Animation<double> opacidad;
  late Animation<double> opacidadOut;

  late Animation<double> moverDerecha;
  late Animation<double> agrandar; */
  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;
  //late Animation<double> agrandarContainer;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));

    moverDerecha = Tween(begin: 0.0, end: 50.0).animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.bounceOut)));

    moverArriba = Tween(begin: 0.0, end: -50.0).animate(CurvedAnimation(parent: controller, curve: Interval(0.25, 0.5, curve: Curves.bounceOut)));

    moverIzquierda = Tween(begin: 0.0, end: -50.0).animate(CurvedAnimation(parent: controller, curve: Interval(0.5, 0.75, curve: Curves.bounceOut)));

    moverAbajo = Tween(begin: 0.0, end: 50.0).animate(CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.bounceOut)));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
        controller.repeat();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      DateTime inicio = DateTime.now();
      OraService oraService = OraService();
      ValidarFormController validarFormController = ValidarFormController();
      //final chargeEnvironmet = ChargeEnvironmet();
      final targetInfoC = TargetInfoC();
      final enviromentProvider = Provider.of<EnviromentProvider>(context, listen: false);
      final regisProv = Provider.of<RegisProv>(context, listen: false);
      final deviceProv = Provider.of<DevicePro>(context, listen: false);

      //chargeEnvironmet.seleccionarParams().then((value) {
      //enviromentProvider.env = value;
      oraService.consultarEmpresas(enviromentProvider.env).then((value) {
        regisProv.listEmp = value.data;
        regisProv.listOpcionEmpresa = validarFormController.listaEmpresa(value.data);
        targetInfoC.getTarget().then((value) {
          deviceProv.device = value;
          targetInfoC.initPackageInfo().then((value) {
            deviceProv.package = value;
            DateTime fin = DateTime.now();
            Duration diferencia = fin.difference(inicio);
            int diff = diferencia.inMilliseconds;
            if (diff <= 2000) {
              Future.delayed(Duration(milliseconds: 3000-diff)).then((value){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              });
            }else{
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            }
          });
        });
      });
      //});
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Play / Reproducción
    controller.forward();

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SelectEmpresa()));
          return true;
        },
        child: Scaffold(
          body: AnimatedBuilder(
            animation: controller,
            child: Rectangulo(logo: widget.logo),
            builder: (BuildContext context, Widget? childRectangulo) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.translate(
                    offset: Offset(0, moverArriba.value + moverAbajo.value),
                    child: childRectangulo,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: const Text(
                        "Bienvenido ",
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          letterSpacing: -0.5,
                          color: Color(0xFF333333),
                        ),
                      ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Rectangulo extends StatelessWidget {
  final double? width;
  final String logo;

  const Rectangulo({super.key, this.width, required this.logo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          //color: Colors.red,
          ),
      child: Image.asset(
        logo,
        scale: 1,
      ),
    );
  }
}
