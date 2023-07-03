import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../providers/registro_provider.dart';
import '../../widgets/atomic/input_widget.dart';
import '../../widgets/compuesto/header_forms.dart';

class FormEtapa3 extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const FormEtapa3({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final regisProv = Provider.of<RegisProv>(context, listen: true);
    return Column(
      children: [
        const HeaderFormW(title: "REGISTRO DE GUÍA - I", descripcion: "Ingrese una ORDEN DE COSECHA válida"),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              height: 600,
              color: Colors.amber.withOpacity(0),
              margin: const EdgeInsets.only(right: 10,left: 10),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    /* LabelImageW(icon: Icons.agriculture, title: 'Placa Vehículo', value: regisProv.registro.placaVehiculo,height: 50,),
                    LabelImageW(icon: Icons.business_sharp, title: 'Empresa Transportista', value: regisProv.registro.emrpesaTransportista,height: 80,),
                    LabelImageW(icon: Icons.business_sharp, title: 'Brevete', value: regisProv.registro.breveteName,height: 40,),
                    const Divider(thickness: 2, color: Colors.black45, height: 15), */
                    InputW(
                      labelText: 'Orden de cosecha',
                      hintText: 'Escriba la ORDEN aquí',
                      hintStyle: AppTheme.hintStyle(),
                      initialValue: regisProv.registro.ordenCosecha,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      onChanged: (value){
                        //debugPrint("valueIOC: $value");
                        regisProv.registro.ordenCosecha=value;
                      },
                      style: AppTheme.estiloInput,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}