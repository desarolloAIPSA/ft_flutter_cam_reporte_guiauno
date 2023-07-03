import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/environment_model.dart';
import '../models/uri_model.dart';


class SapReposiroty extends ChangeNotifier{
  

  Future<Response> getRegister(EnvironmentModel input, UriModel parametros) async {
    final uri = Uri.https(input.sapDomain, input.sapPath, parametros.queryParameters);
    Map<String, String>? cabeceras1 = {"charset": "utf-8","authorization":input.basicAuth};
    debugPrint(uri.toString());
    try {
      return await http.get(uri, headers: cabeceras1);
    } catch (e) {
      debugPrint('e: $e');
      return Response('El servidor no respondio a tiempo', 500);
    }
  }

  
}