import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/app_theme.dart';
import '../../../../data/functions/local/transportista_local_fun.dart';
import '../../../providers/form_prov.dart';
import '../../../providers/registro_provider.dart';
import '../../../widgets/atomic/input_widget.dart';
import '../../../widgets/compuesto/header_forms.dart';

class FormGuiSimpleEt3 extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const FormGuiSimpleEt3({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final regisProv = Provider.of<RegisProv>(context, listen: true);
    final formProv = Provider.of<FormProvider>(context, listen: true);
    final tranportistaLocalFun = TranportistaLocalFun();
    return Column(
      children: [
        const HeaderFormW(title: "REGISTRO DE GUÍA - I", descripcion: "Ingrese una ORDEN DE COSECHA válida"),
        Expanded(
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
              behavior: HitTestBehavior.opaque,
              child: Container(
                height: 600,
                color: Colors.amber.withOpacity(0),
                margin: const EdgeInsets.only(right: 10, left: 10),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      InputW(
                        labelText: 'Orden de cosecha',
                        hintText: 'Escriba la ORDEN aquí',
                        hintStyle: AppTheme.hintStyle(),
                        initialValue: regisProv.registro.ordenCosecha,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        onChanged: (value) async {
                          regisProv.registro.ordenCosecha = value;
                          formProv.localGuiSimp.valor = regisProv.registro.toRawJson();
                          formProv.localGuiSimp.page = 1;
                          await tranportistaLocalFun.actualizarPorValorYPagina(model: formProv.localGuiSimp);
                          debugPrint('TEST localGuiSimp init : ${formProv.localGuiSimp.valor.toString()}');
                          debugPrint('TEST localGuiSimp');
                        },
                        style: AppTheme.estiloInput,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
