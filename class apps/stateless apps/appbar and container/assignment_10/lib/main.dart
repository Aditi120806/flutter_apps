import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          title: const Text("seventh",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black
          ),),
          centerTitle: true,
          backgroundColor: Colors.blue,),
          body: Center(
            child: Container(
              height: 200,
              width: 200,
              decoration:const BoxDecoration(
               borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30) ),
                color: Colors.amber
                
              ),
            ),
          )
      ),
    );
  }
}
