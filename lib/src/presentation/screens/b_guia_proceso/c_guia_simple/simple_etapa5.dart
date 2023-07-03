import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../config/app_theme.dart';
import '../../../../utils/formatter.dart';
import '../../../providers/casos_provider.dart';
import '../../../providers/registro_provider.dart';
import '../../../widgets/atomic/label_image_widget.dart';
import '../../../widgets/compuesto/header_forms.dart';

class FormGuiSimpleEt5 extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const FormGuiSimpleEt5({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    FormatterU formatterU = FormatterU();
    final regisProv = Provider.of<RegisProv>(context, listen: true);
    final casosProv = Provider.of<CasosProv>(context, listen: false);

    //Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const HeaderFormW(title: "RESUMEN", descripcion: ""),
        Expanded(
          child: RawScrollbar(
            radius: const Radius.circular(75),
            thumbVisibility: true,
            thickness: 5,
            thumbColor: AppTheme.primaryColor,
            child: SingleChildScrollView(
              child: GestureDetector(
                onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  height: 1100,
                  color: Colors.amber.withOpacity(0),
                  margin: const EdgeInsets.only(right: 10, left: 10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        //LabelImageW(icon: Icons.agriculture, title: 'Placa Vehículo', value: regisProv.registro.tracto,height: 40,),
                        LabelImageW(
                          icon: Icons.rectangle_outlined,
                          title: 'Placa de Tracto',
                          value: regisProv.registro.tracto,
                          height: 40,
                        ),
                        if (regisProv.registro.carreta1 != '')
                          LabelImageW(
                            icon: Icons.rectangle_outlined,
                            title: 'Placa de Carreta 1',
                            value: regisProv.registro.carreta1!,
                            height: 40,
                          ),
                        if (regisProv.registro.carreta2 != '')
                          LabelImageW(
                            icon: Icons.rectangle_outlined,
                            title: 'Placa de Carreta 2',
                            value: regisProv.registro.carreta2!,
                            height: 40,
                          ),
                        LabelImageW(
                          icon: Icons.business_sharp,
                          title: 'Empresa Transportista',
                          value: regisProv.registro.emrpesaTransportista,
                          height: 80,
                        ),
                        LabelImageW(
                          icon: Icons.car_rental_rounded,
                          title: 'Chofer',
                          value: regisProv.registro.breveteName,
                          height: 40,
                        ),
                        LabelImageW(
                          icon: Icons.delivery_dining_outlined,
                          title: 'Orden',
                          value: regisProv.registro.ordenCosecha,
                          height: 50,
                        ),
                        LabelImageW(
                          icon: Icons.delivery_dining_outlined,
                          title: 'Campo',
                          value: regisProv.registro.descripcion!,
                          height: 50,
                        ),
                        Divider(thickness: 2, color: AppTheme.primaryColor, height: 15),
                        LabelImageW(
                          icon: Icons.local_fire_department_rounded,
                          title: 'Tipo de Quema',
                          value: '(${regisProv.registro.flagQuema ?? ''}) ${(regisProv.registro.flagQuema == 'A') ? 'QUEMADA' : 'SIN QUEMAR'}',
                          height: 45,
                        ),
                        LabelImageW(
                          icon: Icons.numbers_outlined,
                          title: 'Cantidad',
                          value: '${regisProv.registro.cantidad} (${casosProv.paramCase1.undTon})',
                          height: 45,
                        ),
                        LabelImageW(
                          icon: Icons.agriculture,
                          title: 'Tipo de Alce',
                          value: '(${regisProv.ddbtn2.label}) ${regisProv.ddbtn2.value}',
                          height: 45,
                        ),
                        LabelImageW(
                          icon: Icons.agriculture,
                          title: 'Maquinaria',
                          value: regisProv.registro.maquinaria!,
                          height: 45,
                        ),
                        LabelImageW(
                          icon: Icons.precision_manufacturing_outlined,
                          title: 'Operador de Maquinaria',
                          value: regisProv.registro.operador!,
                          height: 45,
                        ),
                        Divider(thickness: 2, color: AppTheme.primaryColor, height: 15),
                        LabelImageW(
                          icon: Icons.calendar_month,
                          title: 'Llegada a Campo',
                          value: '${formatterU.fechaCaseOne(regisProv.fArriboCampo.toIso8601String())} ${formatterU.timeOfDateToString(regisProv.hArriboCampo)}',
                          height: 50,
                        ),
                        LabelImageW(
                          icon: Icons.calendar_month,
                          title: 'Inicio de Alce',
                          value: '${formatterU.fechaCaseOne(regisProv.fInicioAlce.toIso8601String())} ${formatterU.timeOfDateToString(regisProv.hInicioAlce)}',
                          height: 50,
                        ),
                        LabelImageW(
                          icon: Icons.calendar_month,
                          title: 'Fin de Alce',
                          value: '${formatterU.fechaCaseOne(regisProv.fFinAlce.toIso8601String())} ${formatterU.timeOfDateToString(regisProv.hFinAlce)}',
                          height: 50,
                        ),
                        LabelImageW(
                          icon: Icons.calendar_month,
                          title: 'Salida a Campo',
                          value: '${formatterU.fechaCaseOne(regisProv.fSalidaCampo.toIso8601String())} ${formatterU.timeOfDateToString(regisProv.hSalidaCampo)}',
                          height: 50,
                        ),
                        /* GenericButton(
                          title: "title",
                          width: 300,
                          color: Colors.green,
                          onPressed: () {
                            final rpt = formatterU.fecHorStrToORA(regisProv.registro.fArribo!, regisProv.registro.hArribo!);
                            debugPrint("rpt: $rpt");
                            debugPrint("rpt: ${formatterU.fechaOracleSave().toString()}");
                            debugPrint("rpt: ${formatterU.fechaOracleDate().toString()}");
                          },
                        ) */
                      ],
                    ),
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
