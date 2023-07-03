import 'package:reporte_guia/src/data/models/environment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvType { aipsa,ingenio }

class ChargeEnvironmet extends ChangeNotifier {
  Future<EnvironmentModel> seleccionarParams({EnvType ambiente = EnvType.aipsa}) async {
    switch (ambiente) {
      case EnvType.aipsa:
        await dotenv.load(fileName: ".aip.env");
        break;
      case EnvType.ingenio:
        await dotenv.load(fileName: ".ing.env");
        break;
      default:
    }
    
    EnvironmentModel rpta = EnvironmentModel(
      oraDomain: dotenv.env['ORA_URL']!,
      sapDomain: dotenv.env['SAP_URL']!,
      oraService: dotenv.env['ORA_SEREVICE']!,
      sapService: dotenv.env['SAP_SERVICE']!,
      authService: dotenv.env['AUTH_SERVICE']!,
      user: dotenv.env['ODATA_USER']!,
      password: dotenv.env['ODATA_PASSWORD']!,
      oraPath: '',
      sapPath: '',
      entidad: ''
    );
    return rpta;
  }
}
