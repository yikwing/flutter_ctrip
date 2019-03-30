import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  final Widget child;

  MePage({Key key, this.child}) : super(key: key);

  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MePage'),
      ),
      body: Center(
        child: Text('MePage'),
      ),
    );
  }
}
