import 'package:qr_proyectobasedatos/src/models/qr_models.dart';
import 'package:url_launcher/url_launcher.dart';

AgregarScans(ModelQr scan) async {
  if (scan.tipo == "http") {
    if (await canLaunch(scan.valor)) {
      await launch(scan.valor);
    } else {
      throw "Could not launch";
    }
  } else {
    print("geolocalizacion");
  }
}
