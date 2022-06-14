import 'dart:async';

import 'package:qr_proyectobasedatos/src/models/qr_models.dart';
import 'package:qr_proyectobasedatos/src/provider/db_provider.dart';

class PatronBloc {
  static final PatronBloc _privatebloc = new PatronBloc._internal();

  factory PatronBloc() {
    return _privatebloc;
  }

  PatronBloc._internal() {
    //Se obtiene los datos grabados en el scans
    obtenerScans();
  }

  final _scansController = StreamController.broadcast();
  get scansStream => _scansController.stream;
  dispose() {
    _scansController.close();
  }

  agregarScans(ModelQr scan) {
    DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }

  obtenerScans() async {
    _scansController.sink.add(DBProvider.db.getTodosScans());
  }

  borrarScans(int id) async {
    DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borrarScansTodos() async {
    DBProvider.db.deleteAll();
    obtenerScans();
  }
}
