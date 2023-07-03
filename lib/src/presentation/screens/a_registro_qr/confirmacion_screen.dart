// ignore_for_file: use_build_context_synchronously

import 'package:reporte_guia/src/presentation/widgets/atomic/confirmation_v1_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/formatter.dart';
import '../../providers/form_prov.dart';
import '../../widgets/atomic/label_container_widget.dart';
import 'registro_qr_screen.dart';

class ConfirmacionScreen extends StatelessWidget {
  const ConfirmacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formProv = Provider.of<FormProvider>(context, listen: true);
    final formatterU = FormatterU();
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: ConfirmationW(title: 'Vehículo Registrado Correctamente',
           widget: Column(
            children: [
              LabelContainerW(
                icon: Icons.rectangle_outlined,
                title: 'Placa de Tracto',
                value: formProv.formCaseOne.tracto,
                height: 40,
              ),
              if(formProv.formCaseOne.carreta1!='')LabelContainerW(
                icon: Icons.rectangle_outlined,
                title: 'Placa de Carreta 1',
                value: formProv.formCaseOne.carreta1!,
                height: 40,
              ),
              if(formProv.formCaseOne.carreta2!='')LabelContainerW(
                icon: Icons.credit_card_sharp,
                title: 'Placa de Carreta 2',
                value: formProv.formCaseOne.carreta2!,
                height: 40,
              ),
              if(formProv.formCaseOne.cantidad!='')LabelContainerW(
                icon: Icons.scale,
                title: 'Cantidad de Caña',
                value: formProv.formCaseOne.cantidad!,
                height: 40,
              ),
              LabelContainerW(
                icon: Icons.credit_card,
                title: 'Brevete',
                value: formProv.formCaseOne.brevete,
                height: 40,
              ),
              LabelContainerW(
                icon: Icons.calendar_month,
                title: 'Fecha de Llegada',
                value: '${formatterU.fechaCaseOne(formProv.formCaseOne.fArribo!)}  ${formProv.formCaseOne.hArribo!}',
                height: 40,
              ),
            ],
          ), 
           icon: Icons.navigate_next_rounded, 
           textButon: 'Continuar',
           onPressed: () async {              
              debugPrint('TEST Continuar');
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegistroQr()));
            },)
        ),
      ),
    );
  }
}

