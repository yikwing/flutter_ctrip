import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  final Widget child;

  TravelPage({Key key, this.child}) : super(key: key);

  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TravelPage'),
      ),
      body: Center(
        child: Text('TravelPage'),
      ),
    );
  }
}
