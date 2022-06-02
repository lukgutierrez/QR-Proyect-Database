import 'dart:async';

class PatronBloc {
  static final PatronBloc _privatebloc = new PatronBloc._internal();

  factory PatronBloc() {
    return _privatebloc;
  }

  PatronBloc._internal() {
    //Se obtiene los datos grabados en el scans
  }

  final _scansController = StreamController.broadcast();
  get scansStream => _scansController.stream;
  dispose() {
    _scansController?.close();
  }
}
