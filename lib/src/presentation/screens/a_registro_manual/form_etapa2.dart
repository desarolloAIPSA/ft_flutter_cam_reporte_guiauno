import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../config/app_theme.dart';
import '../../../utils/formato_texto.dart';
import '../../providers/registro_provider.dart';
import '../../widgets/atomic/input_widget.dart';
import '../../widgets/atomic/label_image_widget.dart';
import '../../widgets/compuesto/header_forms.dart';

class FormEtapa2 extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const FormEtapa2({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final regisProv = Provider.of<RegisProv>(context, listen: true);
    return Column(
      children: [
        const HeaderFormW(title: "TRANSPORTISTA Y CONDUCTOR", descripcion: "Ingrese el brevete del transportista encargado"),
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
                    //const SizedBox(height: 20),
                    LabelImageW(icon: Icons.business_sharp, title: 'Empresa Transportista', value: regisProv.registro.emrpesaTransportista,height: 80,),
                    Divider(thickness: 2, color: AppTheme.primaryColor, height: 15),
        
                    InputW(labelText: 'Brevete',
                      initialValue: regisProv.registro.brevete,
                      maxLength: 10,
                      inputFormatters: [UpperCaseTextFormatter()],
                      onChanged: (value){
                        regisProv.registro.brevete = value;
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