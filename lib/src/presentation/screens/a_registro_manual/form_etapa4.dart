import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../utils/expresiones_regulares.dart';
import '../../../utils/formato_texto.dart';
import '../../../utils/formatter.dart';
import '../../providers/casos_provider.dart';
import '../../providers/registro_provider.dart';
import '../../widgets/atomic/drop_down_button_label_widget.dart';
import '../../widgets/atomic/input_widget.dart';
import '../../widgets/compuesto/date_time_selector.dart';
import '../../widgets/compuesto/header_forms.dart';

class FormEtapa4 extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const FormEtapa4({super.key, required this.formKey});

  @override
  State<FormEtapa4> createState() => _FormEtapa4State();
}

class _FormEtapa4State extends State<FormEtapa4> {
  TextEditingController dateController1 = TextEditingController();
  TextEditingController dateController2 = TextEditingController();
  TextEditingController dateController3 = TextEditingController();
  TextEditingController dateController4 = TextEditingController();
  TextEditingController hourController1 = TextEditingController();
  TextEditingController hourController2 = TextEditingController();
  TextEditingController hourController3 = TextEditingController();
  TextEditingController hourController4 = TextEditingController();
  FormatterU formatterU = FormatterU();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final dateProvider = Provider.of<RegisProv>(context, listen: false);
      final regisProv = Provider.of<RegisProv>(context, listen: false);
      //debugPrint("firsttime");
      //debugPrint("dateProvider.fArriboCampo: ${dateProvider.fArriboCampo}");
      regisProv.registro.fArribo ??= dateProvider.fArriboCampo.toIso8601String();
      regisProv.registro.fIniAlce ??= dateProvider.fInicioAlce.toIso8601String();
      regisProv.registro.fFinAlce ??= dateProvider.fFinAlce.toIso8601String();
      regisProv.registro.fSalida ??= dateProvider.fSalidaCampo.toIso8601String();
      
      regisProv.registro.hArribo ??=  formatterU.timeOfDateToString(dateProvider.hArriboCampo);
      regisProv.registro.hIniAlce ??= formatterU.timeOfDateToString(dateProvider.hArriboCampo);
      regisProv.registro.hFinAlce ??= formatterU.timeOfDateToString(dateProvider.hArriboCampo);
      regisProv.registro.hSalida ??= formatterU.timeOfDateToString(dateProvider.hArriboCampo);


      dateController1.addListener(() {
        dateProvider.fArriboCampo = DateTime.parse(dateController1.value.text);
        regisProv.registro.fArribo = dateController1.value.text;
      });
      dateController2.addListener(() {
        dateProvider.fInicioAlce = DateTime.parse(dateController2.value.text);
        regisProv.registro.fIniAlce = dateController2.value.text;
      });
      dateController3.addListener(() {
        dateProvider.fFinAlce = DateTime.parse(dateController3.value.text);
        regisProv.registro.fFinAlce = dateController3.value.text;
      });
      dateController4.addListener(() {
        dateProvider.fSalidaCampo = DateTime.parse(dateController4.value.text);
        regisProv.registro.fSalida = dateController4.value.text;
      });

