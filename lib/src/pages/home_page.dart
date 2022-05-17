import 'package:flutter/material.dart';
import 'package:qr_proyectobasedatos/src/pages/page_direcciones.dart';
import 'package:qr_proyectobasedatos/src/pages/page_maps.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndexx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pagecentral(currentIndexx),
        bottomNavigationBar: _botomnavigationbar());
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

Widget _botomnavigationbar() {
  return BottomNavigationBar(
    currentIndex: currentIndexx,
    onTap: (index) {},
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.access_alarms_outlined), label: "Mapas"),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: "Direcciones"),
    ],
  );
}
