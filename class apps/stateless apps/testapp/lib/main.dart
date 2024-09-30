import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
       appBar:AppBar(
        title: const Text("first app"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        
       ),
       body: const Center(
        child: Text("incubators"),
       ),
      ),
    );
  }
}
