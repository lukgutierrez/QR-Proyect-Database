import 'package:flutter/material.dart';
import 'package:qr_proyectobasedatos/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'MATERIAL MASTER BRO',
      initialRoute: "Home",
      routes: {"Home": (BuildContext context) => HomePage()},
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
