



import 'package:flutter/material.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({ Key? key }) : super(key: key);

  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boarding Screen'),
      ),
      body: Container(
        child: Text('barding screen'),
      ),
    );
  }
}