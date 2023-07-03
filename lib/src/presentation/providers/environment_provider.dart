import 'package:reporte_guia/src/data/models/environment_model.dart';
import 'package:flutter/material.dart';

class EnviromentProvider with ChangeNotifier {
  //EnvironmentModel _env = EnvironmentModel(oraDomain: '', sapDomain: '', oraService: '', sapService: '', user: '', password: '');
  EnvironmentModel _env =EnvironmentModel(
    oraDomain: '', 
    sapDomain: '', 
    oraService: '', 
    sapService: '',
    authService: '',
    user: '', 
    password: '', 
    entidad: '',
    oraPath: '',
    sapPath: ''
  );

  set env(EnvironmentModel env){_env=env;notifyListeners();}
  EnvironmentModel get env=>_env;

}
