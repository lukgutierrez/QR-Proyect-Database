import 'package:flutter/material.dart';
import 'package:qr_proyectobasedatos/src/bloc/patron_bloc.dart';
import 'package:qr_proyectobasedatos/src/models/qr_models.dart';
import 'package:qr_proyectobasedatos/src/utils/utils.dart';

class PageMapas extends StatefulWidget {
  @override
  State<PageMapas> createState() => _PageMapasState();
}

class _PageMapasState extends State<PageMapas> {
  final patronBloc = PatronBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ModelQr>>(
      stream: patronBloc.scansStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text("Cargando....."),
          );
        }
        final scans = snapshot.data;
        //PROBLEMA CON LENGT Y FUTURE BUILDER
        if (scans.length == 0) {
          return Center(
            child: Text("Defoult Information"),
          );
        }

        return ListView.builder(
            //AQUI TAMBIEN INFLUYE EL PROBLEMA
            itemCount: scans.length,
            itemBuilder: (context, i) => Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                ),
                onDismissed: (direction) => patronBloc.borrarScans(scans[i].id),
                child: ListTile(
                  //AQUI TAMBIEN
                  title: Text(scans[i].valor),
                  leading: Icon(Icons.abc_sharp),
                  trailing: Icon(Icons.navigate_next_outlined),
                  onTap: () => AgregarScans(scans[i]),
                )));
      },
    );
  }
}
