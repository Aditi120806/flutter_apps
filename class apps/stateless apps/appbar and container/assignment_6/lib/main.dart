import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sixth"),
          backgroundColor: Colors.blue,
        ),
        body: ListView(children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
                width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.amber,
              ),
              const SizedBox(
                height: 20,
                width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 20,
                width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ),
              const SizedBox(
                height: 20,
                width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              const SizedBox(
                height: 20,
                width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
              ),
              const SizedBox(
                height: 20,
                width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.pink,
              ),
              const SizedBox(
                height: 20,
                width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.cyan,
              ),
              const SizedBox(
                height: 20,
                width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.indigo,
              ),
              const SizedBox(
                height: 20,
                width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
                width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.teal,
              ),
              const SizedBox(
                height: 20,
                width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.deepOrange,
              ),
              const SizedBox(
                height: 20,
                width: 10,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
