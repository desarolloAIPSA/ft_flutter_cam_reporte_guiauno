import 'package:flutter/material.dart';

import '../../../config/app_theme.dart';

class FondoSup extends StatelessWidget {
  final String? version;

  const FondoSup({super.key, this.version});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondo = Container(
      height: size.height * 0.45,
      decoration: const BoxDecoration(color: AppTheme.rose),
    );

    final circulo1Mayor = Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: AppTheme.rosaLigth),
    );

    final circulo1Menor = Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(80), color: AppTheme.rose),
    );

    final circulo2Mayor = Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: AppTheme.rosaLigth),
    );

    final circulo2Menor = Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(80), color: AppTheme.rose),
    );

    final logo = SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 100, child: Image.asset('assets/images/cane.png')),
            Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  "Guia Electrónica \nde Campo ",
                  style: TextStyle(color: Colors.white, fontSize: 17, wordSpacing: 4, letterSpacing: 2),
                  textAlign: TextAlign.center,
                )),
          ],
        ));
    return Column(
      children: [
        Stack(
          children: <Widget>[
            fondo,
            Container(
                margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(
                  'v$version',
                  style: AppTheme.body1White,
                )),
            Positioned(top: 275.0, left: -25.0, child: circulo1Mayor),
            Positioned(top: 285.0, left: -15.0, child: circulo1Menor),
            Positioned(top: -20.0, right: -25.0, child: circulo1Mayor),
            Positioned(top: -10.0, right: -15.0, child: circulo1Menor),
            Positioned(top: 100.0, left: 25.0, child: circulo2Mayor),
            Positioned(top: 105.0, left: 30.0, child: circulo2Menor),
            Positioned(top: 25.0, left: 100.0, child: circulo2Mayor),
            Positioned(top: 30.0, left: 105.0, child: circulo2Menor),
            Positioned(bottom: 100.0, right: 25.0, child: circulo2Mayor),
            Positioned(bottom: 105.0, right: 30.0, child: circulo2Menor),
            Positioned(bottom: 25.0, right: 100.0, child: circulo2Mayor),
            Positioned(bottom: 30.0, right: 105.0, child: circulo2Menor),
            Positioned(bottom: size.height * 0.45 * 0.35, right: 0, child: logo),
          ],
        ),
        //fondo,
        //circulo
      ],
    );
  }
}
