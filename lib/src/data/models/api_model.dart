// ignore_for_file: overridden_fields, non_constant_identifier_names


import 'dart:convert';

String ApiModelToJson(ApiModel data) => json.encode(data.toJson());

class ApiModel<T> extends GenericModel<T> {
  
  @override
  String mensaje;

  @override
  bool estado;

  @override
  int code;
  
  @override
  T data;

  ApiModel({required this.mensaje, required this.estado,required this.code, required this.data});

  String toRawJson() => json.encode(toJson());

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': mensaje,
      'estado': estado,
      'code': code,
      'data': data,
    };
  }

  @override
  T fromJson(Map<String, dynamic> json) {
    mensaje = json['mensaje'];
    estado = json['estado'];
    code = json['code'];
    data = json['data'] as T;
    return this.data;
  }
}

abstract class GenericModel<T> {
  String mensaje ='';
  bool estado    =false;
  int   code     =200;
  late T data;
  
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}