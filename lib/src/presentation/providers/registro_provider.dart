import 'package:reporte_guia/src/data/models/option_model.dart';
import 'package:flutter/material.dart';
import '../../config/constantes.dart';
import '../../data/models/ora/empresa_model.dart';
import '../../data/models/ora/lista_params_model.dart';
import '../../data/models/ora/flujo_datos1_model.dart';

class RegisProv with ChangeNotifier {
  //FlujoDatos1Model _registro = FlujoDatos1Model(placaVehiculo: '', placaTracto1: '', placaTracto2: '', brevete: '', emrpesaTransportista: '', ordenCosecha: '', codEmrpesaTransportista: '', breveteName: '', tipAlce: '01');
  FlujoDatos1Model _registro = ConstProy.dummyRegistro;

  bool _validar1 = false;
  bool _validar2 = false;
  bool _validar3 = false;
  bool _loading = false;
  int _etapa = 1;
  Option _ddbtn1 = Option(label: '', value: '');
  Option _ddbtn2 = Option(label: '', value: '');
  Option _ddbtn3 = Option(label: '', value: '');
  List<Option> _listaMaquinaria = [];
  List<Option> _listaTipoAlce = [];
  List<Option> _listOpcionEmpresa = [];

  DateTime _fArriboCampo = DateTime.now();
  DateTime _fInicioAlce = DateTime.now();
  DateTime _fFinAlce = DateTime.now();
  DateTime _fSalidaCampo = DateTime.now();

  TimeOfDay _hArriboCampo = TimeOfDay.now();
  TimeOfDay _hInicioAlce = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay _hFinAlce = TimeOfDay.now();
  TimeOfDay _hSalidaCampo = TimeOfDay.now();

  GlobalKey<FormState> formKey4 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  List<EmpresaOraModel> _listEmp = [];
  List<ListaParamsOraModel> _listParam = [];
  String _textLoading='Validando';

  Future<bool> isvalidForm4() async {
    debugPrint("TEST formKey4: ${formKey4.toString()}");
    debugPrint("TEST currentState: ${formKey4.currentState}");
    debugPrint("TEST isvalidForm4: ${formKey4.currentState?.validate()}");
    bool isValid = false;
  
    await Future.delayed(Duration.zero, () {
      isValid = formKey4.currentState?.validate() ?? false;
    });

    return isValid;
  }

  set textLoading(String textLoading) {
    _textLoading = textLoading;
    notifyListeners();
  }

  String get textLoading => _textLoading;

  set registro(FlujoDatos1Model registro) {
    _registro = registro;
    notifyListeners();
  }

  FlujoDatos1Model get registro => _registro;

  set validar1(bool validar1) {
    _validar1 = validar1;
    notifyListeners();
  }

  bool get validar1 => _validar1;

  set validar2(bool validar2) {
    _validar2 = validar2;
    notifyListeners();
  }

  bool get validar2 => _validar2;

  set validar3(bool validar3) {
    _validar3 = validar3;
    notifyListeners();
  }

  bool get validar3 => _validar3;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  bool get loading => _loading;

  set etapa(int etapa) {
    _etapa = etapa;
    notifyListeners();
  }

  int get etapa => _etapa;

  set ddbtn1(Option ddbtn1) {
    _ddbtn1 = ddbtn1;
    notifyListeners();
  }

  Option get ddbtn1 => _ddbtn1;

  set ddbtn2(Option ddbtn2) {
    _ddbtn2 = ddbtn2;
    notifyListeners();
  }

  Option get ddbtn2 => _ddbtn2;

  set ddbtn3(Option ddbtn3) {
    _ddbtn3 = ddbtn3;
    notifyListeners();
  }

  Option get ddbtn3 => _ddbtn3;

  set listaMaquinaria(List<Option> listaMaquinaria) {
    _listaMaquinaria = listaMaquinaria;
    notifyListeners();
  }

  List<Option> get listaMaquinaria => _listaMaquinaria;

  set listaTipoAlce(List<Option> listaTipoAlce) {
    _listaTipoAlce = listaTipoAlce;
    notifyListeners();
  }

  List<Option> get listaTipoAlce => _listaTipoAlce;

  set fArriboCampo(DateTime fArriboCampo) {
    _fArriboCampo = fArriboCampo;
    notifyListeners();
  }

  set listOpcionEmpresa(List<Option> listOpcionEmpresa) {
    _listOpcionEmpresa = listOpcionEmpresa;
    notifyListeners();
  }

  List<Option> get listOpcionEmpresa => _listOpcionEmpresa;

  DateTime get fArriboCampo => _fArriboCampo;

  set fInicioAlce(DateTime fInicioAlce) {
    _fInicioAlce = fInicioAlce;
    notifyListeners();
  }

  DateTime get fInicioAlce => _fInicioAlce;

  set fFinAlce(DateTime fFinAlce) {
    _fFinAlce = fFinAlce;
    notifyListeners();
  }

  DateTime get fFinAlce => _fFinAlce;

  set fSalidaCampo(DateTime fSalidaCampo) {
    _fSalidaCampo = fSalidaCampo;
    notifyListeners();
  }

  DateTime get fSalidaCampo => _fSalidaCampo;

  set hArriboCampo(TimeOfDay hArriboCampo) {
    _hArriboCampo = hArriboCampo;
    notifyListeners();
  }

  TimeOfDay get hArriboCampo => _hArriboCampo;

  set hInicioAlce(TimeOfDay hInicioAlce) {
    _hInicioAlce = hInicioAlce;
    notifyListeners();
  }

  TimeOfDay get hInicioAlce => _hInicioAlce;

  set hFinAlce(TimeOfDay hFinAlce) {
    _hFinAlce = hFinAlce;
    notifyListeners();
  }

  TimeOfDay get hFinAlce => _hFinAlce;

  set hSalidaCampo(TimeOfDay hSalidaCampo) {
    _hSalidaCampo = hSalidaCampo;
    notifyListeners();
  }

  TimeOfDay get hSalidaCampo => _hSalidaCampo;

  set listEmp(List<EmpresaOraModel> listEmp) {
    _listEmp = listEmp;
    notifyListeners();
  }

  List<EmpresaOraModel> get listEmp => _listEmp;

  set listParam(List<ListaParamsOraModel> listParam) {
    _listParam = listParam;
    notifyListeners();
  }

  List<ListaParamsOraModel> get listParam => _listParam;
}
