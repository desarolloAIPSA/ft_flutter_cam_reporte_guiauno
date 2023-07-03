import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/app_theme.dart';
import '../../../../data/functions/local/transportista_local_fun.dart';
import '../../../../utils/expresiones_regulares.dart';
import '../../../../utils/formato_texto.dart';
import '../../../../utils/formatter.dart';
import '../../../providers/casos_provider.dart';
import '../../../providers/form_prov.dart';
import '../../../providers/registro_provider.dart';
import '../../../widgets/atomic/drop_down_button_label_widget.dart';
import '../../../widgets/atomic/input_widget.dart';
import '../../../widgets/atomic/label_container_widget.dart';
import '../../../widgets/compuesto/date_time_selector.dart';
import '../../../widgets/compuesto/header_forms.dart';

class FormGuiSimpleEt4 extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const FormGuiSimpleEt4({super.key, required this.formKey});

  @override
  State<FormGuiSimpleEt4> createState() => _FormGuiSimpleEt4State();
}

class _FormGuiSimpleEt4State extends State<FormGuiSimpleEt4> {
  //TextEditingController dateController1 = TextEditingController();
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
      final formProv = Provider.of<FormProvider>(context, listen: false);
      final tranportistaLocalFun = TranportistaLocalFun();
      //debugPrint("firsttime");
      //debugPrint("dateProvider.fArriboCampo: ${dateProvider.fArriboCampo}");
      //regisProv.registro.fArribo ??= dateProvider.fArriboCampo.toIso8601String();
      regisProv.registro.fIniAlce ??= dateProvider.fInicioAlce.toIso8601String();
      regisProv.registro.fFinAlce ??= dateProvider.fFinAlce.toIso8601String();
      regisProv.registro.fSalida ??= dateProvider.fSalidaCampo.toIso8601String();
      
      regisProv.registro.hArribo ??=  formatterU.timeOfDateToString(dateProvider.hArriboCampo);
      regisProv.registro.hIniAlce ??= formatterU.timeOfDateToString(dateProvider.hArriboCampo);
      regisProv.registro.hFinAlce ??= formatterU.timeOfDateToString(dateProvider.hArriboCampo);
      regisProv.registro.hSalida ??= formatterU.timeOfDateToString(dateProvider.hArriboCampo);


      /* dateController1.addListener(() {
        dateProvider.fArriboCampo = DateTime.parse(dateController1.value.text);
        regisProv.registro.fArribo = dateController1.value.text;
      }); */
      dateController2.addListener(() {
        dateProvider.fInicioAlce = DateTime.parse(dateController2.value.text);
        regisProv.registro.fIniAlce = dateController2.value.text;
        debugPrint('TEST listener ${regisProv.registro.fIniAlce}');
        //Actualizando
        formProv.localGuiSimp.valor = regisProv.registro.toRawJson();
        formProv.localGuiSimp.page = 2;
        tranportistaLocalFun.actualizarPorValorYPagina(model: formProv.localGuiSimp).then((value){
          debugPrint('TEST actualizar fIniAlce controller');
        });
      });
      dateController3.addListener(() {
        dateProvider.fFinAlce = DateTime.parse(dateController3.value.text);
        regisProv.registro.fFinAlce = dateController3.value.text;
        //Actualizando
        formProv.localGuiSimp.valor = regisProv.registro.toRawJson();
        formProv.localGuiSimp.page = 2;
        tranportistaLocalFun.actualizarPorValorYPagina(model: formProv.localGuiSimp).then((value){
          debugPrint('TEST actualizar fFinAlce controller');
        });
      });
      dateController4.addListener(() {
        dateProvider.fSalidaCampo = DateTime.parse(dateController4.value.text);
        regisProv.registro.fSalida = dateController4.value.text;
        //Actualizando
        formProv.localGuiSimp.valor = regisProv.registro.toRawJson();
        formProv.localGuiSimp.page = 2;
        tranportistaLocalFun.actualizarPorValorYPagina(model: formProv.localGuiSimp).then((value){
          debugPrint('TEST actualizar fSalida controller');
        });
      });

