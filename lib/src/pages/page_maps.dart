import 'package:flutter/material.dart';

class PageMapas extends StatefulWidget {
  PageMapas({Key? key}) : super(key: key);

  @override
  State<PageMapas> createState() => _PageMapasState();
}

class _PageMapasState extends State<PageMapas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Hello Maps"),
    ));
  }
}
