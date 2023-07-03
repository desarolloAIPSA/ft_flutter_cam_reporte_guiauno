// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/db/transportista_db_model.dart';

class TranportistaDb {
  static final TranportistaDb db = TranportistaDb._();
  static Database? _databaseTransportistaCreated;
  TranportistaDb._();

  Future<Database> get database async {
    if (_databaseTransportistaCreated != null) return _databaseTransportistaCreated!;
    _databaseTransportistaCreated = await initDB();
    return _databaseTransportistaCreated!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'Transportista.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE Transportista(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          placa TEXT,
          nroGuia TEXT,
          valor TEXT,
          finternet CHAR(1),
          url TEXT,
          page INTEGER
        )
        ''');
      },
    );
  }



  Future<List<TranportistaDbModel>?> getAll() async {
    final db = await database;
    final res = await db.rawQuery('''
     select * from Transportista
    ''');
    return res.isNotEmpty ? res.map((s) => TranportistaDbModel.fromJson(s)).toList() : [];
  }

  Future<int> deleteById(int id) async {
    final db = await database;
    final res = await db.rawDelete('''DELETE FROM Transportista where id=$id ''');
    return res;
  }

  Future<int> insertar(TranportistaDbModel input) async {
    final db = await database;
    final res = await db.insert('Transportista', input.toJson());
    return res;
  }

  Future<int> conuntByPlaca(String placa) async {
    final db = await database;
    int? count = Sqflite.firstIntValue(await db.rawQuery('''SELECT COUNT(*) FROM Transportista t where t.placa='$placa' '''));
    return count!;
  }

Future<int> updateFInternet({required TranportistaDbModel modelInput}) async {
  final db = await database;
  final res = await db.update(
    'Transportista',
    {
      'finternet': modelInput.finternet,
    },
    where: 'id = ?',
    whereArgs: [modelInput.id],
  );
  return res;
}


Future<int> updateValueAndPage({required TranportistaDbModel modelInput}) async {
  final db = await database;
  final res = await db.update(
    'Transportista',
    {
      'valor': modelInput.valor,
      'page': modelInput.page,
    },
    where: 'id = ?',
    whereArgs: [modelInput.id],
  );
  return res;
}

Future<int> deleteByFlagInternet(String input) async {
  final db = await database;
  final res = await db.rawDelete('''DELETE FROM Transportista where finternet = '$input' ''');
  return res;
}









  Future<List<TranportistaDbModel>?> getUsuarioAndFInternet(String tipoUsuario, String finternet) async {
    final db = await database;
    final res = await db.rawQuery('''
     select * from Transportista t where t.tipoUsuario = '$tipoUsuario' and t.finternet = '$finternet'
    ''');
    return res.isNotEmpty ? res.map((s) => TranportistaDbModel.fromJson(s)).toList() : [];
  }

  /* Future<int> deleteByFlagInternet(String input) async {
    final db = await database;
    final res = await db.rawDelete('''DELETE FROM Transportista where finternet = '$input' ''');
    return res;
  } */


  Future<int> deleteByComposeId(String id) async {
    final db = await database;
    final res = await db.rawDelete('''DELETE FROM Transportista t where t.composeId = '$id' ''');
    return res;
  }


  Future<int> updateFlagInternet(String input) async{
    final db = await database;
    final res= await db.update('Transportista', {
      "finternet":'1'
    },where: 'composeId = ? ', whereArgs: [input]);
    return res;
  }


  Future<int> contarAll() async {
    final db = await database;
    int? count = Sqflite.firstIntValue(await db.rawQuery('''SELECT COUNT(*) FROM Transportista '''));
    return count!;
  }

  Future<int> contarById(String composeId) async {
    final db = await database;
    int? count = Sqflite.firstIntValue(await db.rawQuery('''SELECT COUNT(*) FROM Transportista where composeId = '$composeId' '''));
    return count!;
  }
}