      /* hourController1.addListener(() {
        dateProvider.hArriboCampo = formatterU.stringToTimeofDate(hourController1.value.text);
        regisProv.registro.hArribo = hourController1.value.text;
        
      }); */
      hourController2.addListener(() {
        dateProvider.hInicioAlce = formatterU.stringToTimeofDate(hourController2.value.text);
        regisProv.registro.hIniAlce = hourController2.value.text;
        //Actualizando
        formProv.localGuiSimp.valor = regisProv.registro.toRawJson();
        formProv.localGuiSimp.page = 2;
        tranportistaLocalFun.actualizarPorValorYPagina(model: formProv.localGuiSimp).then((value){
          debugPrint('TEST actualizar hInicioAlce controller');
        });
      });
      hourController3.addListener(() {
        dateProvider.hFinAlce = formatterU.stringToTimeofDate(hourController3.value.text);
        regisProv.registro.hFinAlce = hourController3.value.text;
        //Actualizando
        formProv.localGuiSimp.valor = regisProv.registro.toRawJson();
        formProv.localGuiSimp.page = 2;
        tranportistaLocalFun.actualizarPorValorYPagina(model: formProv.localGuiSimp).then((value){
          debugPrint('TEST actualizar hInicioAlce controller');
        });
      });
      hourController4.addListener(() {
        dateProvider.hSalidaCampo = formatterU.stringToTimeofDate(hourController4.value.text);
        regisProv.registro.hSalida = hourController4.value.text;
        //Actualizando
        formProv.localGuiSimp.valor = regisProv.registro.toRawJson();
        formProv.localGuiSimp.page = 2;
        tranportistaLocalFun.actualizarPorValorYPagina(model: formProv.localGuiSimp).then((value){
          debugPrint('TEST actualizar hInicioAlce controller');
        });
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    //dateController1.dispose();
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
    final formProv = Provider.of<FormProvider>(context, listen: true);
    final tranportistaLocalFun = TranportistaLocalFun();
      
    Size size = MediaQuery.of(context).size;
    ExpresionesRegulares regExpresion = ExpresionesRegulares();
    return Column(
      children: [
        const HeaderFormW(title: "REGISTRO DE GUÍA - II", descripcion: "Llene los datos de la guía de Campo"),
        Expanded(
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
              behavior: HitTestBehavior.opaque,
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
                        onChanged: (value) async {
                          regisProv.registro.cantidad = value;
                          //new local updated
                          formProv.localGuiSimp.valor = regisProv.registro.toRawJson();
                          formProv.localGuiSimp.page = 2;
                          await tranportistaLocalFun.actualizarPorValorYPagina(model: formProv.localGuiSimp);
                          debugPrint('TEST localGuiSimp init : ${formProv.localGuiSimp.valor.toString()}');
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
                        onChanged: (value) async {
                          if (value != null) {
                            regisProv.ddbtn2 = value;
                            regisProv.validar1 = true;
                            regisProv.registro.tipAlce = value.label;
                            //new local updated
                            formProv.localGuiSimp.valor = regisProv.registro.toRawJson();
                            formProv.localGuiSimp.page = 2;
                            await tranportistaLocalFun.actualizarPorValorYPagina(model: formProv.localGuiSimp);
                          }
                        },
                        color: Colors.black,
                        vacio: "Tipo de Alce",
                      ),
                      DropDownButtonLabelW(
                        title: 'Maquinaria',
                        items: regisProv.listaMaquinaria,
                        value: regisProv.ddbtn3,
                        onChanged: (value) async {
                          if (value != null) {
                            regisProv.ddbtn3 = value;
                            regisProv.validar1 = true;
                            regisProv.registro.maquinaria = value.value;
                            //new local updated
                            formProv.localGuiSimp.valor = regisProv.registro.toRawJson();
                            formProv.localGuiSimp.page = 2;
                            await tranportistaLocalFun.actualizarPorValorYPagina(model: formProv.localGuiSimp);
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
                        onChanged: (value) async {
                          regisProv.registro.codOperador = value;
                          regisProv.validar1 = false;
                          //new local updated
                          formProv.localGuiSimp.valor = regisProv.registro.toRawJson();
                          formProv.localGuiSimp.page = 2;
                          await tranportistaLocalFun.actualizarPorValorYPagina(model: formProv.localGuiSimp);
                        },
                        maxLength: 15,
                        inputFormatters: [UpperCaseTextFormatter()],
                        style: AppTheme.estiloInput,
                      ),
                      Divider(thickness: 2, color: AppTheme.primaryColor, height: 15),
                      LabelContainerW(
                        icon: Icons.calendar_month,
                        title: 'Llegada a Campo',
                        value: '${formatterU.fechaCaseOne(regisProv.fArriboCampo.toIso8601String())} ${formatterU.timeOfDateToString(regisProv.hArriboCampo)}',
                        height: 50,
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
        ),
      ],
    );
  }
}
