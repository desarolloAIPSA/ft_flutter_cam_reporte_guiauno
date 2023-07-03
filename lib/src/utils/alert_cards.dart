import 'package:reporte_guia/src/presentation/widgets/compuesto/alert_cards_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/db/tranportista_db.dart';
import '../data/models/db/transportista_db_model.dart';
import '../presentation/providers/form_prov.dart';
import '../presentation/widgets/atomic/text_label_simple_widget.dart';
import '../presentation/widgets/compuesto/card_confirm_widget.dart';

alerta(BuildContext context,{required bool estado,required String descripcion}) {
  //final size = MediaQuery.of(context).size;

  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertCardW(
        title: "Intentar de nuevo", 
        width: 400,
        descripcion: descripcion,
        estado: estado,
        onPressed: () => Navigator.of(context).pop(true),
      );
    }
  );
}

confirmar(BuildContext context,{required TranportistaDbModel model}) {

  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      final formProv = Provider.of<FormProvider>(context, listen: false);
      Size size = MediaQuery.of(context).size;
      debugPrint('TEST size: ${size.toString()}');
      return Container(
        margin: const EdgeInsets.only(top:210,bottom: 210),
        child: CarConfirmW(
          child: Column(
            children: [
              SimpleLabelW(icon: Icons.key_outlined, label: 'Id', value: '${model.id}'),
              SimpleLabelW(icon: Icons.rectangle_outlined, label: 'Placa', value: model.placa),            ],
          ),
          onCancel: ()async{
           await TranportistaDb.db.deleteById(model.id!);
           await formProv.cargarTransportistas();
           formProv.guiaSize = await TranportistaDb.db.contarAll();
           Navigator.of(context).pop(true);
          },
          onConfirm: ()=> Navigator.of(context).pop(true),
        ),
      );
    }
  );
}
