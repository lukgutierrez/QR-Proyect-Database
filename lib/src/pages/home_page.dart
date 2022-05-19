import 'package:flutter/material.dart';
import 'package:qr_proyectobasedatos/src/pages/page_direcciones.dart';
import 'package:qr_proyectobasedatos/src/pages/page_maps.dart';

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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit))],
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
          child: Icon(Icons.accessibility_new), onPressed: () {}),
    );
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
