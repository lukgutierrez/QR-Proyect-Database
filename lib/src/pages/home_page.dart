import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qr_proyectobasedatos/src/models/qr_models.dart';
import 'package:qr_proyectobasedatos/src/pages/page_direcciones.dart';
import 'package:qr_proyectobasedatos/src/pages/page_maps.dart';
import 'package:qr_proyectobasedatos/src/provider/db_provider.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndexx = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("APP QR DATABASE")),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add_a_photo))],
      ),
      body: _pagecentral(currentIndexx),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndexx,
        onTap: (index) {
          setState(() {
            currentIndexx = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarms_outlined), label: "Mapas"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              label: "Direcciones"),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.qr_code_2),
          onPressed: () {
            _QrScanner();
          }),
    );
  }
}

_QrScanner() async {
  String? FutureString = "https://www.google.com.mx/";
//   try {
//     FutureString = await scanner.scan();
//   } catch (e) {
//     FutureString = e.toString();
//   }
// }

  if (FutureString != null) {
    final scan = ModelQr(valor: FutureString, id: 3, tipo: FutureString);
    DBProvider.db.nuevoScan(scan);
  }
}

Widget _pagecentral(int paginaactual) {
  switch (paginaactual) {
    case 0:
      return PageDirection();
    case 1:
      return PageMapas();
    default:
      return PageMapas();
  }
}
