import 'package:flutter/material.dart';

class bottom_navigation_bar extends StatefulWidget {
  const bottom_navigation_bar({Key? key}) : super(key: key);

  @override
  State<bottom_navigation_bar> createState() => _bottom_navigation_barState();
}

class _bottom_navigation_barState extends State<bottom_navigation_bar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Column(
        children: [
          Text('Bottom Navigation Bar')
        ],
      ),
    );
  }
}
