import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkConnectivityObserver{
  final _controller = StreamController<bool>();
  Stream<bool> get connectivityStream => _controller.stream;

  NetworkConnectivityObserver(){
    Connectivity().onConnectivityChanged.listen((event) {
       debugPrint("::: Network ::: onConnectivityChanged ::: $event");
      _controller.add(event[0] != ConnectivityResult.none);
    });
  }

  Future<bool> checkInternetStatus()async{
    final List<ConnectivityResult> result = await (Connectivity().checkConnectivity());
    if(result[0] == ConnectivityResult.none) {
       debugPrint("::: Network ::: checkInternetStatus ::: $result");
      return false;
    } else {
       debugPrint("::: Network ::: checkInternetStatus ::: $result");
      return true;
    }
  }
}
