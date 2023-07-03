import 'package:reporte_guia/src/presentation/widgets/atomic/generic_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../config/app_theme.dart';
import 'car_alert_superior.dart';

class AlertCardW extends StatelessWidget {
  final String title;
  final String descripcion;
  final double width;
  final Color? backgroundColor;
  final Color? color;
  final void Function()? onPressed;
  final bool estado;

  const AlertCardW({super.key, required this.title, required this.descripcion, required this.width, this.backgroundColor, this.color, this.onPressed, required this.estado});


  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      child: AlertDialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
          insetPadding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 0.0),
          titlePadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          title: Column(
            children: [
              Container(
                width: width,
                decoration: const BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(20))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(19),
                  child: CarSuperior(
                    name: estado?'assets/images/guino.png':'assets/images/triste.png',
                    height: 150,
                    width: 400,
                  ),
                ),
              ),
              SizedBox(
                width: width,
                child: Column(
                  children: [
                    Container(margin: const EdgeInsets.symmetric(vertical: 15), child: Text(estado?"Envio exitoso":"Error", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20.0))),
                    Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        child: Text(
                          descripcion,
                          style: AppTheme.title1,
                          textAlign: TextAlign.center,
                        )),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: GenericButton(
                          title: title,
                          width: 200,
                          color: estado?Colors.green:Colors.red,
                          onPressed: onPressed,
                        ))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
