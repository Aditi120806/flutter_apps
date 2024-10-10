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
          title: const Text("statis listview",
          style: TextStyle(
            fontWeight:FontWeight.w600,
            fontSize: 20,
            color: Colors.black
          ),
          ),
         centerTitle: true,
         backgroundColor: Colors.amber, ),
         body: ListView(
          children: [
            Container(
              height: 200,
              width: 200,
              color: Colors.purple,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.lightBlue,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.pinkAccent,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.yellowAccent,
            ),
          ],
          ),
      ),
    );
  }
}
