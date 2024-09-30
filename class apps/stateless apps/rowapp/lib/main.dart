import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
       appBar: AppBar(
        title: const Text("row app"),
        centerTitle: true,
        backgroundColor: Colors.blue,
       ),
       body: Center( child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         
        Container(
          width: 100,
          height: 100,
          color: Colors.amber),
         Container(
          width: 100,
          height: 100,
          color: Colors.red),
          Container(
          width: 100,
          height: 100,
          color: Colors.amber,

        ),
        ],),),),);
      
  }
}
