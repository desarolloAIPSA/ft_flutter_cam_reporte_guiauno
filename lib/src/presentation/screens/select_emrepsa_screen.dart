import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/app_theme.dart';
import '../../config/charge_enviroment.dart';
import '../../data/models/option_model.dart';
import '../providers/a_login_provider.dart';
import '../providers/environment_provider.dart';
import 'a_splash_screen.dart';

class SelectEmpresa extends StatelessWidget {
  const SelectEmpresa({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: true);
    final enviromentProvider = Provider.of<EnviromentProvider>(context, listen: false);
    final chargeEnvironmet = ChargeEnvironmet();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Seleccione una Empresa",
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: -0.5,
                    color: Color(0xFF333333),
                  ),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: () async {
                    loginProvider.modelo.empresa = Option(label: '04', value: 'AGRO INDUSTRIAL PARAMONGA S.A.A');
                    AppTheme.setPrimaryColor(loginProvider.modelo.empresa);
                    enviromentProvider.env = await chargeEnvironmet.seleccionarParams(ambiente: EnvType.aipsa);
                    loginProvider.diparadorLoginProvider = false;
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreenP(logo: 'assets/empresa/aipsa.png', empresa: loginProvider.modelo.empresa.value)));

                  },
                  child: Container(
                    width: size.width * 0.7,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.withAlpha(45),
                      border: Border.all(
                        color: Colors.grey.withAlpha(200), // Color del borde
                        width: 2.0, // Ancho del borde
                      ),
                    ),
                    child: Image.asset('assets/empresa/aipsags.png'),
                  ),
                ),
                InkWell(
                  onTap: () async{
                    loginProvider.modelo.empresa = Option(label: '04', value: 'EMPRESA AZUCARERA EL INGENIO S.A.');//
                    AppTheme.setPrimaryColor(loginProvider.modelo.empresa);
                    enviromentProvider.env = await chargeEnvironmet.seleccionarParams(ambiente: EnvType.ingenio);
                    loginProvider.diparadorLoginProvider = false;
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreenP(logo: 'assets/empresa/ingenio.png', empresa: loginProvider.modelo.empresa.value)));
                  },
                  child: Container(
                    width: size.width * 0.7,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.withAlpha(45),
                      border: Border.all(
                        color: Colors.grey.withAlpha(200), // Color del borde
                        width: 2.0, // Ancho del borde
                      ),
                    ),
                    child: Image.asset('assets/empresa/ingeniogs.png'),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    ));
  }
}
