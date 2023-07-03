

import 'package:flutter/material.dart';

import '../../db/tranportista_db.dart';

class AllLocalFun extends ChangeNotifier{

  Future<bool> iniciarDB()async{
    await TranportistaDb.db.initDB();
    return true;
  }

  Future<bool> delete()async{
    await TranportistaDb.db.initDB();
    return true;
  }

}