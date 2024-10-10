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
          title: const Text(
            "First",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          backgroundColor: Colors.blue,
          actions: const [
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(Icons.shopping_cart, color: Colors.black)
          ],
        ),
      ),
    );
  }
}
