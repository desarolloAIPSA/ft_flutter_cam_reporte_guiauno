

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/environment_model.dart';
import '../models/uri_model.dart';

class OraReposiroty extends ChangeNotifier{

  static const Map<String, String> _cabeceras = {"charset": "utf-8", "Accept-Charset": "utf-8"};
  Map<String, String>? cabeceras2 = {"Content-Type": "application/json"};
  Future<Response> getWithQuery(EnvironmentModel input, UriModel parametros) async {
    final uri = Uri.https(input.oraDomain, input.oraPath, parametros.queryParameters);
    debugPrint('TEST uri: ${uri.toString()}');
    try {
      return await http.get(uri, headers: _cabeceras);
    } catch (e) {
      debugPrint('e: $e');
      return Response('El servidor no respondio a tiempo', 500);
    }
  }

  Future<Response> getWithNoQuery(EnvironmentModel input) async {
    final uri = Uri.https(input.oraDomain, input.oraPath);
    debugPrint(uri.toString());
    try {
      return await http.get(uri, headers: _cabeceras);
    } catch (e) {
      debugPrint('e: $e');
      return Response('El servidor no respondio a tiempo', 500);
    }
  }

  Future<Response> grabarRegistro(EnvironmentModel input, UriModel parametros) async {
    final uri = Uri.https(input.oraDomain, input.oraPath,parametros.queryParameters);
    debugPrint(uri.toString());
    try {
      return await http.post(uri, headers: cabeceras2, body: json.encode(parametros.bodyParameters.toJson()));
    } catch (e) {
      debugPrint('e: $e');
      return Response('El servidor no respondio a tiempo', 500);
    }
  }

  
}