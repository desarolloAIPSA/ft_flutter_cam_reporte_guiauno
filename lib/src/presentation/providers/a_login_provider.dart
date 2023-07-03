import 'package:flutter/cupertino.dart';

import '../../domain/entities/a_auth_model.dart';
import '../../domain/entities/login_model.dart';
import '../../data/models/option_model.dart';

class LoginProvider extends ChangeNotifier {
  LoginModel _modelo = LoginModel(empresa: Option(label: '04', value: 'AGRO INDUSTRIAL PARAMONGA S.A.A'), password: "donenrique1", recordar: false, usuario: "dgiral", grupo: 'GRE_CANA');
  AuthModel _auth = AuthModel(estado: false, user: '', nombre: '',nrodoc: '');
  bool _diparadorLoginProvider = false;
  bool _loading = false;
  bool _cerrando = false;
  bool _controlPass = true;
  Option _empresa = Option(label: '04', value: 'AIPSA');
  int _selectedIndex = 2;

  set selectedIndex(int selectedIndex) {
    _selectedIndex = selectedIndex;
    notifyListeners();
  }
  int get selectedIndex => _selectedIndex;


  set auth(AuthModel auth) {
    _auth = auth;
    notifyListeners();
  }
  AuthModel get auth => _auth;


  set modelo(LoginModel modelo) {
    _modelo = modelo;
    notifyListeners();
  }

  LoginModel get modelo => _modelo;

  bool get diparadorLoginProvider => _diparadorLoginProvider;
  set diparadorLoginProvider(bool diparadorLoginProvider) {
    _diparadorLoginProvider = diparadorLoginProvider;
    notifyListeners();
  }

  bool get loading => _loading;
  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  bool get cerrando => _cerrando;
  set cerrando(bool cerrando) {
    _cerrando = cerrando;
    notifyListeners();
  }

  Option get empresa => _empresa;
  set empresa(Option empresa) {
    _empresa = empresa;
    notifyListeners();
  }

  bool get controlPass => _controlPass;
  set controlPass(bool controlPass) {
    _controlPass = controlPass;
    notifyListeners();
  }
}