      hourController1.addListener(() {
        dateProvider.hArriboCampo = formatterU.stringToTimeofDate(hourController1.value.text);
        regisProv.registro.hArribo = hourController1.value.text;
      });
      hourController2.addListener(() {
        dateProvider.hInicioAlce = formatterU.stringToTimeofDate(hourController2.value.text);
        regisProv.registro.hIniAlce = hourController2.value.text;
      });
      hourController3.addListener(() {
        dateProvider.hFinAlce = formatterU.stringToTimeofDate(hourController3.value.text);
        regisProv.registro.hFinAlce = hourController3.value.text;
      });
      hourController4.addListener(() {
        dateProvider.hSalidaCampo = formatterU.stringToTimeofDate(hourController4.value.text);
        regisProv.registro.hSalida = hourController4.value.text;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    dateController1.dispose();
    dateController2.dispose();
    dateController3.dispose();
    dateController4.dispose();

    hourController1.dispose();
    hourController2.dispose();
    hourController3.dispose();
    hourController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final regisProv = Provider.of<RegisProv>(context, listen: true);
    final casosProv = Provider.of<CasosProv>(context, listen: false);
      
    Size size = MediaQuery.of(context).size;
    ExpresionesRegulares regExpresion = ExpresionesRegulares();
    return Column(
      children: [
        const HeaderFormW(title: "REGISTRO DE GUÍA - II", descripcion: "Llene los datos de la guía de Campo"),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              height: 1000,
              color: Colors.amber.withOpacity(0),
              margin: const EdgeInsets.only(right: 10, left: 10),
              child: Form(
                key: widget.formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: <Widget>[
                    InputW(
                      suffixText: '(${casosProv.paramCase1.undTon})',
                      labelText: 'Cantidad',
                      initialValue: regisProv.registro.cantidad,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        regisProv.registro.cantidad = value;
                      },
                      style: AppTheme.estiloInput,
                      contentPadding: const EdgeInsetsDirectional.fromSTEB(0, 15, 20, 15),
                      validator: (value) {
                        if (value!.isEmpty) return "El campo no puede estar vacio";
                        if (!regExpresion.esNumericoODecimalPositivo(value)) return "No es un número válido";
                        if (double.parse(value) == 0) {
                          return "Tiene que ser mayor que 0";
                        } else {
                          return null;
                        }
                      },
                    ),
                    DropDownButtonLabelW(
                      title: 'Tipo de Alce',
                      showLabel: true,
                      items: regisProv.listaTipoAlce,
                      value: regisProv.ddbtn2,
                      onChanged: (value) {
                        if (value != null) {
                          regisProv.ddbtn2 = value;
                          regisProv.validar1 = true;
                          regisProv.registro.tipAlce = value.label;
                        }
                      },
                      color: Colors.black,
                      vacio: "Tipo de Alce",
                    ),
                    DropDownButtonLabelW(
                      title: 'Maquinaria',
                      items: regisProv.listaMaquinaria,
                      value: regisProv.ddbtn3,
                      onChanged: (value) {
                        if (value != null) {
                          regisProv.ddbtn3 = value;
                          regisProv.validar1 = true;
                          regisProv.registro.maquinaria = value.value;
                        }
                      },
                      color: Colors.black,
                      vacio: "Maquinaria de Alce",
                    ),
                    InputW(
                      labelText: 'DNI Operador',
                      hintText: 'Escriba el DNI aquí ...',
                      hintStyle: AppTheme.hintStyle(),
                      initialValue: regisProv.registro.codOperador,
                      onChanged: (value) {
                        regisProv.registro.codOperador = value;
                        regisProv.validar1 = false;
                      },
                      maxLength: 15,
                      inputFormatters: [UpperCaseTextFormatter()],
                      style: AppTheme.estiloInput,
                    ),
                    DateHourPickerW(
                      title: "Llegada a Campo",
                      width: (size.width - 40),
                      initialDate: regisProv.fArriboCampo,
                      hourController: hourController1,
                      dateController: dateController1,
                      initialHour: regisProv.hArriboCampo,
                    ),
                    DateHourPickerW(
                      title: "Inicio de Alce",
                      width: (size.width - 40),
                      initialDate: regisProv.fInicioAlce,
                      hourController: hourController2,
                      dateController: dateController2,
                      initialHour: regisProv.hInicioAlce,
                    ),
                    DateHourPickerW(
                      title: "Fin de alce",
                      width: (size.width - 40),
                      initialDate: regisProv.fFinAlce,
                      hourController: hourController3,
                      dateController: dateController3,
                      initialHour: regisProv.hFinAlce,
                    ),
                    DateHourPickerW(
                      title: "Salida Campo",
                      width: (size.width - 40),
                      initialDate: regisProv.fSalidaCampo,
                      hourController: hourController4,
                      dateController: dateController4,
                      initialHour: regisProv.hSalidaCampo,
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
