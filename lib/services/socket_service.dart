import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

//manejar los estados del server
enum ServerStatus { Online, Offline, Connecting }

//maxin - with
class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;

  ServerStatus get serverStatus => this._serverStatus;

  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    IO.Socket socket = IO.io('http://localhost:3001/', {
      'transports': ['websocket'],
      'autoConnect': true
    });
    socket.onConnect((_) {
      print('connect');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    socket.onDisconnect((_) {
      print('disconnect');
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
    // socket.on('nuevo-mensaje', (payload) {
    //   print('nuevo-mensaje:');
    //   print('nombre: ' + payload['nombre']);
    //   print('apellido: ' + payload['apellido']);
    // });
  }
}
