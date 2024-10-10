import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("fifth"),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Image.network(
                    "https://th.bing.com/th/id/OIP.65vUdiM5kBxkLGRjJ2GtPQHaHa?w=163&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
              ),
              SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.network(
                      "https://th.bing.com/th/id/OIP.Gsph50fitf8JOqgFN2UnrwHaHa?w=161&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7")),
            ],
          ),
        ),
      ),
    );
  }
}

