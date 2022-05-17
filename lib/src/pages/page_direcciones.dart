import 'package:flutter/material.dart';

class PageDirection extends StatefulWidget {
  PageDirection({Key? key}) : super(key: key);

  @override
  State<PageDirection> createState() => _PageDirectionState();
}

class _PageDirectionState extends State<PageDirection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Hello Direction"),
    ));
  }
}
