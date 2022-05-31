import 'package:flutter/material.dart';
import 'package:qr_proyectobasedatos/src/provider/db_provider.dart';
import 'package:qrscan/qrscan.dart';

class PageMapas extends StatefulWidget {
  PageMapas({Key? key}) : super(key: key);

  @override
  State<PageMapas> createState() => _PageMapasState();
}

class _PageMapasState extends State<PageMapas> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DBProvider.db.getTodosScans(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final scans = snapshot.data;
        if (scans.length == 0) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            itemCount: scans.length,
            itemBuilder: (context, i) => Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                ),
                onDismissed: (direction) =>
                    DBProvider.db.deleteScan(scans[i].id),
                child: ListTile(
                  title: Text(scans[i].valor),
                  leading: Icon(Icons.abc_sharp),
                  trailing: Icon(Icons.navigate_next_outlined),
                )));
      },
    );
  }
}
