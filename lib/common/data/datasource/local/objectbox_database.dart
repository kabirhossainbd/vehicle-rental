
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vehicle_rental_app/objectbox.g.dart';


class DatabaseService{
  static Store? _store;

  static Future<Store> getStore() async {
    if (_store == null) {
      try {
        final dir = await getApplicationDocumentsDirectory();
        final store = await initStore("${dir.path}/objectbox");
        _store = store;
      } catch (e) {
        debugPrint("ObjectBox Init Error: ${e.toString()}");
        rethrow;
      }
    } else {
      debugPrint("ObjectBox already initialized");
    }
    return _store!;
  }


  static Future<Store> initStore(String dirPath) async {
    if (Store.isOpen(dirPath)) {
      return Store.attach(getObjectBoxModel(), dirPath);
    }
    return openStore(directory: dirPath);
  }


  static void closeStore(){
    _store!.close();
    _store = null;
  }
}